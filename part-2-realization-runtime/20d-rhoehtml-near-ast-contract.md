# 20d — RhoeHTML Near-AST Contract

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 2 / Realization and Runtime

## 1. Purpose
This chapter defines `RhoeHTML`, the official AST-near HTML target-source contract for `0.9.0`.

## 2. Contract Shape
- `RhoeHTML` is semantic HTML5 first.
- It layers:
  1. semantic DOM
  2. mandatory `rhoe-*` structural classes and `data-rhoe-*` metadata
  3. progressive enhancement CSS and JS
- Custom elements are not the canonical contract in `0.9.0`.

## 3. Required Structural Metadata
- Every canonical emitted element family MUST carry:
  - `class="rhoe-*"` structural classes
  - `data-rhoe-node`
- Number-bearing or role-bearing nodes SHOULD also carry:
  - `data-rhoe-kind`
  - `data-rhoe-role`
  - `data-rhoe-level`
- Viewer-profile roots SHOULD also carry:
  - `data-rhoe-profile="viewer"`

## 4. Common Construct Vocabulary

| Semantic family | HTML contract |
| --- | --- |
| Artifact root | `<article class="rhoe-artifact rhoe-carrier-*" data-rhoe-node="Artifact" ...>` |
| Matter | `<section class="rhoe-front-matter">`, `<section class="rhoe-main-matter">`, `<section class="rhoe-back-matter">` |
| Sections | `<section class="rhoe-section">`, `<section class="rhoe-subsection">`, `<section class="rhoe-subsubsection">` |
| Reference | `<a class="rhoe-ref" data-rhoe-node="Reference" href="#...">...</a>` |
| Image | `<figure class="rhoe-figure">...` or `<img class="rhoe-image" ...>` |
| Table | `<table class="rhoe-table">...` |

## 5. Carrier Mapping Table

| Carrier | Root and carrier-native constructs |
| --- | --- |
| `stageFrame` | `<section class="rhoe-frameset">`, `<section class="rhoe-frame">`, `<section class="rhoe-frame-section">`, `<section class="rhoe-appendix-frameset">`, `<div class="rhoe-zone">` |
| `codexSpread` | `<section class="rhoe-codex">`, `<section class="rhoe-chapter">`, `<section class="rhoe-spread">`, `<aside class="rhoe-reference-apparatus">` |
| `scrollStream` | `<section class="rhoe-stream">`, `<article class="rhoe-file-segment">`, `<a class="rhoe-anchor">`, `<aside class="rhoe-support-matter">`, `<a class="rhoe-jump">` |
| `tableauPageCollage` | `<section class="rhoe-tableau-document">`, `<section class="rhoe-page-family">`, `<section class="rhoe-tableau-page">`, `<div class="rhoe-region-group">`, `<section class="rhoe-hero-region">`, `<section class="rhoe-support-region">` |
| `sheetField` | `<section class="rhoe-field-document">`, `<section class="rhoe-sheet">`, `<aside class="rhoe-perimeter">`, `<header class="rhoe-top-band">`, `<footer class="rhoe-bottom-band">`, `<aside class="rhoe-side-band">`, `<section class="rhoe-region">` |
| `ledgerRegister` | `<section class="rhoe-register">`, `<section class="rhoe-collection">`, `<section class="rhoe-schema">`, `<article class="rhoe-record">`, `<form class="rhoe-form">`, `<section class="rhoe-dashboard">`, `<aside class="rhoe-constraint">` |
| `box` | `<section class="rhoe-box">`, `<aside class="rhoe-tag-catalog">`, `<article class="rhoe-fragment">`, `<section class="rhoe-subcollection">`, `<section class="rhoe-cluster">`, `<section class="rhoe-saved-view">` |
| `conversationThread` | `<section class="rhoe-thread">`, `<aside class="rhoe-participant-profile">`, `<section class="rhoe-topic-briefing">`, `<section class="rhoe-conduct-doctrine">`, `<section class="rhoe-episode">`, `<section class="rhoe-branch">`, `<article class="rhoe-turn">`, `<a class="rhoe-attachment-ref">`, `<section class="rhoe-outcome">` |

## 6. Stage-Specific Rules
- `rhoe-frame` elements MUST preserve shell and continuation metadata via `data-rhoe-*` attributes.
- `rhoe-zone` elements MUST carry zone-role metadata and canonical DOM order.
- Viewer-profile JS MAY enhance navigation and presenter mode, but the source document remains semantically readable without JS in document profile.
- Viewer-profile JS SHOULD maintain externally observable active-frame state without erasing semantic frame identity.

## 7. Accessibility, Numbering, and Identity
- `RhoeHTML` MUST prefer native HTML semantics over ARIA substitutes.
- Layout grids MUST NOT masquerade as data tables.
- Number-bearing constructs MUST emit stable fragment anchors from Rhoe IDs.
- Cross-references MUST emit navigable anchors whose text remains semantically faithful to canonical numbering.

## 8. CSS and JS Doctrine
- CSS styles the semantic DOM and MUST not become the source of meaning.
- JS is optional for `rhoeHtml/document`.
- JS is required for `rhoeHtml/viewer` profile features such as frame navigation, presenter mode, and keyboard shortcuts.
- Shipped viewer JS SHOULD expose stable active-frame metadata and SHOULD keep keyboard behavior additive to semantic DOM, not a replacement for it.

## 9. Pack Contract
- Official reference pack:
  - [`../reference-packs/rhoeHtmlCore/manifest.json`](../reference-packs/rhoeHtmlCore/manifest.json)
- External mode links the pack’s CSS, JS, and templates.
- Inline mode emits a self-contained HTML bundle with embedded style and script assets.

## 10. Conformance Focus
- semantic HTML remains meaningful without JS
- viewer mode upgrades behavior without redefining semantics
- all eight carriers have canonical target fixtures
- HTML-specific assertions cover table semantics, layout-grid behavior, keyboard navigation, and no-JS readability
- reference-pack document, viewer, and inline starter assets remain structurally valid and readable
