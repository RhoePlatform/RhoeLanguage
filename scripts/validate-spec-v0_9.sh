#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SPEC_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
WORK_ROOT="${RHOE_V09_VALIDATION_ROOT:-/tmp/rhoe_spec_v0_9_validation}"
PYTHON_BIN="${PYTHON_BIN:-python3}"

note() {
  printf '\n[%s] %s\n' "$(date '+%H:%M:%S')" "$1"
}

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Missing required command: $1" >&2
    exit 1
  }
}

note "Checking required tools"
require_cmd "$PYTHON_BIN"
require_cmd typst
require_cmd latexmk
require_cmd node

note "Preparing non-normative validation workspace"
rm -rf "$WORK_ROOT"
mkdir -p "$WORK_ROOT/typst" "$WORK_ROOT/latex"

note "JSON parse sweep"
"$PYTHON_BIN" - "$SPEC_ROOT" <<'PY'
from pathlib import Path
import json
import sys

root = Path(sys.argv[1])
ignored_parts = {".tmp", ".cache", ".docs-site-src", "site", ".venv", "node_modules"}
count = 0
for path in root.rglob("*.json"):
    if any(part in ignored_parts for part in path.relative_to(root).parts):
        continue
    json.loads(path.read_text())
    count += 1
print(f"JSON_OK {count}")
PY

note "Markdown relative-link integrity"
"$PYTHON_BIN" - "$SPEC_ROOT" <<'PY'
from pathlib import Path
import re
import sys

root = Path(sys.argv[1])
ignored_parts = {".tmp", ".cache", ".docs-site-src", "site", ".venv", "node_modules"}
pattern = re.compile(r"\[[^\]]+\]\(([^)#]+)(?:#[^)]+)?\)")
broken = []
markdown_files = [
    path for path in root.rglob("*.md")
    if not any(part in ignored_parts for part in path.relative_to(root).parts)
]

for path in markdown_files:
    text = path.read_text()
    for match in pattern.finditer(text):
        target = match.group(1)
        if target.startswith(("http://", "https://", "mailto:")):
            continue
        if target.startswith("/"):
            continue
        destination = (path.parent / target).resolve()
        if not destination.exists():
            broken.append((path, target))

print(f"MD_FILES {len(markdown_files)}")
print(f"BROKEN {len(broken)}")
if broken:
    for path, target in broken:
        print(f"BROKEN_LINK {path} -> {target}")
    raise SystemExit(1)
PY

note "Manifest and schema validation"
"$PYTHON_BIN" - "$SPEC_ROOT" <<'PY'
from pathlib import Path
import json
import sys

from jsonschema import Draft202012Validator

root = Path(sys.argv[1])

schemas = {
    "fixture": json.loads((root / "machine/schemas/fixture-suite-manifest-v0_9.schema.json").read_text()),
    "composition": json.loads((root / "machine/schemas/composition-grammar-pack-manifest-v0_9.schema.json").read_text()),
    "realization": json.loads((root / "machine/schemas/realization-pack-manifest-v0_9.schema.json").read_text()),
    "rhoejson": json.loads((root / "machine/schemas/rhoejson-canonical-v0_9.schema.json").read_text()),
}
validators = {name: Draft202012Validator(schema) for name, schema in schemas.items()}

fixture_manifest = json.loads((root / "fixtures/fixture-suite-v0_9.json").read_text())
fixture_errors = list(validators["fixture"].iter_errors(fixture_manifest))
if fixture_errors:
    raise SystemExit(f"Fixture manifest errors: {fixture_errors[0].message}")
print("FIXTURE_MANIFEST PASS")

composition_example = json.loads((root / "machine/examples/stage-default.composition-grammar-pack.json").read_text())
composition_errors = list(validators["composition"].iter_errors(composition_example))
if composition_errors:
    raise SystemExit(f"Composition manifest errors: {composition_errors[0].message}")
print("COMPOSITION_MANIFEST PASS")

realization_count = 0
for manifest_path in sorted((root / "reference-packs").glob("*/manifest.json")):
    manifest_data = json.loads(manifest_path.read_text())
    realization_errors = list(validators["realization"].iter_errors(manifest_data))
    if realization_errors:
        raise SystemExit(f"Realization manifest errors in {manifest_path}: {realization_errors[0].message}")
    realization_count += 1
