#!/usr/bin/env python3

from __future__ import annotations

import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PUBLIC_VERSION = "0.9.0"
VERSION_STEM = "v0_9"

IGNORED_PARTS = {
    ".git",
    ".tmp",
    ".cache",
    ".docs-site-src",
    "site",
    ".venv",
    "node_modules",
    "__pycache__",
}

TEXT_SCAN_EXCLUDED_FILES = {
    "scripts/validate-publication-readiness.py",
}

REQUIRED_FILES = [
    "README.md",
    "00-index.md",
    "SPECIFICATION-CONVENTIONS.md",
    "VERSIONING.md",
    "GLOSSARY.md",
    "REFERENCES.md",
    "LICENSE",
    "NOTICE",
    "CONTRIBUTING.md",
    "GOVERNANCE.md",
    "SECURITY.md",
    "CODE_OF_CONDUCT.md",
    "mkdocs.yml",
    "requirements-docs.txt",
    ".github/workflows/maintainer-gate.yml",
    ".github/workflows/pages.yml",
    "scripts/build-release-pack.py",
    "scripts/build-docs-site.py",
    "scripts/validate-docs-site.sh",
    "scripts/validate-publication-readiness.py",
    "scripts/validate-publication-readiness.sh",
    "scripts/validate-spec-v0_9.sh",
    "scripts/verify-cutover.sh",
    "compiled/rhoe-spec-v0_9-release-pack.md",
    "fixtures/fixture-suite-v0_9.json",
    "machine/registries/rhoe-language-spec-release.json",
    "machine/schemas/rhoejson-canonical-v0_9.schema.json",
    "machine/schemas/fixture-suite-manifest-v0_9.schema.json",
    "machine/schemas/composition-grammar-pack-manifest-v0_9.schema.json",
    "machine/schemas/realization-pack-manifest-v0_9.schema.json",
]

LEGACY_VERSION = "0" + r"\.51"
LEGACY_STEM = "v0" + "_51"
LEGACY_BARE_STEM = "0" + "_51"
LEGACY_VALIDATE = "validate-spec-" + LEGACY_STEM
LEGACY_RELEASE_PACK = "rhoe-spec-" + LEGACY_STEM
LEGACY_FIXTURE_SUITE = "fixture-suite-" + LEGACY_STEM
LEGACY_SPEC_DIR = "spec-" + LEGACY_STEM
PRIVATE_SOURCE_REPO = "RhoeLanguage" + "Spec"
PRIVATE_SOURCE_REMOTE = "RhoePlatform/" + PRIVATE_SOURCE_REPO
LOCAL_RHOE_ROOT = "~/" + "Rhoe"
LOCAL_SUITE_ROOT = "~/" + "Rhoe" + "Suite"
SUITE_NAME = "Rhoe" + "Suite"
OLD_LICENSE = "MIT" + " License"
OLD_ORG = "Rhoe" + "AI"
INTERNAL_VERSION = "0" + ".0.0-internal"
LINEAGE_FILE = "historical" + "-lineage.md"
MIGRATIONS_DIR = "migra" + "tions"
AUDITS_DIR = "aud" + "its"
QA_AUTHORITY_KEY = "qa" + "Authority"

FORBIDDEN_PATH_NAMES = {
    ".DS_Store",
    ".build",
    "Package.resolved",
    AUDITS_DIR,
    MIGRATIONS_DIR,
    LINEAGE_FILE,
}

