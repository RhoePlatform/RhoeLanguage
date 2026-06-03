# 20a — Secondary Near-AST Surface Doctrine

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 2 / Realization and Runtime

## 1. Purpose
This chapter defines the shared contract for `RhoeTypst`, `RhoeLaTeX`, and `RhoeHTML`.

## 2. What These Surfaces Are
- official emitted/editable target-native contracts
- AST-near realizations
- host-ecosystem-friendly source outputs

## 3. What These Surfaces Are Not
- not humane author surfaces
- not canonical serialized surfaces
- not parse-back requirements in `0.9.0`
- not alternate semantic authorities
- not surface-equivalent with Part 1 humane source surfaces

## 4. Shared Structural Contract

| Semantic family | `RhoeTypst` | `RhoeLaTeX` | `RhoeHTML` |
| --- | --- | --- | --- |
| `Artifact` root | `#rhoe-artifact(...)` | `\begin{RhoeArtifact}[...]` | `<article class="rhoe-artifact" ...>` |
| `frontMatter` | `#rhoe-front-matter[...]` | `\begin{RhoeFrontMatter}` | `<section class="rhoe-front-matter" ...>` |
| `mainMatter` | `#rhoe-main-matter[...]` | `\begin{RhoeMainMatter}` | `<section class="rhoe-main-matter" ...>` |
| `backMatter` | `#rhoe-back-matter[...]` | `\begin{RhoeBackMatter}` | `<section class="rhoe-back-matter" ...>` |
| `Section` | `#rhoe-section(...)` | `\begin{RhoeSection}[...]` | `<section class="rhoe-section" ...>` |
| `Subsection` | `#rhoe-subsection(...)` | `\begin{RhoeSubsection}[...]` | `<section class="rhoe-subsection" ...>` |
| `SubSubsection` | `#rhoe-subsubsection(...)` | `\begin{RhoeSubSubsection}[...]` | `<section class="rhoe-subsubsection" ...>` |

## 5. Shared Preservation Rules
- All secondary near-AST surfaces MUST preserve:
  - artifact identity
  - matter boundaries
  - carrier structure
  - numbering and reference anchors
  - projection visibility
  - brand and critic bindings where a target can expose them without changing meaning
- Writer hints remain second-class advisors.

## 6. Editability Rule
- These surfaces SHOULD be readable and debuggable by users native to the host ecosystem.
- An edited target-native file is valid only as a host-language file unless a tool explicitly reprojects it through a constrained Rhoe-aware workflow.
- General parse-back from these surfaces to the AST is out of scope for `0.9.0`.

## 7. Pack Modes
- External mode:
  - the emitted file imports or links an official realization pack
- Inline mode:
  - the emitted file embeds the minimal embed-ready definitions or assets needed to run on its own
- Both modes are normative for all three target surfaces.

## 8. Degradation Rule
- If a host medium cannot express a behavior exactly, the target surface MUST preserve:
  - content
  - identity
  - numbering
  - referenceability
  - declared projection visibility
- A degraded contract must be documented per target rather than improvised silently.