print(f"REALIZATION_MANIFESTS PASS {realization_count}")

valid_count = 0
for fixture_path in sorted((root / "fixtures/rhoejson/valid").glob("*.json")):
    data = json.loads(fixture_path.read_text())
    errors = list(validators["rhoejson"].iter_errors(data))
    if errors:
        raise SystemExit(f"Valid fixture failed schema validation: {fixture_path} -> {errors[0].message}")
    valid_count += 1
print(f"RHOEJSON_VALID PASS {valid_count}")

invalid_count = 0
for fixture_path in sorted((root / "fixtures/rhoejson/invalid").glob("*.json")):
    data = json.loads(fixture_path.read_text())
    errors = list(validators["rhoejson"].iter_errors(data))
    if not errors:
        raise SystemExit(f"Invalid fixture unexpectedly passed schema validation: {fixture_path}")
    invalid_count += 1
print(f"RHOEJSON_INVALID PASS {invalid_count}")
PY

note "Fixture manifest path resolution"
"$PYTHON_BIN" - "$SPEC_ROOT" <<'PY'
from pathlib import Path
import json
import sys

root = Path(sys.argv[1])
manifest = json.loads((root / "fixtures/fixture-suite-v0_9.json").read_text())
paths = [item["path"] for item in manifest.get("fixtures", []) if "path" in item]
missing = [path for path in paths if not (root / "fixtures" / path).exists()]

all_fixture_files = []
for path in (root / "fixtures").rglob("*"):
    if not path.is_file():
        continue
    relative = str(path.relative_to(root / "fixtures"))
    if relative in {"fixture-suite-v0_9.json", "00-fixtures-index.md"}:
        continue
    all_fixture_files.append(relative)

unlisted = sorted(path for path in all_fixture_files if path not in set(paths))

print(f"FIXTURE_PATHS {len(paths)}")
print(f"FIXTURE_MISSING {len(missing)}")
print(f"FIXTURE_UNLISTED {len(unlisted)}")
if missing or unlisted:
    for path in missing:
        print(f"MISSING_PATH {path}")
    for path in unlisted:
        print(f"UNLISTED_PATH {path}")
    raise SystemExit(1)
PY

note "Release-pack manifest integrity"
"$PYTHON_BIN" - "$SPEC_ROOT" <<'PY'
from pathlib import Path
import json
import sys

root = Path(sys.argv[1])
manifest_path = root / "machine/registries/rhoe-language-spec-release.json"
summary_path = root / "compiled/rhoe-spec-v0_9-release-pack.md"

manifest = json.loads(manifest_path.read_text())
required = {
    "id",
    "label",
    "packageKind",
    "version",
    "baselineVersion",
    "status",
    "authorityRepo",
    "authorityMode",
    "authoritativeEntrypoints",
    "machineArtifacts",
    "referencePackManifests",
    "compiledOutputs",
}
missing = sorted(required.difference(manifest))
if missing:
    raise SystemExit(f"Release manifest missing keys: {', '.join(missing)}")

if manifest["authorityRepo"] != "RhoeLanguage":
    raise SystemExit("Release manifest authorityRepo must be RhoeLanguage")
if manifest["baselineVersion"] != "0.9.0":
    raise SystemExit("Release manifest baselineVersion must be 0.9.0")
if manifest["status"] != "stable_authority_baseline":
    raise SystemExit("Release manifest status must be stable_authority_baseline")

paths = []
paths.extend(manifest["authoritativeEntrypoints"].values())
for bucket in ("schemas", "grammars", "registries", "examples"):
    paths.extend(manifest["machineArtifacts"][bucket])
paths.extend(manifest["referencePackManifests"])
paths.extend(manifest["compiledOutputs"])

missing_paths = [path for path in paths if not (root / path).exists()]
if missing_paths:
    raise SystemExit(f"Release manifest references missing files: {', '.join(missing_paths)}")
if not summary_path.exists():
    raise SystemExit("Release-pack summary is missing")

