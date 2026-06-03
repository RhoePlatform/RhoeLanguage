# 20 — Target Realization and Emission Doctrine

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 2 / Realization and Runtime

## 1. Purpose
This chapter defines the realization hierarchy for the `0.9.0` baseline and fixes the place of `RhoeTypst`, `RhoeLaTeX`, and `RhoeHTML` inside that hierarchy.

## 2. Realization Hierarchy
- Humane source surfaces:
  - `rhoemd`
  - `rhoedsl`
- Canonical serialized surface:
  - `RhoeJSON`
- Secondary near-AST target-source surfaces:
  - `RhoeTypst`
  - `RhoeLaTeX`
  - `RhoeHTML`
- Derived render artifacts:
  - PDF
  - packaged HTML viewers or portals
  - assistive bundles
  - summary or LLM-oriented bundles

## 3. Authority Rule
- Canonical authority remains at the AST level.
- `rhoemd` and `rhoedsl` remain the only humane source surfaces.
- `RhoeJSON` remains the canonical serialized notation of the AST.
- `RhoeTypst`, `RhoeLaTeX`, and `RhoeHTML` are official emitted and editable target-native contracts, but they are not parse-back surfaces in `0.9.0`.

## 4. Secondary Near-AST Surface Rule
- A secondary near-AST surface MUST:
  - begin from canonical `Artifact`
  - preserve `MatterEnvelope`
  - preserve universal section structure
  - preserve carrier-native node families
  - preserve numbering, identity, references, and projection visibility
- A secondary near-AST surface MUST NOT:
  - redefine AST semantics
  - become a new authority layer
  - become surface-equivalent with Part 1 humane source surfaces
  - bypass canonical lowering

## 5. Realization Inputs
- canonical `Artifact`
- resolved registries
- resolved `compositionGrammarRef`
- optional resolved brand and critic packs
- selected target surface
- selected realization profile
- selected realization pack
- build profile

## 6. Realization Modes
- External pack mode:
  - emitted source depends on an installed or discoverable realization pack
- Inline mode:
  - emitted source carries embed-ready self-contained definitions, preamble content, or bundled assets
- Derived render mode:
  - emitted source is compiled or rendered into a final artifact by host tooling

## 7. Carrier Rule
- All eight baseline carriers are in scope for `RhoeTypst`, `RhoeLaTeX`, and `RhoeHTML`.
- `stageFrame` may have richer profile behavior, but it does not receive privileged doctrinal status here.
- Non-stage carriers are baseline-complete target contracts, not generic fallback residue.

## 8. Host-Language Rule
- Host-language grammars remain authoritative for Typst, LaTeX, and HTML syntax.
- The Rhoe baseline standardizes:
  - emitted construct vocabulary
  - pack manifest contracts
  - realization profile IDs
  - conformance expectations
- The baseline does not define standalone replacement grammars for Typst, LaTeX, or HTML.

## 9. Companion Chapters
- Common secondary-surface doctrine:
  - [`20a-secondary-near-ast-surface-doctrine.md`](20a-secondary-near-ast-surface-doctrine.md)
- Target-specific contracts:
  - [`20b-rhoetypst-near-ast-contract.md`](20b-rhoetypst-near-ast-contract.md)
  - [`20c-rhoelatex-near-ast-contract.md`](20c-rhoelatex-near-ast-contract.md)
  - [`20d-rhoehtml-near-ast-contract.md`](20d-rhoehtml-near-ast-contract.md)
- Target profiles and pack contracts:
  - [`20e-target-profiles-and-realization-pack-contracts.md`](20e-target-profiles-and-realization-pack-contracts.md)
