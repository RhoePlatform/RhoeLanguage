# 09 — Core Registries

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 0 / Foundation

## 1. Purpose
This chapter defines the core registries required by the `0.9.0` baseline and points to their machine-readable forms.

## 2. Registry Ownership
- Core registries are baseline-owned.
- Extension registries may add namespaced entries where permitted.
- Extension registries MUST NOT override built-in IDs.

## 3. Baseline Registries

| Registry | Machine artifact |
| --- | --- |
| carriers | [`../machine/registries/carriers.json`](../machine/registries/carriers.json) |
| stage genres | [`../machine/registries/stage-genres.json`](../machine/registries/stage-genres.json) |
| stage shell roles | [`../machine/registries/stage-shell-roles.json`](../machine/registries/stage-shell-roles.json) |
| stage zones | [`../machine/registries/stage-zones.json`](../machine/registries/stage-zones.json) |
| composition grammars | [`../machine/registries/composition-grammars.json`](../machine/registries/composition-grammars.json) |
| target surfaces | [`../machine/registries/target-surfaces.json`](../machine/registries/target-surfaces.json) |
| realization profiles | [`../machine/registries/realization-profiles.json`](../machine/registries/realization-profiles.json) |
| realization packs | [`../machine/registries/realization-packs.json`](../machine/registries/realization-packs.json) |
| compatibility aliases | [`../machine/registries/compatibility-aliases.json`](../machine/registries/compatibility-aliases.json) |
| `rhoemd` keywords | [`../machine/registries/rhoemd-keywords.json`](../machine/registries/rhoemd-keywords.json) |

## 4. Identifier Policy
- Core IDs use bare camelCase.
- Extension IDs in AST space use `namespace.localCamelCase`.
- Extension package names MAY use different surface naming conventions, but package metadata MUST declare the canonical registry IDs they provide.
- Surface sugar MAY expose `namespace/local-kebab` forms that normalize back to AST IDs.

## 5. Carrier Registry
- Canonical carrier IDs:
  - `stageFrame`
  - `codexSpread`
  - `scrollStream`
  - `tableauPageCollage`
  - `sheetField`
  - `ledgerRegister`
  - `box`
  - `conversationThread`
- Each carrier registry entry MUST declare:
  - canonical carrier ID
  - canonical surface spelling
  - depth/status metadata
  - canonical node kinds
  - canonical built-in directive spellings

## 6. Stage Registry Families
- Genres:
  - `storyJourney`
  - `pitchShowcase`
  - `executiveDecision`
  - `reviewReference`
  - `explanationAlignment`
- Shell roles:
  - `coverOpener`
  - `sectionDivider`
  - `heroClaim`
  - `contextSetup`
  - `evidenceProof`
  - `frameworkModel`
  - `comparisonOption`
  - `processJourney`
  - `recommendationAsk`
  - `summaryTakeaway`
  - `closingLanding`
  - `appendixSupport`
- Zones:
  - `header`
  - `main`
  - `aside`
  - `footer`
  - `background`
  - `overlay`
  - `label`
  - `badge`
  - `payload`

## 7. Composition Grammar Registry Contract
- Every built-in grammar entry MUST declare:
  - `id`
  - `carrierArchetype`
  - `label`
  - `status`
  - `packageKind`
  - `provides`
- Manifest-level pack validation is defined in Part 2 and backed by:
  - [`../machine/schemas/composition-grammar-pack-manifest-v0_9.schema.json`](../machine/schemas/composition-grammar-pack-manifest-v0_9.schema.json)

## 8. Target Surface Registry Contract
- Built-in target surface IDs:
  - `rhoeTypst`
  - `rhoeLatex`
  - `rhoeHtml`
- Every target surface entry MUST declare:
  - `id`
  - `label`
  - `hostLanguage`
  - `status`
  - `modes`

## 9. Realization Profile and Pack Registry Contract
- Realization profiles are baseline-owned IDs that bind a target surface to a stable delivery profile.
- Built-in profile IDs:
  - `rhoeTypst/document`
  - `rhoeTypst/presentation`
  - `rhoeLatex/document`
  - `rhoeLatex/presentation`
  - `rhoeHtml/document`
  - `rhoeHtml/viewer`
  - `rhoeHtml/portal`
- Every built-in realization pack entry MUST declare:
  - `id`
  - `targetSurface`
  - `packageKind`
  - `profiles`
  - `carrierArchetypes`
  - `manifestPath`
- Manifest-level validation is defined in Part 2 and backed by:
  - [`../machine/schemas/realization-pack-manifest-v0_9.schema.json`](../machine/schemas/realization-pack-manifest-v0_9.schema.json)
