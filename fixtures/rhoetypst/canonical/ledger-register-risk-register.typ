#import "../../../reference-packs/rhoeTypstCore/rhoe-core.typ": *

#rhoe-artifact(
  id: "risk-register",
  title: "Risk Register",
  carrier: "ledgerRegister",
  genre: "ext.operationsRegister",
  composition-grammar: "ledger/default",
)[
  #rhoe-front-matter[
    #rhoe-dashboard[
      Current portfolio health.
    ]
  ]
  #rhoe-main-matter[
    #rhoe-section(title: "Risks")[
      #rhoe-collection(name: "risks")[
        #rhoe-schema(ref: "risk.v1")[
          Risk schema.
        ]
        #rhoe-record(id: "risk-001")[
          severity: high
          owner: finance
        ]
      ]
    ]
  ]
  #rhoe-back-matter[
    #rhoe-constraint[
      #rhoe-ref(target: "risk-001", mode: "full")
    ]
  ]
]