print("RELEASE_MANIFEST PASS")
print(f"RELEASE_SCHEMAS {len(manifest['machineArtifacts']['schemas'])}")
print(f"RELEASE_GRAMMARS {len(manifest['machineArtifacts']['grammars'])}")
print(f"RELEASE_REGISTRIES {len(manifest['machineArtifacts']['registries'])}")
print(f"RELEASE_PACKS {len(manifest['referencePackManifests'])}")
PY

note "Typst fixture compile"
"$PYTHON_BIN" - "$SPEC_ROOT" "$WORK_ROOT/typst" <<'PY'
from pathlib import Path
import subprocess
import sys

root = Path(sys.argv[1])
output_root = Path(sys.argv[2])
fixtures = sorted((root / "fixtures/rhoetypst/canonical").glob("*.typ")) + sorted((root / "fixtures/rhoetypst/inline").glob("*.typ"))
passes = 0

for source in fixtures:
    pdf_path = output_root / f"{source.stem}.pdf"
    completed = subprocess.run(
        ["typst", "compile", "--root", str(root), str(source), str(pdf_path)],
        capture_output=True,
        text=True,
    )
    if completed.returncode != 0 or not pdf_path.exists():
        sys.stderr.write(completed.stderr)
        raise SystemExit(f"Typst compile failed for {source.name}")
    print(f"TYPST_OK {source.name}")
    passes += 1

print(f"TYPST_PASS {passes}")
PY

note "LaTeX fixture compile"
"$PYTHON_BIN" - "$SPEC_ROOT" "$WORK_ROOT/latex" <<'PY'
from pathlib import Path
import subprocess
import sys

root = Path(sys.argv[1])
output_root = Path(sys.argv[2])
fixtures = sorted((root / "fixtures/rhoelatex/canonical").glob("*.tex")) + sorted((root / "fixtures/rhoelatex/inline").glob("*.tex"))
passes = 0

for source in fixtures:
    fixture_output = output_root / source.stem
    fixture_output.mkdir(parents=True, exist_ok=True)
    completed = subprocess.run(
        [
            "latexmk",
            "-pdf",
            "-interaction=nonstopmode",
            "-halt-on-error",
            f"-output-directory={fixture_output}",
            source.name,
        ],
        cwd=str(source.parent),
        capture_output=True,
        text=True,
    )
    pdf_path = fixture_output / f"{source.stem}.pdf"
    if completed.returncode != 0 or not pdf_path.exists():
        sys.stderr.write(completed.stdout)
        sys.stderr.write(completed.stderr)
        raise SystemExit(f"LaTeX compile failed for {source.name}")
    print(f"LATEX_OK {source.name}")
    passes += 1

print(f"LATEX_PASS {passes}")
PY

note "HTML structural verification"
"$PYTHON_BIN" - "$SPEC_ROOT" <<'PY'
from html.parser import HTMLParser
from pathlib import Path
import sys

root = Path(sys.argv[1])
files = sorted((root / "fixtures/rhoehtml/canonical").glob("*.html")) + sorted((root / "fixtures/rhoehtml/inline").glob("*.html"))

class Checker(HTMLParser):
    def __init__(self):
        super().__init__()
        self.nodes = 0
        self.classes = 0
        self.custom = 0

    def handle_starttag(self, tag, attrs):
        if tag.startswith("rhoe-"):
            self.custom += 1
        attr_map = dict(attrs)
        if "data-rhoe-node" in attr_map:
            self.nodes += 1
        if "class" in attr_map and "rhoe-" in attr_map["class"]:
            self.classes += 1

count = 0
for path in files:
    checker = Checker()
    checker.feed(path.read_text())
    if checker.nodes == 0 or checker.classes == 0 or checker.custom != 0:
        raise SystemExit(
            f"HTML structural verification failed for {path.name}: "
            f"nodes={checker.nodes} classes={checker.classes} custom={checker.custom}"
        )
    print(f"HTML_OK {path.name}")
    count += 1

print(f"HTML_PASS {count}")
PY

note "Shipped JS syntax validation"
node --check "$SPEC_ROOT/reference-packs/rhoeHtmlCore/rhoe-core.js"
echo "JS_OK rhoe-core.js"

note "Validation complete"
echo "WORK_ROOT $WORK_ROOT"
