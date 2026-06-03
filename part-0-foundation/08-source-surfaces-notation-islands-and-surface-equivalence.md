# 08 — Source Surfaces, Notation Islands, and Surface Equivalence

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 0 / Foundation

## 1. Purpose
This chapter defines the relationship between humane source surfaces, notation islands, and canonical equivalence.

## 2. Humane Source Surfaces
- `rhoemd` is the prose-first humane surface.
- `rhoedsl` is the structure-first humane surface.
- Neither surface is a separate language.
- Both surfaces are valid only by lowering into the canonical AST.

## 3. Canonical Serialized Surface
- `RhoeJSON` is the machine-neutral serialized surface for interchange and fixtures.
- It is not the primary authoring surface.

## 4. Secondary Near-AST Target Surfaces
- `RhoeTypst`, `RhoeLaTeX`, and `RhoeHTML` are official Part 2 near-AST target-source surfaces.
- They are emitted and editable target-native contracts.
- They are not humane source surfaces and they are not part of Part 1 surface-equivalence doctrine.
- Their host-language grammars remain authoritative for token-level syntax.

## 5. Notation Islands
- A notation island is a bounded syntax region hosted inside a primary surface.
- Notation islands are permitted when:
  - their boundary is explicit
  - they lower into canonical AST structure
  - they do not seize semantic authority from the AST

## 6. Surface Equivalence
- Two sources are equivalent if they normalize to the same canonical AST.
- Deprecated compatibility sources remain equivalent to canonical sources only if their lowering path is explicitly defined.
- Surface equivalence does not require source-text preservation.
- Round-trip stability requires semantic preservation, not identical token preservation.

## 7. Canonical and Compatibility Surfaces
- Canonical stage surface:
  - `:::front-matter`
  - `:::main-matter`
  - `:::back-matter`
  - `:::frameset`
  - `:::frame`
  - `:::frame-section`
  - `:::zone`
- Compatibility stage surface:
  - `:::slide`
  - `:::slide-section`
  - `%%%`
  - `%%`
  - `%`
- Compatibility root metadata alias:
  - `shell-grammar:` -> `composition-grammar:`

## 8. Writer Doctrine
- Canonical writers MUST emit canonical forms unless strict preservation mode is explicitly requested.
- Strict preservation MAY retain deprecated spellings in raw-source round-trip tools, but it does not change the canonical AST.
- Part 2 target writers MAY emit `RhoeTypst`, `RhoeLaTeX`, and `RhoeHTML`, but those emitted surfaces do not participate in Part 1 equivalence claims.
