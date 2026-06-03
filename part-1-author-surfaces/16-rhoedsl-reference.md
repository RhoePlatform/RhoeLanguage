# 16 — RhoeDSL Reference

## Status
- Normative baseline
- Version: `0.9.0`
- Layer: Part 1 / Author Surfaces

## 1. Purpose
This chapter defines `rhoedsl` as the structure-first humane surface aligned to the `0.9.0` canonical AST.

## 2. Surface Status
- `rhoedsl` is a humane structural mirror of the canonical AST.
- It is not the AST itself.
- It is not a revived Swift-subset language.
- It is a disciplined structural surface for authors and tools that prefer explicit braces and explicit node identity.

## 3. Stage Sketch

```rhoedsl
Artifact(
  id: "growth-review",
  title: "Growth Strategy Review",
  carrierArchetype: stageFrame,
  genre: executiveDecision,
  compositionGrammarRef: "executive/default"
) {
  FrontMatter {
  }
  MainMatter {
    FrameSection(title: "Decision") {
      FrameSet(id: "core", aspect: "16:9") {
        Frame(shellRole: comparisonOption, shell: "option-comparison") {
          Zone(header) {
            TextBlock(text: "Option B creates the strongest margin expansion with acceptable execution risk.")
          }
          Zone(main) {
            TableBlock(rows: tableRows)
          }
          Zone(aside) {
            TextBlock(text: "Assumptions: phased migration, pricing uplift, no phase-one headcount reduction.")
          }
        }
      }
    }
  }
  BackMatter {
  }
}
```

## 4. Non-stage Sketch

```rhoedsl
Artifact(
  id: "risk-register",
  title: "Risk Register",
  carrierArchetype: ledgerRegister,
  genre: ext.operationsRegister,
  compositionGrammarRef: "ledger/default"
) {
  FrontMatter {
    Dashboard(title: "Portfolio Health") {
      TextBlock(text: "Current portfolio health.")
    }
  }
  MainMatter {
    Collection(title: "Risks") {
      Schema(title: "risk.v1") {
      }
      Record(id: "risk-001") {
        TextBlock(text: "severity: high; owner: finance")
      }
    }
  }
  BackMatter {
    Constraint(title: "Severity Constraint") {
      TextBlock(text: "Severity must be one of low, medium, high.")
    }
  }
}
```

## 5. Canonical Node Spellings
- `Artifact`
- `FrontMatter`
- `MainMatter`
- `BackMatter`
- `Section`
- `Subsection`
- `SubSubsection`
- stage nodes such as `FrameSection`, `FrameSet`, `AppendixFrameSet`, `Frame`, `Zone`
- non-stage nodes such as `Codex`, `Stream`, `TableauDocument`, `Sheet`, `Collection`, `Box`, `Thread`

## 6. Compatibility Bridge

| Superseded spelling | `0.9.0` canonical spelling |
| --- | --- |
| `Document` | `Artifact` |
| `Deck` | `FrameSet` or other carrier-native structures |
| `Slide` | `Frame` |
| `shellGrammarRef` | `compositionGrammarRef` |

## 7. `rhoemd` and `rhoedsl` Equivalence
- `rhoemd` and `rhoedsl` are equal-status humane source surfaces of the same language.
- They must lower to the same canonical AST.
- One surface does not own semantics that the other cannot express.
- The shipped `rhoedsl` grammar explicitly covers all baseline carrier families; generic fallback remains for extension-owned nodes only.
