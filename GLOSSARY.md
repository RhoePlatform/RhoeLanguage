# Glossary

## Status

- Informative reference
- Version: `0.9.0`
- Layer: Public reader orientation

## Core Terms

| Term | Meaning |
| --- | --- |
| `Artifact` | The universal canonical root node of every Rhoe document. |
| `MatterEnvelope` | The universal three-part structure containing `frontMatter`, `mainMatter`, and `backMatter`. |
| `carrierArchetype` | The root-level discriminator that selects the major artifact family. |
| `compositionGrammarRef` | The root binding to a carrier-aware composition grammar pack. |
| `genre` | A root-level rhetorical or semantic classification. |
| `Section` | The first level of universal semantic nesting inside the artifact body. |
| `Subsection` | The second level of universal semantic nesting. |
| `SubSubsection` | The third level of universal semantic nesting. |

## Source Surfaces

| Term | Meaning |
| --- | --- |
| `rhoemd` | The primary humane authoring surface for Rhoe artifacts. |
| `rhoedsl` | A structure-first humane source surface aligned closely to the canonical AST. |
| `RhoeJSON` | The canonical machine-neutral serialized notation of the AST. |
| `RhoeTypst` | The official Typst-near target-source surface. |
| `RhoeLaTeX` | The official LaTeX-near target-source surface. |
| `RhoeHTML` | The official HTML-near target-source surface. |

## Carrier Families

| Term | Meaning |
| --- | --- |
| `stageFrame` | A deeply elaborated carrier for presentation-like frame structures. |
| `codexSpread` | A carrier for structured spread-style artifact pages. |
| `scrollStream` | A carrier for long-form scrollable narrative or review streams. |
| `tableauPageCollage` | A carrier for tableau-style page collage artifacts. |
| `sheetField` | A carrier for worksheet-like structured fields. |
| `ledgerRegister` | A carrier for register, ledger, or risk-tracking artifacts. |
| `box` | A carrier for collection-like box artifacts. |
| `conversationThread` | A carrier for conversational or threaded review artifacts. |

## Runtime and Publication Terms

| Term | Meaning |
| --- | --- |
| realization | A target-side emitted or rendered form derived from the canonical AST. |
| realization profile | A named target-specific emission profile. |
| realization pack | A package that supplies target templates, runtime entrypoints, or target-specific support files. |
| composition grammar pack | A package that supplies carrier-aware composition grammar entries. |
| fixture suite | The canonical corpus used to test schema, parser, writer, and emitter conformance. |
| compatibility input | A deprecated but still parseable source form that lowers to canonical `0.9.0` semantics. |
| canonical writer | A writer that emits preferred canonical forms rather than compatibility-only spellings. |
