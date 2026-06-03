#!/usr/bin/env python3

from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MANIFEST_PATH = ROOT / "machine" / "registries" / "rhoe-language-spec-release.json"
SUMMARY_PATH = ROOT / "compiled" / "rhoe-spec-v0_9-release-pack.md"


def relative(path: Path) -> str:
    return path.relative_to(ROOT).as_posix()


def sorted_files(pattern: str, *, exclude: set[str] | None = None) -> list[str]:
    excluded = exclude or set()
    return sorted(
        relative(path)
        for path in ROOT.glob(pattern)
        if path.is_file() and relative(path) not in excluded
    )


def require_paths(paths: list[str]) -> None:
    missing = [path for path in paths if not (ROOT / path).exists()]
    if missing:
        raise SystemExit(f"Missing release-pack paths: {', '.join(missing)}")


def build_manifest() -> dict:
    schemas = sorted_files("machine/schemas/*.json")
    grammars = sorted_files("machine/grammars/*", exclude={"machine/grammars/README.md"})
    registries = sorted_files(
        "machine/registries/*.json",
        exclude={"machine/registries/rhoe-language-spec-release.json"},
    )
    examples = sorted_files("machine/examples/*.json")
    reference_packs = sorted_files("reference-packs/*/manifest.json")
    compiled_outputs = [
        "compiled/rhoe-spec-v0_9-release-pack.md",
    ]
    authoritative_entrypoints = {
        "normative_index": "00-index.md",
        "specification_conventions": "SPECIFICATION-CONVENTIONS.md",
        "versioning": "VERSIONING.md",
        "glossary": "GLOSSARY.md",
        "references": "REFERENCES.md",
        "release_pack_summary": "compiled/rhoe-spec-v0_9-release-pack.md",
        "validator": "scripts/validate-spec-v0_9.sh",
        "cutover_verifier": "scripts/verify-cutover.sh",
        "fixture_manifest": "fixtures/fixture-suite-v0_9.json",
    }
    preexisting_entrypoints = [
        path
        for key, path in authoritative_entrypoints.items()
        if key != "release_pack_summary"
    ]
    require_paths(
        schemas
        + grammars
        + registries
        + examples
        + reference_packs
        + compiled_outputs[:-1]
        + preexisting_entrypoints
    )
    return {
        "id": "rhoe.language-spec.v0_9",
        "label": "Rhoe Language Specification v0.9.0",
        "packageKind": "languageSpecRelease",
        "version": "0.9.0",
        "baselineVersion": "0.9.0",
        "status": "stable_authority_baseline",
        "authorityRepo": "RhoeLanguage",
        "authorityMode": "authoritative_source",
        "authoritativeEntrypoints": authoritative_entrypoints,
        "machineArtifacts": {
            "schemas": schemas,
            "grammars": grammars,
            "registries": registries,
            "examples": examples,
        },
        "referencePackManifests": reference_packs,
        "compiledOutputs": compiled_outputs,
    }


def build_summary(manifest: dict) -> str:
    lines = [
        "# Rhoe Language v0.9.0 Release Pack",
        "",
        "This generated release pack is the explicit contributor-facing publication surface for the stable `v0.9.0` authority baseline hosted in `RhoeLanguage`.",
        "",
        "## Release identity",
        "",
        f"- spec id: `{manifest['id']}`",
        f"- label: `{manifest['label']}`",
        f"- version: `{manifest['version']}`",
        f"- status: `{manifest['status']}`",
        f"- authority repo: `{manifest['authorityRepo']}`",
        "",
        "## Contributor-facing authority contract",
        "",
        "- language-family surfaces: `rhoemd`, `rhoedsl`, `rhoejson`, `rhoelatex`, `rhoetypst`, `rhoehtml`",
        "- specification conventions: [`../SPECIFICATION-CONVENTIONS.md`](../SPECIFICATION-CONVENTIONS.md)",
        "- contributor docs: [`../README.md`](../README.md), [`../CONTRIBUTING.md`](../CONTRIBUTING.md), [`../CODE_OF_CONDUCT.md`](../CODE_OF_CONDUCT.md), [`../NOTICE`](../NOTICE)",
        "- canonical maintainer gate: [`../scripts/verify-cutover.sh`](../scripts/verify-cutover.sh)",
        "",
        "## Authoritative entrypoints",
        "",
    ]
    for label, path in manifest["authoritativeEntrypoints"].items():
        lines.append(f"- `{label}`: [`../{path}`](../{path})")

    lines.extend(
        [
            "",
            "## Machine artifacts",
            "",
            f"- schemas: {len(manifest['machineArtifacts']['schemas'])}",
        ]
    )
    for path in manifest["machineArtifacts"]["schemas"]:
        lines.append(f"  - [`../{path}`](../{path})")
    lines.append(f"- grammars: {len(manifest['machineArtifacts']['grammars'])}")
    for path in manifest["machineArtifacts"]["grammars"]:
        lines.append(f"  - [`../{path}`](../{path})")
    lines.append(f"- registries: {len(manifest['machineArtifacts']['registries'])}")
    for path in manifest["machineArtifacts"]["registries"]:
        lines.append(f"  - [`../{path}`](../{path})")
    lines.append(f"- examples: {len(manifest['machineArtifacts']['examples'])}")
    for path in manifest["machineArtifacts"]["examples"]:
        lines.append(f"  - [`../{path}`](../{path})")

    lines.extend(
        [
            "",
            "## Reference realization packs",
            "",
            f"- shipped pack manifests: {len(manifest['referencePackManifests'])}",
        ]
    )
    for path in manifest["referencePackManifests"]:
        lines.append(f"  - [`../{path}`](../{path})")

    lines.extend(
        [
            "",
        "## Compiled outputs",
        "",
    ]
    )
    for path in manifest["compiledOutputs"]:
        lines.append(f"- [`../{path}`](../{path})")

    lines.extend(
        [
            "",
            "## Reproducible maintainer flow",
            "",
            "- regenerate the release pack: `python3 ./scripts/build-release-pack.py`",
            "- run the authoritative repo gate: `bash ./scripts/verify-cutover.sh`",
        ]
    )
    return "\n".join(lines) + "\n"


def main() -> None:
    manifest = build_manifest()
    MANIFEST_PATH.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    SUMMARY_PATH.write_text(build_summary(manifest), encoding="utf-8")
    print(f"Wrote {MANIFEST_PATH}")
    print(f"Wrote {SUMMARY_PATH}")


if __name__ == "__main__":
    main()
