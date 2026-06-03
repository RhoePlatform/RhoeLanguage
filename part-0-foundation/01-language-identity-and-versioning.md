# 01 — Language Identity and Versioning

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 0 / Foundation

## 1. Purpose
This chapter defines what the Rhoe Language is, what this `0.9.0` baseline means, and how baseline versions relate to future public release numbering.

## 2. Identity
- Rhoe is a semantic artifact language.
- Its ontological form is the canonical AST.
- Its humane source surfaces are `rhoemd` and `rhoedsl`.
- Its machine-neutral serialized notation is `RhoeJSON`.
- Its target outputs are realizations, not semantic authorities.

## 3. Versioning Doctrine
- `0.9.0` is the normative version label for this integrated pre-`1.0` baseline.
- The `RhoeLanguage` repo root is the live normative baseline for this `0.9.0` corpus.
- A later public `1.0` release MAY preserve the same architecture while changing only product-facing version labels and stability guarantees.

## 4. Version Precedence
1. Normative prose in this baseline
2. Machine artifacts shipped in this baseline when they conform to the prose
3. Explicit compatibility rules in this baseline

## 5. Stability Classes

| Class | Meaning |
| --- | --- |
| `core-stable` | Expected to remain intact through `1.0` unless a major contradiction is found |
| `baseline-stable` | Required for this baseline and tooling work, but still pre-`1.0` adjustable |
| `compatibility-only` | Accepted only for migration and parsing legacy sources |
| `superseded` | Documented only where needed to define compatibility behavior; not valid for new authoring |

## 6. Baseline-Wide Architectural Identity
- Universal root: `Artifact`
- Universal root hook: `compositionGrammarRef`
- Universal structure: `MatterEnvelope`, `Section`, `Subsection`, `SubSubsection`
- Carrier discriminator: `carrierArchetype`
- Primary humane surface: `rhoemd`
- Secondary humane surface: `rhoedsl`
- First deep carrier specialization: `stageFrame`

## 7. Explicit Non-Identity Claims
- Rhoe is not identical to Markdown.
- Rhoe is not identical to Swift or any host implementation API.
- Rhoe is not identical to stage or slide language only.
- Rhoe is not identical to any target output such as HTML, LaTeX, Typst, PDF, or runtime viewer state.