FORBIDDEN_TEXT_PATTERNS = [
    (
        "old version",
        re.compile(
            "|".join(
                [
                    LEGACY_VERSION,
                    LEGACY_STEM,
                    LEGACY_BARE_STEM,
                    "v" + LEGACY_VERSION,
                    LEGACY_VALIDATE,
                ]
            )
        ),
    ),
    (
        "old release stem",
        re.compile("|".join([LEGACY_RELEASE_PACK, LEGACY_FIXTURE_SUITE, LEGACY_SPEC_DIR])),
    ),
    (
        "private source identity",
        re.compile("|".join([PRIVATE_SOURCE_REPO, PRIVATE_SOURCE_REMOTE])),
    ),
    (
        "machine-local path",
        re.compile("|".join([LOCAL_RHOE_ROOT, LOCAL_SUITE_ROOT, SUITE_NAME])),
    ),
    (
        "license drift",
        re.compile("|".join([OLD_LICENSE, OLD_ORG, re.escape(INTERNAL_VERSION)])),
    ),
    (
        "removed provenance surface",
        re.compile("|".join([LINEAGE_FILE.removesuffix(".md"), MIGRATIONS_DIR + "/", AUDITS_DIR + "/", QA_AUTHORITY_KEY])),
    ),
]

MARKDOWN_SCOPE_PREFIXES = (
    "part-0-foundation/",
    "part-1-author-surfaces/",
    "part-2-realization-runtime/",
)

MARKDOWN_SCOPE_FILES = {
    "README.md",
    "00-index.md",
    "SPECIFICATION-CONVENTIONS.md",
    "VERSIONING.md",
    "GLOSSARY.md",
    "REFERENCES.md",
    "CONTRIBUTING.md",
    "GOVERNANCE.md",
    "SECURITY.md",
    "fixtures/00-fixtures-index.md",
    "reference-packs/00-reference-packs-index.md",
    "machine/grammars/README.md",
    "compiled/rhoe-spec-v0_9-release-pack.md",
}


def relative(path: Path) -> str:
    return path.relative_to(ROOT).as_posix()


def is_ignored(path: Path) -> bool:
    return any(part in IGNORED_PARTS for part in path.relative_to(ROOT).parts)


def text_files() -> list[Path]:
    files: list[Path] = []
    for path in ROOT.rglob("*"):
        if not path.is_file() or is_ignored(path):
            continue
        if path.suffix.lower() in {".md", ".json", ".yml", ".yaml", ".py", ".sh", ".txt", ".css", ".js", ".tex", ".typ", ".peg", ".ebnf", ".html", ".sty", ".cls"}:
            files.append(path)
    return files


def fail(message: str) -> None:
    raise SystemExit(message)


def check_required_files() -> None:
    missing = [path for path in REQUIRED_FILES if not (ROOT / path).is_file()]
    if missing:
        fail("Missing required public files: " + ", ".join(missing))


def check_forbidden_paths() -> None:
    offenders: list[str] = []
    for path in ROOT.rglob("*"):
        if is_ignored(path):
            continue
        if path.name in FORBIDDEN_PATH_NAMES:
            offenders.append(relative(path))
    if offenders:
        fail("Forbidden public artifacts found: " + ", ".join(sorted(offenders)))


def check_forbidden_text() -> None:
    offenders: list[str] = []
    for path in text_files():
        if relative(path) in TEXT_SCAN_EXCLUDED_FILES:
            continue
        text = path.read_text(encoding="utf-8", errors="ignore")
        for label, pattern in FORBIDDEN_TEXT_PATTERNS:
            if pattern.search(text):
                offenders.append(f"{relative(path)} ({label})")
    if offenders:
        fail("Forbidden public text found: " + ", ".join(sorted(offenders)))


def markdown_files_for_heading_checks() -> list[Path]:
    files: list[Path] = []
    for path in ROOT.rglob("*.md"):
        if is_ignored(path):
            continue
        rel = relative(path)
        if rel in MARKDOWN_SCOPE_FILES or rel.startswith(MARKDOWN_SCOPE_PREFIXES):
            files.append(path)
    return sorted(files)


def slugify(heading: str) -> str:
    heading = re.sub(r"`([^`]+)`", r"\1", heading)
    heading = heading.lower()
    heading = re.sub(r"[^a-z0-9]+", "-", heading)
    return heading.strip("-")


