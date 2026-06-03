# 14 — RhoeMarkdown Nonstage Carrier Surfaces

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 1 / Author Surfaces

## 1. Purpose
This chapter records the canonical surface families for non-stage carriers. These carriers are normative-minimum in `0.9.0`: real and standard, but not as deeply elaborated as `stageFrame`.

## 2. Carrier Overview

| Carrier | Canonical directives | Primary shape |
| --- | --- | --- |
| `codexSpread` | `:::codex`, `:::chapter`, `:::spread`, `:::appendix`, `:::reference-apparatus` | bounded leaf and chapter artifact |
| `scrollStream` | `:::stream`, `:::file-segment`, `:::anchor`, `:::support-matter`, `:::jump` | flow and segment artifact |
| `tableauPageCollage` | `:::tableau-document`, `:::page-family`, `:::tableau-page`, `:::region-group`, `:::hero-region`, `:::support-region` | bounded page-family artifact |
| `sheetField` | `:::field-document`, `:::sheet`, `:::perimeter`, `:::top-band`, `:::bottom-band`, `:::side-band`, `:::region` | working sheet artifact |
| `ledgerRegister` | `:::register`, `:::collection`, `:::schema`, `:::record`, `:::form`, `:::dashboard`, `:::constraint` | schema-governed record artifact |
| `box` | `:::box`, `:::tag-catalog`, `:::fragment`, `:::subcollection`, `:::cluster`, `:::saved-view` | box / collection artifact |
| `conversationThread` | `:::thread`, `:::participant-profile`, `:::topic-briefing`, `:::conduct-doctrine`, `:::episode`, `:::branch`, `:::turn`, `:::attachment-ref`, `:::outcome` | episode and branch artifact |

## 3. Canonical Example Policy
- All examples in this chapter are canonical full-valid artifacts.
- They use canonical matter directives.
- They use canonical carrier directives rather than deprecated compatibility aliases.

## 4. Codex Example

````markdown
---
kind: artifact
carrier: codex/spread
genre: ext/reference-codex
title: Field Guide
composition-grammar: codex/default
---

::::front-matter
:::::codex {title="Prelims"}
Preface and edition statement.
:::::
::::

::::main-matter
:::::chapter {title="Overview"}
::::::spread {title="Core Spread"}
Core chapter body.
::::::
:::::
::::

::::back-matter
:::::reference-apparatus
Index, glossary, bibliography.
:::::
::::
````

## 5. Scroll Example

````markdown
---
kind: artifact
carrier: scroll/stream
genre: ext/review-stream
title: Platform Guide
composition-grammar: stream/default
---

::::front-matter
:::::support-matter
Overview and navigation map.
:::::
::::

::::main-matter
:::::stream
::::::file-segment {path="docs/intro.md"}
Intro segment.
::::::
::::::file-segment {path="docs/runtime.md"}
Runtime segment.
::::::
:::::
::::

::::back-matter
:::::support-matter
Reference links and change log.
:::::
::::
````

## 6. Tableau Example

````markdown
---
kind: artifact
carrier: tableau/page-collage
genre: ext/tableau-brief
title: Campaign Brief
composition-grammar: tableau/default
---

::::front-matter
:::::page-family {title="Cover Family"}
::::::tableau-page {title="Cover"}
:::::::hero-region
Campaign brief opener.
:::::::
::::::
:::::
::::

::::main-matter
:::::page-family {title="Core Pages"}
::::::tableau-page {title="Analysis"}
:::::::region-group
::::::::support-region
Supporting findings.
::::::::
:::::::
::::::
:::::
::::

::::back-matter
:::::page-family {title="Closing Family"}
::::::tableau-page {title="Credits"}
:::::::support-region
Credits and legal footer.
:::::::
::::::
:::::
::::
````

## 7. Sheet Example

````markdown
---
kind: artifact
carrier: sheet/field
genre: ext/sheet-workspace
title: Planning Sheet
composition-grammar: sheet/default
---

::::front-matter
:::::top-band {title="Header Band"}
Working assumptions and owner notes.
:::::
::::

::::main-matter
:::::sheet {title="Current Plan"}
::::::region {title="Main Workspace"}
Primary worksheet region.
::::::
:::::
::::

::::back-matter
:::::bottom-band {title="Footer Band"}
Carry-forward tasks and archive notes.
:::::
::::
````

## 8. Ledger Example

````markdown
---
kind: artifact
carrier: ledger/register
genre: ext/operations-register
title: Risk Register
composition-grammar: ledger/default
---

::::front-matter
:::::dashboard
Current portfolio health.
:::::
::::

::::main-matter
:::::collection {name="risks"}
::::::schema {ref="risk.v1"}
::::::
::::::record {id="risk-001"}
severity: high
owner: finance
::::::
:::::
::::

::::back-matter
:::::constraint
Severity must be one of low, medium, high.
:::::
::::
````

## 9. Box Example

````markdown
---
kind: artifact
carrier: box/collection
genre: ext/research-box
title: Research Box
composition-grammar: box/default
---

::::front-matter
:::::tag-catalog
Theme, source, and confidence tags.
:::::
::::

::::main-matter
:::::box {title="Collected Fragments"}
::::::fragment {id="frag-001"}
Primary source fragment.
::::::
:::::
::::

::::back-matter
:::::saved-view {title="Curated View"}
Cross-source synthesis view.
:::::
::::
````

## 10. Conversation Example

````markdown
---
kind: artifact
carrier: conversation/thread
genre: ext/design-review
title: Review Thread
composition-grammar: conversation/default
---

::::front-matter
:::::participant-profile {id="alex"}
Product lead
:::::
::::

::::main-matter
:::::thread
::::::episode {title="API review"}
:::::::turn {speaker="alex"}
We should keep the carrier registry closed in core.
:::::::
::::::
:::::
::::

::::back-matter
:::::outcome
Decision: closed core carrier registry retained.
:::::
::::
````
