# 13 — RhoeMarkdown StageFrame Surface and Compatibility

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 1 / Author Surfaces

## 1. Purpose
This chapter defines the canonical `stageFrame` surface, including frame authoring, typed zones, shell attributes, and deprecated slide compatibility.

## 2. Canonical Stage Directives
- `:::frameset`
- `:::frame`
- `:::frame-section`
- `:::appendix-frameset`
- `:::zone`

## 3. Stage Attributes

| Directive | Attribute | Meaning |
| --- | --- | --- |
| `frameset` | `aspect=` | Aspect ratio |
| `frame` | `shell-role=` | Canonical stage shell role |
| `frame` | `shell=` | Shell archetype or local shell reference |
| `frame` | `shell-pack=` | Shell-pack override |
| `frame` | `continue=` | Continuation hint |
| `frame` | `brand=` | Local brand override |
| `frame` | `critic-profile=` | Local critic override |
| `zone` | selector | `header`, `main`, `aside`, `footer`, `background`, `overlay`, `label`, `badge`, `payload` |

## 4. Zone Scope Rule
- `:::zone` is legal only inside `:::frame` and deprecated `:::slide`.
- Unzoned direct frame content is compatibility input only.
- Canonical stage emission MUST use zones.

## 5. Canonical Stage Example

````markdown
---
kind: artifact
carrier: stage/frame
genre: executive/decision
title: Growth Strategy Review
composition-grammar: executive/default
brand: acme.executive.light
critic-profile: executive/default
---

::::front-matter
:::::frameset {id=opening aspect=16:9}
::::::frame {shell-role=cover-opener shell=cover-standard}
:::::::zone main
# Growth Strategy Review
## Decision framing for FY2027
:::::::
::::::
:::::
::::

::::main-matter
:::::frame-section {title="Decision"}
::::::frameset {id=core aspect=16:9}
:::::::frame {shell-role=comparison-option shell=option-comparison}
::::::::zone header
Option B creates the strongest margin expansion with acceptable execution risk.
::::::::
::::::::zone main
| Option | Margin uplift | Risk |
| --- | ---: | --- |
| A | +2 pts | low |
| B | +5 pts | medium |
::::::::
::::::::zone aside
Assumptions: phased migration, pricing uplift, no phase-one headcount reduction.
::::::::
:::::::
::::::
:::::
::::

::::back-matter
:::::appendix-frameset {id=appendix}
::::::frame {shell-role=appendix-support}
:::::::zone main
Appendix evidence and references.
:::::::
::::::
:::::
::::
````

## 6. Compatibility Aliases

| Source form | Status | Canonical target |
| --- | --- | --- |
| `:::slide` | Deprecated compatibility alias | `:::frame` |
| `:::slide-section` | Deprecated compatibility alias | `:::frame-section` |
| `%%% {type=title}` | Deprecated compatibility input | `Frame` with `shellRole = coverOpener` |
| `%%% {type=section}` | Deprecated compatibility input | `Frame` with `shellRole = sectionDivider` |
| `%%% {type=content}` | Deprecated compatibility input | compatibility-mode `Frame` |
| `%% SLOT` | Deprecated compatibility input | stage `:::zone` with compatibility placement hints |
| `% CELL` | Deprecated compatibility input | stage `:::zone` with compatibility cell hints |

## 7. Deprecated Example
- The following example is an abbreviated compatibility fragment, not canonical emitted source.

````markdown
::::main-matter
:::::slide {shell-role=hero-claim}
::::::zone main
Headline
::::::
:::::
::::
````

- Expected behavior: parse successfully, issue a `suggestion`, normalize to `:::frame`.

## 8. Stage Genre Surface Sugar

| Surface form | Canonical AST form |
| --- | --- |
| `story/journey` | `storyJourney` |
| `pitch/showcase` | `pitchShowcase` |
| `executive/decision` | `executiveDecision` |
| `review/reference` | `reviewReference` |
| `explanation/alignment` | `explanationAlignment` |
