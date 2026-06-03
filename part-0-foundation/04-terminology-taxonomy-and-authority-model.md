# 04 — Terminology, Taxonomy, and Authority Model

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 0 / Foundation

## 1. Purpose
This chapter fixes core language terms and the authority model for the `0.9.0` baseline.

## 2. Core Terms

| Term | Meaning |
| --- | --- |
| `Artifact` | The canonical universal root |
| `carrierArchetype` | The root-level carrier discriminator |
| `genre` | Root-level rhetorical or semantic genre |
| `MatterEnvelope` | The universal three-part matter structure |
| `compositionGrammarRef` | Root binding to a carrier-aware composition grammar |
| `Section` / `Subsection` / `SubSubsection` | Universal semantic nesting spine |
| carrier | A major realization family such as `stageFrame` or `codexSpread` |
| source surface | A humane authoring notation such as `rhoemd` or `rhoedsl` |
| secondary near-AST surface | A target-native emitted and editable contract such as `RhoeTypst`, `RhoeLaTeX`, or `RhoeHTML` |
| target surface | A Part 2 realization family selected for emission, packaging, and conformance |
| realization | A target-side rendered or emitted form |
| compatibility input | A deprecated but still parseable older source form |

## 3. Taxonomy
- Universal ontology:
  - `Artifact`
  - `MatterEnvelope`
  - universal section spine
  - root-level metadata, refs, and diagnostics
- Carrier specialization:
  - carrier node families
  - carrier-native structural refinements
  - carrier-local semantic constraints
- Surface layer:
  - `rhoemd`
  - `rhoedsl`
  - `RhoeJSON`
- Runtime and projection layer:
  - secondary near-AST target surfaces
  - realization profiles and realization packs
  - composition-grammar packs
  - brand and critic packs
  - emitters and conformance tooling

## 4. Authority Model
1. Part 0 prose
2. Part 1 prose
3. Part 2 prose
4. Baseline machine artifacts
5. Generated release-pack metadata

## 5. Compatibility Inputs

Compatibility inputs are accepted only where this baseline defines reversible
lowering into canonical `0.9.0` terms. They are not recommended for new authoring.

## 6. Compatibility Terminology Bridge

| Superseded term | `0.9.0` treatment |
| --- | --- |
| `Document` | Compatibility-only root spelling; use `Artifact` |
| `Deck` | Compatibility-only carrier wording; use `stageFrame` |
| `Slide` | Compatibility-only frame wording; use `Frame` |
| `SlideNode` | Compatibility-only frame-node wording; lower to `Frame` |
| `SlotContent` | Compatibility-only wording; lower to stage zones or carrier-native structures |
| `shellGrammarRef` | Compatibility-only root term; use `compositionGrammarRef` |

## 7. Naming Doctrine
- Canonical AST names use camelCase.
- Canonical registry IDs use camelCase unless an explicit different lexical form is specified.
- Surface sugar MAY use kebab or slash forms when a reversible normalization exists.
- Extension identifiers in the AST use `namespace.localCamelCase`.
- Surface sugar for extension identifiers SHOULD use `namespace/local-kebab`.
