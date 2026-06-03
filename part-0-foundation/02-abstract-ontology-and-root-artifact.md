# 02 — Abstract Ontology and Root Artifact

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 0 / Foundation

## 1. Purpose
This chapter defines the canonical root object, the universal structural envelope, and the relationship between universal ontology and carrier specialization.

## 2. Foundational Decision
- Every valid Rhoe artifact lowers to one canonical `Artifact` root.
- `Artifact` replaces older universal roots such as `Document` and presentation-shaped roots such as `NarrativeDocument`.
- Presentations survive as `stageFrame`, the first deeply elaborated carrier specialization.

## 3. Canonical Root

### 3.1 Required fields

| Field | Type | Meaning |
| --- | --- | --- |
| `id` | string | Stable artifact identifier |
| `title` | string | Human-facing title |
| `carrierArchetype` | carrier ID | Canonical carrier registry value |
| `genre` | genre ID | Root genre binding |
| `matter` | `MatterEnvelope` | Universal matter envelope |
| `compositionGrammarRef` | ref string | Root composition grammar binding |
| `metadata` | object | Additional structured metadata |

### 3.2 Optional scalar fields

| Field | Meaning |
| --- | --- |
| `brandProfileRef` | Semantic brand profile binding |
| `criticProfileRef` | Critic or validation profile binding |
| `language` | Default language |
| `audience` | Intended audience descriptor |
| `status` | Lifecycle or workflow state |

### 3.3 Canonical collection fields
- The following fields are canonically present as arrays and MUST exist even when empty:
  - `attachments`
  - `references`
  - `projections`
  - `transformationHistory`

This rule resolves optional-versus-empty-array ambiguity for baseline validation.

### 3.4 Pseudo-schema

```swift
struct Artifact {
    var id: String
    var title: String
    var carrierArchetype: CarrierArchetype
    var genre: String
    var matter: MatterEnvelope
    var compositionGrammarRef: String
    var metadata: ArtifactMetadata
    var brandProfileRef: String?
    var criticProfileRef: String?
    var language: String?
    var audience: String?
    var status: String?
    var attachments: [AttachmentRef]
    var references: [Reference]
    var projections: [ProjectionRef]
    var transformationHistory: [TransformationRecord]
}
```

## 4. Universal Matter Envelope

```swift
struct MatterEnvelope {
    var frontMatter: [MatterNode]
    var mainMatter: [MatterNode]
    var backMatter: [MatterNode]
}
```

- `frontMatter`, `mainMatter`, and `backMatter` are universal semantic zones.
- They MUST always exist in the canonical AST.
- Empty matter arrays are valid.
- Surface parsers MAY synthesize absent matter zones only in compatibility mode.
- Canonical writers MUST emit all three matter zones.

## 5. Universal Structure Spine

```swift
struct Section {
    var id: String
    var title: String?
    var children: [MatterNode]
}

struct Subsection {
    var id: String
    var title: String?
    var children: [MatterNode]
}

struct SubSubsection {
    var id: String
    var title: String?
    var children: [MatterNode]
}
```

- These nodes are semantic, not typographic.
- Carriers realize them differently.
- Carrier-native structures refine the spine. They do not replace it.

## 6. Carrier Model
- Every artifact declares exactly one `carrierArchetype`.
- The canonical carrier registry is:
  - `stageFrame`
  - `codexSpread`
  - `scrollStream`
  - `tableauPageCollage`
  - `sheetField`
  - `ledgerRegister`
  - `box`
  - `conversationThread`
- `stageFrame` is the first deeply elaborated carrier specialization.
- Non-stage carriers are normative-minimum in `0.9.0`.

## 7. Genre Model
- `genre` is root-level and independent of `carrierArchetype`.
- Only the five `stageFrame` genres are standardized in this baseline:
  - `storyJourney`
  - `pitchShowcase`
  - `executiveDecision`
  - `reviewReference`
  - `explanationAlignment`
- Extension genres MUST use the namespaced form `namespace.localCamelCase` in the AST.

## 8. Composition Grammar
- `compositionGrammarRef` is the universal root binding that links the artifact to a carrier-aware composition-grammar pack.
- It replaces `shellGrammarRef` as the preferred carrier-neutral root term.
- `shellGrammarRef` remains superseded or `stageFrame`-local compatibility language only.
- `compositionGrammarRef` resolution is defined in Part 2 and machine registries.

## 9. Carrier Specialization Boundary
- Carrier families MAY define carrier-native nodes and realization rules.
- Carrier families MUST NOT change the root shape.
- Stage-local shell, zone, continuation, brand, and critic semantics remain local to `stageFrame`.
- Universal matter directives are never reinterpreted as stage zones.

## 10. Compatibility Bridge

| Superseded model | `0.9.0` canonical replacement |
| --- | --- |
| `Document` root | `Artifact` |
| `NarrativeDocument` root | `Artifact` |
| `artifactKind` | `carrierArchetype` |
| `Deck` | `stageFrame` carrier structures |
| `SlideNode` | `Frame` |
| `shellGrammarRef` at root | `compositionGrammarRef` |
