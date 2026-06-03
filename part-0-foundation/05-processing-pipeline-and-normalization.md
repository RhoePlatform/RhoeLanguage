# 05 — Processing Pipeline and Normalization

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 0 / Foundation

## 1. Purpose
This chapter defines the pipeline that transforms humane source text into the canonical AST and then into realizations.

## 2. Pipeline Overview
1. Source ingestion
2. Surface-specific preprocessing
3. Parse-time syntax analysis
4. Compatibility lowering
5. Canonical structural normalization
6. Registry and reference resolution
7. Semantic lint and critic attachment
8. Projection preparation
9. Target realization

## 3. Raw vs Canonical
- Raw parse products preserve source-local structure, spelling, and compatibility evidence.
- The canonical AST eliminates surface-local sugar.
- Canonical normalization is the convergence point shared by all authoring surfaces.

## 4. Compatibility Lowering
- Compatibility lowering occurs before canonical structural validation.
- Examples:
  - `:::slide` lowers to `:::frame`
  - `:::frontmatter` lowers to `:::front-matter`
  - `kind: presentation` lowers to `kind: artifact` with `carrier: stage/frame`
  - legacy `%%%`, `%%`, and `%` lower into `stageFrame` frames and zones with compatibility hints

## 5. Canonical Structural Normalization
- Surface head metadata lowers into root fields.
- Universal matter directives lower into `MatterEnvelope`.
- Carrier directives lower into carrier-native nodes.
- Carrier-native structural directives lower into universal section nodes plus carrier-native metadata.
- Deprecated stage forms lower into the same canonical `stageFrame` AST as canonical forms.

## 6. Registry and Reference Resolution
- Registry validation checks core ID legitimacy.
- Reference resolution order for `compositionGrammarRef`, `brandProfileRef`, and `criticProfileRef` is:
  1. document-local bindings
  2. project registry
  3. installed namespaced pack
  4. built-in core pack

## 7. Normalization Guarantees
- Equivalent canonical and deprecated surface forms MUST converge to one AST.
- Surface spelling differences MUST NOT create semantic divergence.
- Target-specific conveniences MUST NOT leak back into canonical structure.

## 8. Non-Goals of Normalization
- Normalization does not invent deep semantics when the source does not encode them.
- Guided inference and manual migration are separate from automatic lowering.
