#import "../../../reference-packs/rhoeTypstCore/rhoe-core.typ": *

#rhoe-artifact(
  id: "design-review-thread",
  title: "Design Review Thread",
  carrier: "conversationThread",
  genre: "ext.designReviewThread",
  composition-grammar: "conversation/default",
)[
  #rhoe-front-matter[
    #rhoe-participant-profile(id: "alex")[
      Product lead
    ]
  ]
  #rhoe-main-matter[
    #rhoe-section(title: "API Review")[
      #rhoe-thread[
        #rhoe-episode(title: "API review")[
          #rhoe-turn(speaker: "alex", id: "turn-001")[
            We should keep the carrier registry closed in core.
          ]
        ]
      ]
    ]
  ]
  #rhoe-back-matter[
    #rhoe-outcome[
      #rhoe-ref(target: "turn-001", mode: "full")
    ]
  ]
]
