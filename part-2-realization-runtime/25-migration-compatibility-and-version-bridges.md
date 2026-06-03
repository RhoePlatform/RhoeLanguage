# 25 — Migration, Compatibility, and Version Bridges

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 2 / Realization and Runtime

## 1. Purpose
This chapter defines migration and compatibility behavior for source forms that can be lowered into the `0.9.0` baseline.

## 2. Fixed Migration Order
1. identify carrier
2. identify genre
3. recover `frontMatter`, `mainMatter`, and `backMatter`
4. recover universal section structure
5. bind `compositionGrammarRef`
6. promote local content into carrier-native nodes

## 3. Migration Classes

| Class | Meaning |
| --- | --- |
| automatic lowering | legacy syntax or naming is old, but the intended AST is recoverable |
| guided inference | additional tool-assisted structure recovery is needed |
| manual migration | human redesign is required |

## 4. Compatibility Bridge
- `Document` -> `Artifact`
- `Deck` -> `stageFrame` carrier structures
- `Slide` -> `Frame`
- `SlotContent` -> stage zones or carrier-specific structures

## 5. Carrier Naming Compatibility
- The superseded `shoebox` carrier spelling is normalized to the canonical `box` carrier ID.
- The preferred `rhoemd` surface spelling for the canonical `box` carrier is `box/collection`.

## 6. Compatibility Inputs
- `shell-grammar:` remains accepted as a deprecated alias.
- `kind: presentation` remains accepted as a deprecated alias bundle.
- older slide syntax remains parseable where lowering rules are defined.

## 7. Non-Goals
- Compatibility does not require canonical writers to preserve obsolete spellings.
- Migration tooling does not promise to infer missing semantics that were never encoded.
