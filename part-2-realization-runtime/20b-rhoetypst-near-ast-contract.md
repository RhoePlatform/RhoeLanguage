# 20b — RhoeTypst Near-AST Contract

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 2 / Realization and Runtime

## 1. Purpose
This chapter defines `RhoeTypst`, the official AST-near Typst target-source contract for `0.9.0`.

## 2. Contract Shape
- `RhoeTypst` emits Typst source built from `#rhoe-*` semantic functions.
- Node parameters map to named arguments.
- Child content maps to trailing content blocks.
- External package mode and inline-definition mode are both normative.

## 3. Common Construct Vocabulary

| Semantic family | Typst contract |
| --- | --- |
| Artifact root | `#rhoe-artifact(id: "...", title: "...", carrier: "...", genre: "...", composition-grammar: "...")[...]` |
| Matter | `#rhoe-front-matter[...]`, `#rhoe-main-matter[...]`, `#rhoe-back-matter[...]` |
| Sections | `#rhoe-section(...)`, `#rhoe-subsection(...)`, `#rhoe-subsubsection(...)` |
| Reference | `#rhoe-ref(target: "...", mode: "full")` |
| Image | `#rhoe-image(src: "...", alt: "...")` |
| Table | `#rhoe-table(...)` |

## 4. Carrier Mapping Table

| Carrier | Root and carrier-native constructors |
| --- | --- |
| `stageFrame` | `#rhoe-frameset`, `#rhoe-frame`, `#rhoe-frame-section`, `#rhoe-appendix-frameset`, `#rhoe-zone` |
| `codexSpread` | `#rhoe-codex`, `#rhoe-chapter`, `#rhoe-spread`, `#rhoe-appendix`, `#rhoe-reference-apparatus` |
| `scrollStream` | `#rhoe-stream`, `#rhoe-file-segment`, `#rhoe-anchor`, `#rhoe-support-matter`, `#rhoe-jump` |
| `tableauPageCollage` | `#rhoe-tableau-document`, `#rhoe-page-family`, `#rhoe-tableau-page`, `#rhoe-region-group`, `#rhoe-hero-region`, `#rhoe-support-region` |
| `sheetField` | `#rhoe-field-document`, `#rhoe-sheet`, `#rhoe-perimeter`, `#rhoe-top-band`, `#rhoe-bottom-band`, `#rhoe-side-band`, `#rhoe-region` |
| `ledgerRegister` | `#rhoe-register`, `#rhoe-collection`, `#rhoe-schema`, `#rhoe-record`, `#rhoe-form`, `#rhoe-dashboard`, `#rhoe-constraint` |
| `box` | `#rhoe-box`, `#rhoe-tag-catalog`, `#rhoe-fragment`, `#rhoe-subcollection`, `#rhoe-cluster`, `#rhoe-saved-view` |
| `conversationThread` | `#rhoe-thread`, `#rhoe-participant-profile`, `#rhoe-topic-briefing`, `#rhoe-conduct-doctrine`, `#rhoe-episode`, `#rhoe-branch`, `#rhoe-turn`, `#rhoe-attachment-ref`, `#rhoe-outcome` |

## 5. Stage-Specific Rules
- `#rhoe-frame` accepts:
  - `shell-role: "..."`
  - `shell: "..."`
  - `shell-pack: "..."`
  - `continuation: "..."`
  - `brand: "..."`
  - `critic-profile: "..."`
- `#rhoe-zone(role: "main")[...]` is the canonical zone constructor.
- Unzoned direct frame content is not canonical emitted `RhoeTypst`.

## 6. Numbering, References, and Identity
- Number-bearing constructs MUST accept `id:` and emit stable Typst labels.
- `#rhoe-ref(...)` resolves against stable Rhoe IDs rather than position-only local labels.
- Numbering remains canonical-semantic across Typst document and presentation profiles.

## 7. Brand, Critic, and Matter
- Root-level brand and critic bindings surface as named arguments on `#rhoe-artifact(...)`.
- Template-level styling lives in the Typst package, not in emitter-side formatting logic.
- Matter boundaries are explicit and MUST not collapse into one unmarked flow.

## 8. Pack Contract
- Official reference pack:
  - [`../reference-packs/rhoeTypstCore/manifest.json`](../reference-packs/rhoeTypstCore/manifest.json)
- External mode imports the pack.
- Inline mode embeds self-contained definitions from the pack’s inline entrypoint as literal Typst source.
- Canonical fixture validation MUST invoke Typst with the project root set to the `spec-v0_9` directory so cross-pack imports remain inside the Typst project boundary.

## 9. Conformance Focus
- emitted Typst is readable and idiomatic
- all eight carriers have canonical target fixtures
- numbering, references, zones, and matter survive target emission
- reference-pack document, presentation, and inline starter assets compile cleanly