def check_markdown_headings() -> None:
    errors: list[str] = []
    for path in markdown_files_for_heading_checks():
        rel = relative(path)
        headings: list[tuple[int, str, int]] = []
        in_fence = False
        fence_marker = ""
        for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
            fence_match = re.match(r"^(`{3,}|~{3,})", line)
            if fence_match:
                marker = fence_match.group(1)
                if not in_fence:
                    in_fence = True
                    fence_marker = marker[0]
                elif marker.startswith(fence_marker):
                    in_fence = False
                    fence_marker = ""
                continue
            if in_fence:
                continue
            match = re.match(r"^(#{1,6})\s+(.+?)\s*$", line)
            if match:
                headings.append((len(match.group(1)), match.group(2), line_number))
        if not headings:
            errors.append(f"{rel}: no Markdown headings")
            continue
        if headings[0][0] != 1:
            errors.append(f"{rel}: first heading must be H1")
        h1_count = sum(1 for level, _, _ in headings if level == 1)
        if h1_count != 1:
            errors.append(f"{rel}: expected exactly one H1, found {h1_count}")
        previous = headings[0][0]
        seen_slugs: set[str] = set()
        for level, title, line_number in headings:
            if level > previous + 1:
                errors.append(f"{rel}:{line_number}: heading jumps from H{previous} to H{level}")
            previous = level
            slug = slugify(title)
            if slug in seen_slugs:
                errors.append(f"{rel}:{line_number}: duplicate heading anchor '{slug}'")
            seen_slugs.add(slug)
    if errors:
        fail("Markdown heading checks failed:\n" + "\n".join(errors))


def check_release_manifest() -> None:
    manifest_path = ROOT / "machine/registries/rhoe-language-spec-release.json"
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    expected = {
        "id": "rhoe.language-spec.v0_9",
        "label": "Rhoe Language Specification v0.9.0",
        "version": PUBLIC_VERSION,
        "baselineVersion": PUBLIC_VERSION,
        "authorityRepo": "RhoeLanguage",
    }
    mismatches = [
        f"{key}={manifest.get(key)!r}, expected {value!r}"
        for key, value in expected.items()
        if manifest.get(key) != value
    ]
    if mismatches:
        fail("Release manifest identity mismatch: " + "; ".join(mismatches))

    entrypoints = manifest.get("authoritativeEntrypoints", {})
    for required in ("specification_conventions", "versioning", "glossary", "references"):
        if required not in entrypoints:
            fail(f"Release manifest missing authoritative entrypoint: {required}")

    paths: list[str] = []
    paths.extend(entrypoints.values())
    for bucket in ("schemas", "grammars", "registries", "examples"):
        paths.extend(manifest["machineArtifacts"][bucket])
    paths.extend(manifest["referencePackManifests"])
    paths.extend(manifest["compiledOutputs"])
    missing = [path for path in paths if not (ROOT / path).exists()]
    if missing:
        fail("Release manifest references missing paths: " + ", ".join(missing))


def check_docs_infrastructure() -> None:
    mkdocs = (ROOT / "mkdocs.yml").read_text(encoding="utf-8")
    for required in ("site_name:", "docs_dir: .docs-site-src", "theme:", "name: material"):
        if required not in mkdocs:
            fail(f"mkdocs.yml missing required setting: {required}")
    pages = (ROOT / ".github/workflows/pages.yml").read_text(encoding="utf-8")
    for required in ("actions/deploy-pages@v4", "python -m mkdocs build --strict"):
        if required not in pages:
            fail(f"Pages workflow missing required step: {required}")


def main() -> None:
    check_required_files()
    check_forbidden_paths()
    check_forbidden_text()
    check_markdown_headings()
    check_release_manifest()
    check_docs_infrastructure()
    print(f"PUBLICATION_READINESS_PASS version={PUBLIC_VERSION} stem={VERSION_STEM}")


if __name__ == "__main__":
    main()
