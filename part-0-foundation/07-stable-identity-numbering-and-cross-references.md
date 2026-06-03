# 07 — Stable Identity, Numbering, and Cross-References

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 0 / Foundation

## 1. Purpose
This chapter defines how stable identities, numbering, and cross-references operate in the `0.9.0` baseline.

## 2. Stable Identity
- `Artifact.id` is required.
- Significant structural nodes SHOULD have stable IDs when they are likely cross-reference targets.
- IDs MUST be stable across non-semantic rewrites whenever practical.

## 3. Identity Scope
- Root IDs are artifact-scoped globally within a project.
- Section and carrier-node IDs are artifact-local unless explicitly exported.
- Realization-specific numbering MUST NOT replace semantic identity.

## 4. Numbering Doctrine
- Numbering is derived from canonical structure.
- Universal section numbering derives from `Section`, `Subsection`, and `SubSubsection`.
- Carrier-native numbering MAY refine or present that numbering differently.
- Stage frame numbering is a realization or carrier convention, not the universal semantic numbering spine.

## 5. Cross-References
- Cross-references SHOULD target stable IDs rather than presentation order where possible.
- References MAY target:
  - root artifacts
  - universal section nodes
  - carrier-native nodes
  - attachments
  - named projections

## 6. Compatibility Bridge
- Older slide-order or page-order references MAY be retained as compatibility hints.
- Canonical writers SHOULD prefer stable ID references when rewriting source.

## 7. Numbering and Migration
- Automatic lowering MUST preserve existing explicit IDs when valid.
- Guided migration SHOULD propose stable IDs where older sources lacked them.
