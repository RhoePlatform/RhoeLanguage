# 21 — Extension and Composition Grammar Pack Architecture

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 2 / Realization and Runtime

## 1. Purpose
This chapter defines extension architecture and the composition-grammar pack model required by the `0.9.0` root ontology.

## 2. Pack Families in Part 2
- `compositionGrammarPack`
- `realizationPack`
- brand packs
- critic packs
- extension packs

- `realizationPack` contracts are defined in:
  - [`20e-target-profiles-and-realization-pack-contracts.md`](20e-target-profiles-and-realization-pack-contracts.md)
- Baseline-owned realization packs MAY ship starter templates and inline entrypoints that are smoke-checked as part of conformance.
- This chapter remains focused on composition-grammar packs and extension surfaces.

## 3. Composition Grammar Packs
- A composition-grammar pack is a discoverable package that provides one or more `compositionGrammarRef` entries.
- A pack MAY provide:
  - carrier defaults
  - shell families for `stageFrame`
  - non-stage carrier composition rules
  - validation affordances
  - writer hints
  - canonical fixtures

## 4. Minimal Composition Grammar Pack Contract

| Field | Meaning |
| --- | --- |
| `id` | Package identifier |
| `packageKind` | Must be `compositionGrammarPack` for this manifest family |
| `version` | Package version |
| `provides` | Registry IDs supplied by the pack |
| `carrierArchetypes` | Carriers covered by the pack |
| `entrypoints` | Optional runtime entrypoints |
| `dependencies` | Required packs |

- The machine-readable schema for this contract lives at:
  - [`../machine/schemas/composition-grammar-pack-manifest-v0_9.schema.json`](../machine/schemas/composition-grammar-pack-manifest-v0_9.schema.json)
- A normative example descriptor lives at:
  - [`../machine/examples/stage-default.composition-grammar-pack.json`](../machine/examples/stage-default.composition-grammar-pack.json)

## 5. Composition Grammar Registry
- Built-in core entries are recorded in [`../machine/registries/composition-grammars.json`](../machine/registries/composition-grammars.json).
- A composition grammar entry MUST declare:
  - `id`
  - `carrierArchetype`
  - `label`
  - `status`
  - `packageKind`
  - `provides`

## 6. Resolution Order
1. document-local binding
2. project registry
3. installed namespaced pack
4. built-in core pack

## 7. Extension Surfaces
- semantic block extensions
- visual block extensions
- inline value extensions
- bounded transform helpers
- writer overlays and custom writers

## 8. Namespace Policy
- AST extension IDs use `namespace.localCamelCase`.
- Surface invocation MAY use `@namespace.local-kebab` or other surface-specific forms where defined.
- Package names MAY differ, but package manifests MUST declare which canonical registry IDs they provide.

## 9. Compatibility Bridge
- The `@vendor.*` invocation form remains valid for extension invocation surfaces.
- `compositionGrammarRef` is baseline-owned root infrastructure.
