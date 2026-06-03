# v0.9.0 Reference Packs Index

## Status
- Normative support corpus
- Baseline: `RhoeLanguage` `v0.9.0`

## Purpose
This directory contains the shipped baseline-owned reference realization packs for the official secondary near-AST target surfaces.

## Packs
- [`rhoeTypstCore/manifest.json`](rhoeTypstCore/manifest.json)
  - external package and inline-definition support for `RhoeTypst`
- [`rhoeLatexCore/manifest.json`](rhoeLatexCore/manifest.json)
  - external package/class and inline-preamble support for `RhoeLaTeX`
- [`rhoeHtmlCore/manifest.json`](rhoeHtmlCore/manifest.json)
  - linked-asset and inline-bundle support for `RhoeHTML`

## Contract Notes
- These packs are discoverable realization packs, not new authority layers.
- The `inline` entrypoints are shipped as embed-ready source blobs:
  - Typst inline definitions
  - LaTeX inline preamble definitions
  - HTML inline bundle shell
- Reproducible baseline validation entrypoint:
  - [`../scripts/validate-spec-v0_9.sh`](../scripts/validate-spec-v0_9.sh)
- Host-native validation notes:
  - canonical Typst fixture validation uses `typst compile --root <repo-root> ...`
  - canonical LaTeX fixture validation runs from the fixture directory, or with an explicitly equivalent package-resolution configuration
  - transient validation outputs MUST NOT be written inside the repository tree
- They validate against:
  - [`../machine/schemas/realization-pack-manifest-v0_9.schema.json`](../machine/schemas/realization-pack-manifest-v0_9.schema.json)
- They are referenced by:
  - [`../machine/registries/realization-packs.json`](../machine/registries/realization-packs.json)
