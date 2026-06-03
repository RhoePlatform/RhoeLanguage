# 10 — RhoeMarkdown Overview and Authoring Doctrine

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 1 / Author Surfaces

## 1. Purpose
This chapter defines the status of `rhoemd` as the primary humane source surface and summarizes the authoring doctrine for the `0.9.0` baseline.

## 2. Surface Identity
- `rhoemd` is the prose-first humane author surface for Rhoe.
- It is a Markdown-hosted extension embedding, not a separate language.
- It is valid only by lowering into the canonical AST defined in Part 0.

## 3. Canonical Source Model
- YAML head frontmatter remains the canonical root metadata surface.
- Body directives serialize universal matter and carrier-native structure.
- Canonical body structure is explicit:
  - `:::front-matter`
  - `:::main-matter`
  - `:::back-matter`
- Canonical stage authoring is frame-primary:
  - `:::frameset`
  - `:::frame`
  - `:::frame-section`
  - `:::zone`

## 4. Compatibility Doctrine
- The following remain parseable but deprecated:
  - `:::frontmatter`
  - `:::mainmatter`
  - `:::backmatter`
  - `:::slide`
  - `:::slide-section`
  - `%%%`
  - `%%`
  - `%`
  - `shell-grammar:`
- Canonical writers MUST emit canonical forms unless strict source preservation was requested.

## 5. Root Metadata Keys

| Key | Normalized target | Status |
| --- | --- | --- |
| `kind` | literal `artifact` | Canonical |
| `carrier` | `carrierArchetype` | Canonical |
| `genre` | `genre` | Canonical |
| `title` | `title` | Canonical |
| `composition-grammar` | `compositionGrammarRef` | Canonical |
| `shell-grammar` | `compositionGrammarRef` | Compatibility alias |
| `brand` | `brandProfileRef` | Canonical |
| `critic-profile` | `criticProfileRef` | Canonical |
| `language` | `language` | Canonical |
| `audience` | `audience` | Canonical |
| `status` | `status` | Canonical |

## 6. Canonical Example

```yaml
---
kind: artifact
carrier: stage/frame
genre: executive/decision
title: Growth Strategy Review
composition-grammar: executive/default
brand: acme.executive.light
critic-profile: executive/default
language: en
status: draft
---
```

## 7. Writer Doctrine
- Parsers MAY accept canonical and compatibility forms.
- Writers SHOULD emit canonical forms.
- Tutorials and examples SHOULD prefer canonical forms.
- Compatibility forms SHOULD be visibly marked as deprecated when shown for migration.
