# 12 — RhoeMarkdown Matter, Carriers, and Structural Directives

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 1 / Author Surfaces

## 1. Purpose
This chapter defines the universal `rhoemd` directives for matter and structure, plus the general rules for carrier-native directives.

## 2. Head Metadata vs Body Matter
- YAML head frontmatter is root metadata only.
- It is not the same thing as `matter.frontMatter`.
- Body matter directives serialize the canonical `MatterEnvelope`.
- Canonical examples in this chapter are full-valid artifacts unless explicitly marked as fragments.

## 3. Canonical Matter Directives
- `:::front-matter`
- `:::main-matter`
- `:::back-matter`

### 3.1 Canonical authoring rule
- Canonical authored sources SHOULD include all three matter directives explicitly.
- Canonical writers MUST emit all three matter directives.
- Missing matter directives MAY be synthesized only in compatibility mode.
- Nested canonical examples use longer outer fences such as `::::` and `:::::` to satisfy the fence-length nesting rule.

## 4. Universal Structural Directives
- `:::section`
- `:::subsection`
- `:::subsubsection`

### 4.1 Placement rule
- Universal structural directives MAY appear only inside a matter directive.

### 4.2 Lowering rule
- They lower directly to the matching universal AST node.

## 5. Carrier Directive Doctrine
- Carrier directives serialize carrier-native nodes.
- Carrier-native structural directives lower to carrier-native nodes while still preserving the universal section spine.
- Carrier directives MUST appear only where the declared `carrierArchetype` allows them.

## 6. Carrier Directive Registry

| Carrier | Canonical directives |
| --- | --- |
| `stageFrame` | `:::frameset`, `:::frame`, `:::frame-section`, `:::appendix-frameset`, `:::zone` |
| `codexSpread` | `:::codex`, `:::chapter`, `:::spread`, `:::appendix`, `:::reference-apparatus` |
| `scrollStream` | `:::stream`, `:::file-segment`, `:::anchor`, `:::support-matter`, `:::jump` |
| `tableauPageCollage` | `:::tableau-document`, `:::page-family`, `:::tableau-page`, `:::region-group`, `:::hero-region`, `:::support-region` |
| `sheetField` | `:::field-document`, `:::sheet`, `:::perimeter`, `:::top-band`, `:::bottom-band`, `:::side-band`, `:::region` |
| `ledgerRegister` | `:::register`, `:::collection`, `:::schema`, `:::record`, `:::form`, `:::dashboard`, `:::constraint` |
| `box` | `:::box`, `:::tag-catalog`, `:::fragment`, `:::subcollection`, `:::cluster`, `:::saved-view` |
| `conversationThread` | `:::thread`, `:::participant-profile`, `:::topic-briefing`, `:::conduct-doctrine`, `:::episode`, `:::branch`, `:::turn`, `:::attachment-ref`, `:::outcome` |

## 7. Structural Precedence
- Universal structure directives always create the universal section nodes.
- Carrier-native structural directives may realize the same structural boundary at the carrier layer.
- When a carrier-native structural directive already creates the intended structural boundary, parsers MUST NOT synthesize a duplicate sibling universal section.

## 8. Canonical Example
- The following example is canonical full-valid source.

````markdown
---
kind: artifact
carrier: codex/spread
genre: ext/reference-codex
title: Example Codex
composition-grammar: codex/default
---

::::front-matter
:::::codex {title="Prelims"}
Edition: working draft.
:::::
::::

::::main-matter
:::::chapter {title="Findings"}
Core chapter body.
:::::
::::

::::back-matter
:::::reference-apparatus
Glossary and sources.
:::::
::::
````
