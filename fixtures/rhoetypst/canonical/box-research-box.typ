#import "../../../reference-packs/rhoeTypstCore/rhoe-core.typ": *

#rhoe-artifact(
  id: "research-box",
  title: "Research Box",
  carrier: "box",
  genre: "ext.researchBox",
  composition-grammar: "box/default",
)[
  #rhoe-front-matter[
    #rhoe-tag-catalog[
      Theme, source, and confidence tags.
    ]
  ]
  #rhoe-main-matter[
    #rhoe-section(title: "Collected Fragments")[
      #rhoe-box(title: "Collected Fragments")[
        #rhoe-fragment(id: "frag-001")[
          Primary source fragment.
        ]
      ]
    ]
  ]
  #rhoe-back-matter[
    #rhoe-saved-view(title: "Curated View")[
      #rhoe-ref(target: "frag-001", mode: "full")
    ]
  ]
]
