#import "../../../reference-packs/rhoeTypstCore/rhoe-core.typ": *

#rhoe-artifact(
  id: "growth-review",
  title: "Growth Strategy Review",
  carrier: "stageFrame",
  genre: "executiveDecision",
  composition-grammar: "executive/default",
)[
  #rhoe-front-matter[
    #rhoe-frameset(id: "opening")[
      #rhoe-frame(id: "opening-1", shell-role: "coverOpener")[
        #rhoe-zone(role: "main")[
          Growth Strategy Review
        ]
      ]
    ]
  ]
  #rhoe-main-matter[
    #rhoe-frame-section(title: "Decision")[
      #rhoe-frameset(id: "core")[
        #rhoe-frame(id: "decision-1", shell-role: "comparisonOption", shell: "option-comparison", continuation: "continued")[
          #rhoe-zone(role: "header")[
            Option B creates the strongest margin expansion with acceptable execution risk.
          ]
          #rhoe-zone(role: "main")[
            #rhoe-table[
              Option / Margin uplift / Risk
            ]
          ]
          #rhoe-zone(role: "aside")[
            Assumptions: phased migration, pricing uplift, no phase-one headcount reduction.
          ]
        ]
      ]
    ]
  ]
  #rhoe-back-matter[
    #rhoe-appendix-frameset(id: "appendix")[
      #rhoe-frame(id: "appendix-1", shell-role: "appendixSupport")[
        #rhoe-zone(role: "main")[
          Appendix evidence and references.
        ]
      ]
    ]
  ]
]
