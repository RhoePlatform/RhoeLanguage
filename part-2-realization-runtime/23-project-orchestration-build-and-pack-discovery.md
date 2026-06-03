# 23 — Project Orchestration, Build, and Pack Discovery

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 2 / Realization and Runtime

## 1. Purpose
This chapter defines the project-level discovery model for packs, registries, fixtures, and builds.

## 2. Discovery Targets
- composition grammar packs
- realization packs
- brand packs
- critic packs
- extension packs
- carrier-specific helper packs
- fixture suite manifests

## 3. Discovery Order
1. document-local declarations
2. project manifest
3. workspace pack directories
4. installed global pack registry
5. built-in baseline packs

## 4. Required Machine Contracts
- composition-grammar pack manifests for shipped baseline assets MUST validate against:
  - [`../machine/schemas/composition-grammar-pack-manifest-v0_9.schema.json`](../machine/schemas/composition-grammar-pack-manifest-v0_9.schema.json)
- realization-pack manifests for shipped baseline assets MUST validate against:
  - [`../machine/schemas/realization-pack-manifest-v0_9.schema.json`](../machine/schemas/realization-pack-manifest-v0_9.schema.json)
- fixture suite manifests for shipped baseline assets MUST validate against:
  - [`../machine/schemas/fixture-suite-manifest-v0_9.schema.json`](../machine/schemas/fixture-suite-manifest-v0_9.schema.json)

## 5. Build Selection
- A target build selects:
  - one `carrierArchetype`
  - one `compositionGrammarRef`
  - one target surface
  - one realization profile
  - one realization pack
  - one validation profile

## 6. Build Inputs
- source artifacts
- registry bundles
- discovered packs
- shipped fixture suites
- target surface selection
- realization profile selection
- build and validation profiles

## 7. Build Outputs
- canonical AST snapshots
- target-source realizations
- derived artifacts
- validation reports
- critic reports
- migration reports

## 8. Reproducibility Rule
- Build discovery SHOULD be deterministic.
- Pack resolution SHOULD be recorded in build metadata or transformation history when material to reproducibility.
