# 06 — Semantic Attributes, Brand, and Critic Doctrine

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 0 / Foundation

## 1. Purpose
This chapter defines semantic attributes that cut across carriers and clarifies the place of brand and critic concerns in the baseline architecture.

## 2. Semantic Attributes
- Semantic attributes are AST-level properties that survive multiple source surfaces and multiple target realizations.
- They include:
  - identity
  - genre
  - carrier
  - composition grammar
  - language
  - audience
  - status
  - brand bindings
  - critic bindings

## 3. Brand Doctrine
- Brand sits above raw styling.
- `brandProfileRef` is a semantic binding, not a bag of CSS-like values.
- Brand profiles MAY supply:
  - semantic token mappings
  - rhetorical constraints
  - title grammar
  - asset families
  - theme defaults
- Local styling MAY exist as a controlled escape hatch, but it is lower precedence than semantic brand policy.

## 4. Critic Doctrine
- `criticProfileRef` binds an artifact or local carrier node to an evaluative profile.
- Critic attachments MAY produce:
  - legitimacy findings
  - rhetorical load findings
  - omission or framing warnings
  - migration guidance
- Critic findings do not replace core structural validation.

## 5. Carrier Locality
- Brand and critic refs exist at the root.
- Carrier specializations MAY add local overrides.
- Stage-local shell and zone legitimacy checks are not universal brand rules.

## 6. Diagnostic Attachment
- Diagnostics MAY attach at:
  - artifact root
  - matter zone
  - universal section node
  - carrier-native node
- Diagnostics use the baseline severity vocabulary:
  - `error`
  - `warning`
  - `suggestion`

## 7. Translation Before Layout
- Localization and translation SHOULD resolve before layout-sensitive realization decisions where practical.
- The language core does not bind itself to any vendor-specific translation API.
- Translation-aware composition is a doctrinal requirement, not a product-specific API contract.
