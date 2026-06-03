# 11 — RhoeMarkdown Core Block and Inline Syntax

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 1 / Author Surfaces

## 1. Purpose
This chapter records the core `rhoemd` block and inline conventions that remain shared across carriers.

## 2. Core Block Families
- Markdown paragraph, list, blockquote, and heading forms remain valid prose hosts.
- Directive containers introduced by `:::` are the canonical typed container family.
- Semantic fenced blocks introduced by `!!!` remain available for semantic block families.
- Fenced code blocks remain valid literal blocks.
- Tables remain valid authoring syntax and lower into canonical table structures or carrier-native nodes as appropriate.

## 3. Inline Forms
- Emphasis, strong emphasis, links, code spans, and inline images remain valid inline authoring constructs.
- Inline compatibility and transform behavior does not change the canonical AST doctrine.
- Inline surface sugar is valid only when it lowers deterministically.

## 4. Attribute Lists
- Directives MAY carry attribute lists in braces.
- Attributes are normalized into canonical camelCase field names or carrier-specific payloads.
- Boolean flags are presence-based.
- Quoted values are required for values containing whitespace.

## 5. Typed Container Doctrine
- `:::` is the canonical typed container and directive family in `0.9.0`.
- It is used for:
  - matter directives
  - universal structure directives
  - carrier-native directives
  - visual and layout blocks
  - notation-island hosts when explicitly permitted
- This doctrine supersedes the older idea that `:::` was mainly a visual family while slide syntax lived elsewhere.

## 6. Fence-Length Nesting Rule
- A directive fence consists of three or more consecutive colons.
- The closing fence MUST match the opening fence length exactly.
- A nested directive MUST use a strictly longer fence than the directive that contains it.
- Canonical examples in this baseline follow that rule.
- Parsers MAY accept weaker legacy nesting patterns in compatibility mode, but writers MUST emit valid fence-length nesting.

## 7. Headings
- Ordinary Markdown headings MAY appear inside carrier-native content.
- Headings alone do not create universal section nodes in canonical source.
- Canonical structural authoring uses `:::section`, `:::subsection`, and `:::subsubsection`, or carrier-native structural directives that lower to those nodes.
- Compatibility importers MAY recover structural section nodes from heading hierarchies during guided migration.
