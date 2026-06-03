# Part 1 — Author Surfaces

## Status
- Normative baseline: Part 1 defines the humane authoring surfaces for Rhoe Language `0.9.0`.
- Part 1 is governed by Part 0 and may not redefine ontology, registries, or canonical serialization.

## Scope
- `rhoemd` overview and doctrine
- core block and inline syntax
- matter, carrier, and structural directives
- `stageFrame` source surface and deprecated slide compatibility
- non-stage carrier surface families
- formal grammar and tokenization
- `rhoedsl` reference
- round-tripping and lowering

## Chapter Order
- [`10-rhoemd-overview-and-authoring-doctrine.md`](10-rhoemd-overview-and-authoring-doctrine.md)
- [`11-rhoemd-core-block-and-inline-syntax.md`](11-rhoemd-core-block-and-inline-syntax.md)
- [`12-rhoemd-matter-carriers-and-structural-directives.md`](12-rhoemd-matter-carriers-and-structural-directives.md)
- [`13-rhoemd-stageframe-surface-and-compatibility.md`](13-rhoemd-stageframe-surface-and-compatibility.md)
- [`14-rhoemd-nonstage-carrier-surfaces.md`](14-rhoemd-nonstage-carrier-surfaces.md)
- [`15-rhoemd-formal-grammar-and-tokenization.md`](15-rhoemd-formal-grammar-and-tokenization.md)
- [`16-rhoedsl-reference.md`](16-rhoedsl-reference.md)
- [`17-surface-equivalence-roundtripping-and-lowering.md`](17-surface-equivalence-roundtripping-and-lowering.md)

## Part-Wide Commitments
- `rhoemd` remains the primary humane author surface.
- Canonical `rhoemd` is carrier-aware and frame-primary.
- `rhoedsl` remains a humane structural mirror of the same AST.
- Canonical writers emit canonical forms, not compatibility forms.
