# 20c — RhoeLaTeX Near-AST Contract

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 2 / Realization and Runtime

## 1. Purpose
This chapter defines `RhoeLaTeX`, the official AST-near LaTeX target-source contract for `0.9.0`.

## 2. Contract Shape
- `RhoeLaTeX` emits LaTeX source using `Rhoe...` environments and `\Rhoe...` commands.
- Parameters map to key-value options.
- Structural nodes use environments.
- Leaf/media nodes use commands.
- External package/class mode and inline-preamble mode are both normative.

## 3. Common Construct Vocabulary

| Semantic family | LaTeX contract |
| --- | --- |
| Artifact root | `\begin{RhoeArtifact}[id={...}, title={...}, carrier={...}, genre={...}, compositionGrammar={...}]` |
| Matter | `\begin{RhoeFrontMatter}`, `\begin{RhoeMainMatter}`, `\begin{RhoeBackMatter}` |
| Sections | `\begin{RhoeSection}[...]`, `\begin{RhoeSubsection}[...]`, `\begin{RhoeSubSubsection}[...]` |
| Reference | `\RhoeRef[target={...}, mode={full}]` |
| Image | `\RhoeImage[src={...}, alt={...}]` |
| Table | `\begin{RhoeTable}[...]` |

## 4. Carrier Mapping Table

| Carrier | Root and carrier-native constructors |
| --- | --- |
| `stageFrame` | `RhoeFrameSet`, `RhoeFrame`, `RhoeFrameSection`, `RhoeAppendixFrameSet`, `RhoeZone` |
| `codexSpread` | `RhoeCodex`, `RhoeChapter`, `RhoeSpread`, `RhoeAppendix`, `RhoeReferenceApparatus` |
| `scrollStream` | `RhoeStream`, `RhoeFileSegment`, `RhoeAnchor`, `RhoeSupportMatter`, `RhoeJump` |
| `tableauPageCollage` | `RhoeTableauDocument`, `RhoePageFamily`, `RhoeTableauPage`, `RhoeRegionGroup`, `RhoeHeroRegion`, `RhoeSupportRegion` |
| `sheetField` | `RhoeFieldDocument`, `RhoeSheet`, `RhoePerimeter`, `RhoeTopBand`, `RhoeBottomBand`, `RhoeSideBand`, `RhoeRegion` |
| `ledgerRegister` | `RhoeRegister`, `RhoeCollection`, `RhoeSchema`, `RhoeRecord`, `RhoeForm`, `RhoeDashboard`, `RhoeConstraint` |
| `box` | `RhoeBox`, `RhoeTagCatalog`, `RhoeFragment`, `RhoeSubcollection`, `RhoeCluster`, `RhoeSavedView` |
| `conversationThread` | `RhoeThread`, `RhoeParticipantProfile`, `RhoeTopicBriefing`, `RhoeConductDoctrine`, `RhoeEpisode`, `RhoeBranch`, `RhoeTurn`, `RhoeAttachmentRef`, `RhoeOutcome` |

## 5. Stage-Specific Rules
- `RhoeFrame` accepts key-value options for:
  - `shellRole`
  - `shell`
  - `shellPack`
  - `continuation`
  - `brand`
  - `criticProfile`
- `RhoeZone` is the canonical zone environment and MUST carry `role={...}`.
- Canonical emitted `RhoeLaTeX` does not place stage body content directly inside `RhoeFrame` without zones.

## 6. Numbering, References, and Identity
- Number-bearing environments MUST place stable labels internally from Rhoe IDs.
- `\RhoeRef[...]` is the canonical cross-reference macro for AST-near emission.
- Emitters MAY rely on native `\label` and `\ref` under the hood, but the source contract remains Rhoe-prefixed and readable.

## 7. Brand, Critic, and Matter
- Root-level brand and critic bindings surface as artifact options and package-level configuration hooks.
- The LaTeX package/class defines rendering and style policy; the emitter defines semantic structure.
- Matter boundaries remain explicit through dedicated environments.

## 8. Pack Contract
- Official reference pack:
  - [`../reference-packs/rhoeLatexCore/manifest.json`](../reference-packs/rhoeLatexCore/manifest.json)
- External mode uses `rhoe-core.sty` or `rhoe-core.cls`.
- Inline mode emits a self-contained preamble using the pack’s inline entrypoint as literal LaTeX source.
- Canonical fixture validation MUST invoke `latexmk` from the fixture directory, or with an explicitly equivalent package-resolution configuration, so the shipped relative reference-pack imports resolve reproducibly.

## 9. Conformance Focus
- emitted LaTeX is expl3-compatible and readable
- all eight carriers have canonical target fixtures
- numbering, references, zones, and matter survive target emission
- reference-pack document, presentation, and inline starter assets compile cleanly
