# Artifact Workbench Contract Authority

## Status
- Normative adjunct for Phase 23 Artifact Workbench contract authority.
- This chapter does not introduce a new carrier, shell, runtime, or product UI.

## Purpose
Artifact Workbench uses the existing Rhoe Language substrate to model
high-stakes narrative artifacts as semantic masters. Downstream import, export,
authoring, runtime, reconstruction, and product-shell lanes must consume the
contracts here rather than defining app-local semantic models.

## Canonical Master Contract
An Artifact Workbench semantic master is still a canonical `Artifact`.
The first launch fixture uses:

- `carrierArchetype`: `stageFrame`
- `genre`: `artifactWorkbench.boardReadiness`
- `compositionGrammarRef`: `artifact-workbench/board-readiness-v1`
- `brandProfileRef`: `artifact-workbench.boardroom`
- `criticProfileRef`: `artifact-workbench.executive-review`

The authoritative fixture pair is:

- [`../fixtures/rhoejson/valid/artifact-workbench-board-readiness.json`](../fixtures/rhoejson/valid/artifact-workbench-board-readiness.json)
- [`../fixtures/rhoemd/canonical/artifact-workbench-board-readiness.md`](../fixtures/rhoemd/canonical/artifact-workbench-board-readiness.md)

## Required Semantic Slots
Artifact Workbench launch templates must expose semantic slots before visual
layout:

- `artifact.title`
- `artifact.context`
- `artifact.decision`
- `artifact.evidence`
- `artifact.quantitativeNarrative`
- `artifact.risk`
- `artifact.recommendation`
- `artifact.reviewGate`

Slots may materialize as frame zones, table cells, paragraphs, or target-specific
layout regions, but the slot identity remains semantic authority.

## Edit Contract
Downstream editors must preserve:

- stable node identifiers for semantically meaningful blocks
- slot identity when text or layout is changed
- frozen properties such as artifact type, template archetype, critical style
  role, and review-gate state unless an explicit governed edit unlocks them
- source-preserving round-trip metadata for reconstructed or imported artifacts
- semantic diff anchors for review and merge-back lanes

## Template Contract
Templates are semantic artifact types, not visual shells. A launch template must
declare:

- narrative function
- required and optional slots
- slot cardinality
- locked and editable properties
- target-style guardrails
- review expectations

## Downstream Consumption Rule
Any downstream lane that imports, exports, reconstructs, edits, renders, checks,
or wraps Artifact Workbench artifacts must reference this contract surface and
the fixture pair above. If a downstream repo needs additional semantic fields,
it must report the gap back to Atlas or `RhoeLanguage`; it must not create a
repo-local artifact model.
