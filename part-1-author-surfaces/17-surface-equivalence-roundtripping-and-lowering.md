# 17 — Surface Equivalence, Round-Tripping, and Lowering

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 1 / Author Surfaces

## 1. Purpose
This chapter defines how canonical and compatibility surfaces converge on the same AST and how round-tripping must behave.

## 2. Surface Equivalence Rule
- Two sources are equivalent when they lower to the same canonical AST.
- Canonical equivalence is judged after compatibility lowering and normalization.
- This rule applies to humane source surfaces only: `rhoemd` and `rhoedsl`.
- `RhoeTypst`, `RhoeLaTeX`, and `RhoeHTML` are Part 2 target-source contracts, not Part 1 equivalence surfaces.

## 3. Round-Trip Guarantees
- Parse -> AST -> canonical writer -> AST MUST preserve semantics.
- Canonical writers do not need to preserve deprecated syntax spellings.
- Strict preservation tools MAY preserve deprecated spellings when explicitly requested.

## 4. Compatibility Lowering Matrix

| Compatibility input | Canonical result |
| --- | --- |
| `:::frontmatter` | `:::front-matter` |
| `:::mainmatter` | `:::main-matter` |
| `:::backmatter` | `:::back-matter` |
| `:::slide` | `:::frame` |
| `:::slide-section` | `:::frame-section` |
| `kind: presentation` | `kind: artifact` with `carrier: stage/frame` |
| `shell-grammar:` | `composition-grammar:` |
| `%%%` | compatibility-mode `Frame` creation |
| `%%` | stage `Zone` creation with compatibility placement hints |
| `%` | stage `Zone` creation with grid-cell compatibility hints |

## 5. Automatic Lowering vs Guided Inference
- Automatic lowering applies when the intended canonical AST is recoverable without semantic guesswork.
- Guided inference applies when carrier or matter recovery requires tool-assisted decisions.
- Manual migration applies when the source lacks enough semantic structure.

## 6. Deprecated Slide Family Rule
- Deprecated slide-family syntax remains parseable.
- It is not canonical.
- Writers SHOULD emit canonical stage forms when rewriting such content.

## 7. Fixture Guidance
- The shipped fixture manifest lives at [`../fixtures/fixture-suite-v0_9.json`](../fixtures/fixture-suite-v0_9.json).
- Every compatibility form SHOULD have a paired canonical fixture.
- Conformance suites SHOULD assert AST equivalence between the paired fixtures.
