# v0.9.0 Fixture Suite Index

## Status
- Normative support corpus
- Baseline: `spec-v0_9`

## Purpose
This directory contains the shipped fixture families required by the `0.9.0` conformance contract.

## Fixture Manifest
- [`fixture-suite-v0_9.json`](fixture-suite-v0_9.json) is the machine-readable fixture manifest.
- It validates against [`../machine/schemas/fixture-suite-manifest-v0_9.schema.json`](../machine/schemas/fixture-suite-manifest-v0_9.schema.json).

## Families
- `canonical-rhoejson`
  - canonical AST fixtures
  - at least one valid fixture for every baseline carrier
- `canonical-rhoemd`
  - canonical `rhoemd` authored sources
- `canonical-rhoedsl`
  - canonical `rhoedsl` structural sources
- `canonical-rhoetypst`
  - canonical `RhoeTypst` AST-near target sources
- `canonical-rhoelatex`
  - canonical `RhoeLaTeX` AST-near target sources
- `canonical-rhoehtml`
  - canonical `RhoeHTML` AST-near target sources
- `compatibility-lowering`
  - deprecated-but-supported inputs paired with canonical lowering expectations
- `carrier-node-placement`
  - invalid carrier placement and invariant failures
- `projection-conformance`
  - projection-oriented semantic preservation assertions
- `artifact-workbench-contract`
  - Artifact Workbench semantic master fixtures that downstream service,
    authoring, reconstruction, runtime, and shell lanes must consume as
    contract authority instead of defining repo-local semantic models.

## Coverage Notes
- Every baseline carrier has at least one shipped valid fixture.
- `stageFrame` coverage includes shell and zone semantics.
- Secondary near-AST target coverage includes one canonical target-source fixture per carrier for Typst, LaTeX, and HTML.
- Inline-mode fixtures are shipped for all three secondary near-AST target surfaces.
- Compatibility coverage includes both `:::slide` alias lowering and legacy `%%%/%%/%` lowering.
- Negative coverage includes missing matter, invalid genre namespacing, invalid carrier-node placement, and invalid legacy mixing.
- Artifact Workbench coverage includes one source-preserving stage-frame master
  for board-readiness artifact work, paired across canonical RhoeJSON and
  canonical rhoemd.
