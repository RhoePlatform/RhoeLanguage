# 20e — Target Profiles and Realization Pack Contracts

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 2 / Realization and Runtime

## 1. Purpose
This chapter defines target-surface selection, realization profiles, and the official realization-pack contract for `0.9.0`.

## 2. Built-In Target Surfaces

| ID | Label | Modes |
| --- | --- | --- |
| `rhoeTypst` | `RhoeTypst` | external package, inline definitions |
| `rhoeLatex` | `RhoeLaTeX` | external package/class, inline preamble |
| `rhoeHtml` | `RhoeHTML` | external linked assets, inline bundle |

- Machine registry:
  - [`../machine/registries/target-surfaces.json`](../machine/registries/target-surfaces.json)

## 3. Built-In Realization Profiles

| ID | Meaning |
| --- | --- |
| `rhoeTypst/document` | paginated document emission |
| `rhoeTypst/presentation` | stage-oriented paginated deck emission |
| `rhoeLatex/document` | document-class emission |
| `rhoeLatex/presentation` | slide or deck-class emission |
| `rhoeHtml/document` | semantic document HTML without required JS |
| `rhoeHtml/viewer` | stage viewer HTML with required enhancement JS |
| `rhoeHtml/portal` | multi-page navigable HTML portal |

- Machine registry:
  - [`../machine/registries/realization-profiles.json`](../machine/registries/realization-profiles.json)

## 4. Build Selection Tuple
- A target build in `0.9.0` selects exactly one of each:
  - `carrierArchetype`
  - `compositionGrammarRef`
  - target surface
  - realization profile
  - realization pack
- This selection is a Part 2 build concern and does not add new root AST fields.

## 5. Realization Pack Contract

| Field | Meaning |
| --- | --- |
| `id` | Pack identifier |
| `packageKind` | Must be `realizationPack` |
| `version` | Pack version |
| `targetSurface` | One built-in target-surface ID |
| `realizationProfiles` | Profiles served by the pack |
| `carrierArchetypes` | Carriers covered by the pack |
| `entrypoints` | Named entry files for external and inline modes |
| `assets` | Ancillary files shipped by the pack |
| `dependencies` | Required packs or host packages |

- Machine schema:
  - [`../machine/schemas/realization-pack-manifest-v0_9.schema.json`](../machine/schemas/realization-pack-manifest-v0_9.schema.json)
- Registry:
  - [`../machine/registries/realization-packs.json`](../machine/registries/realization-packs.json)
- Inline entrypoints are embed-ready source blobs rather than import-only indirections.

## 6. Official Baseline Packs

| Pack ID | Target surface | Profiles |
| --- | --- | --- |
| `rhoeTypstCore` | `rhoeTypst` | `rhoeTypst/document`, `rhoeTypst/presentation` |
| `rhoeLatexCore` | `rhoeLatex` | `rhoeLatex/document`, `rhoeLatex/presentation` |
| `rhoeHtmlCore` | `rhoeHtml` | `rhoeHtml/document`, `rhoeHtml/viewer`, `rhoeHtml/portal` |

## 7. Discovery and Resolution
- Realization packs resolve after composition grammar resolution and before target emission.
- Discovery order:
  1. document-local build binding
  2. project manifest
  3. workspace pack directories
  4. installed global pack registry
  5. built-in baseline packs

## 8. Reference Pack Location
- Baseline-owned reference packs live in:
  - [`../reference-packs/00-reference-packs-index.md`](../reference-packs/00-reference-packs-index.md)
