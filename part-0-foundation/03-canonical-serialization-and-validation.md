# 03 — Canonical Serialization and Validation

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 0 / Foundation

## 1. Purpose
This chapter defines the canonical serialized notation, the machine-checkable validation boundary, and the relationship between prose semantics and machine artifacts.

## 2. Canonical Serialized Notation
- `RhoeJSON` is the canonical serialized notation of the canonical AST.
- `RhoeJSON` is used for:
  - interchange
  - fixtures
  - conformance
  - machine validation
  - implementation-neutral inspection
- `RhoeJSON` is not the primary humane authoring surface.

## 3. Canonical Domain
- The canonical validation domain is the canonical semantic AST.
- Raw surface text and raw parse trees are not the canonical validation domain.
- Target projections are downstream of the canonical validation domain.

## 4. Validation Layers

| Layer | Purpose |
| --- | --- |
| Parse-time validation | Check syntax, delimiter structure, head metadata shape, and directive grammar |
| Canonical structural validation | Check the `Artifact` contract, matter presence, and carrier-scoped node legality |
| Registry validation | Check carrier IDs, core genres, stage roles, zones, and composition-grammar registry entries |
| Semantic lint | Check brand, critic, shell, zone, continuation, and carrier legitimacy rules |
| Projection conformance | Check that downstream writers preserve canonical semantics |

## 5. Normative Relationship Between Prose and Machine Artifacts
1. Normative prose defines the meaning of the language.
2. Machine artifacts MUST conform to the prose.
3. If a machine artifact underspecifies a prose rule, the prose wins.
4. If the prose is silent and the machine artifact is specific, the machine artifact is authoritative for mechanical structure only.

## 6. Canonical Omission Policy
- Required object fields MUST be present.
- Required collection fields MUST be present, even when empty.
- Optional scalar fields MAY be absent.
- Null is not the preferred encoding for absent optional scalar fields.
- Canonical writers SHOULD prefer omission for absent optional scalars and explicit arrays for required collections.

## 7. Validation Severities
- Normative severities in `0.9.0` are:
  - `error`
  - `warning`
  - `suggestion`
- Superseded severity spellings such as `advisory` are compatibility-only.

## 8. Root Invariants
1. Exactly one `Artifact` root.
2. Exactly one `carrierArchetype`.
3. Exactly one `genre`.
4. Exactly one `MatterEnvelope`.
5. Exactly one `compositionGrammarRef`.
6. Presence of all three matter zones.
7. Valid carrier-node placement.

## 9. Canonical Schema
- The baseline schema lives at:
  - [`../machine/schemas/rhoejson-canonical-v0_9.schema.json`](../machine/schemas/rhoejson-canonical-v0_9.schema.json)
- That schema is carrier-explicit and validates matter-node legality per baseline carrier.

## 10. Conformance Fixtures
- The shipped fixture suite manifest lives at:
  - [`../fixtures/fixture-suite-v0_9.json`](../fixtures/fixture-suite-v0_9.json)
- Conforming implementations SHOULD validate:
  - canonical `RhoeJSON` fixtures
  - canonical `rhoemd` fixtures
  - canonical `rhoedsl` fixtures
  - compatibility lowering fixtures
  - carrier-node placement fixtures
  - projection conformance assertions
