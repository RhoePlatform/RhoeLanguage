# 15 — RhoeMarkdown Formal Grammar and Tokenization

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 1 / Author Surfaces

## 1. Purpose
This chapter defines the grammar ownership model for `rhoemd`, the canonical token families, and the boundary between prose grammar, parser-oriented grammar, and conformance fixtures.

## 2. Grammar Ownership
- Normative surface meaning lives in Part 1 prose.
- [`../machine/grammars/rhoemd-v0_9.peg`](../machine/grammars/rhoemd-v0_9.peg) is the primary parser-oriented grammar artifact.
- [`../machine/grammars/rhoemd-v0_9.ebnf`](../machine/grammars/rhoemd-v0_9.ebnf) is the informative structural mirror of the same baseline.
- [`../machine/grammars/README.md`](../machine/grammars/README.md) records the synchronization policy for prose, grammars, registries, and fixtures.

## 3. Prose Grammar Skeleton
- `document := [head] body EOF`
- `body := *(blank-line / matter-directive / typed-directive / block)`
- `matter-directive := canonical-matter-directive / compatibility-matter-directive`
- `typed-directive := universal-structure / stage / non-stage / deprecated-slide / generic-extension`
- `block := ordinary markdown blocks, semantic blocks, or notation-island blocks that remain legal in the current carrier and composition grammar`

## 4. Canonical Tokens
- Head YAML delimiter: `---`
- Typed directive fence family: three or more consecutive colons
- Semantic block fence: `!!!`
- Attribute list delimiters: `{` and `}`

## 5. Canonical Directive Families
- universal matter directives
- universal section directives
- stage carrier directives
- non-stage carrier directives
- visual and layout blocks
- notation-island directives explicitly permitted by carrier or grammar packs

## 6. Compatibility Tokens
- `%%%`
- `%%`
- `%`
- unhyphenated matter directive names
- `slide` and `slide-section`

## 7. Tokenization Rules
- Directive names are case-sensitive.
- Directive open and close fences MUST match in length.
- Nested directives in canonical source MUST use strictly longer fences than their containing directive.
- Attribute keys are case-insensitive at parse time but normalize to canonical keys.
- Registry IDs remain case-sensitive in canonical AST form.
- Compatibility aliases are recognized before generic error recovery.

## 8. Canonicalization Rules
- Canonical writers emit hyphenated matter directive names.
- Canonical writers emit `frame` rather than `slide`.
- Canonical writers emit `composition-grammar` rather than `shell-grammar`.

## 9. Formal Grammar Boundary
- The PEG and EBNF grammars model directive families, token boundaries, and dispatch order.
- Exact opener-to-closer fence equality and strictly increasing nested fence lengths are normative parser and conformance obligations.
- Those exact fence-equality rules are represented in this prose chapter and in shipped negative fixtures even where the formal grammars model the broader directive-fence family.
- Registry legitimacy and carrier-node placement are semantic-analysis concerns, not grammar-only concerns.
