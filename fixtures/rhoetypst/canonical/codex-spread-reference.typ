#import "../../../reference-packs/rhoeTypstCore/rhoe-core.typ": *

#rhoe-artifact(
  id: "field-guide",
  title: "Field Guide",
  carrier: "codexSpread",
  genre: "ext.referenceCodex",
  composition-grammar: "codex/default",
)[
  #rhoe-front-matter[
    #rhoe-codex(title: "Prelims")[
      Preface and edition statement.
    ]
  ]
  #rhoe-main-matter[
    #rhoe-section(title: "Overview", id: "overview")[
      #rhoe-chapter(title: "Overview")[
        #rhoe-spread(title: "Core Spread", id: "core-spread")[
          Core chapter body.
        ]
      ]
    ]
  ]
  #rhoe-back-matter[
    #rhoe-reference-apparatus[
      #rhoe-ref(target: "core-spread", mode: "full")
    ]
  ]
]
