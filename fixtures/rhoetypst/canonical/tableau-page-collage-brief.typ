#import "../../../reference-packs/rhoeTypstCore/rhoe-core.typ": *

#rhoe-artifact(
  id: "campaign-brief",
  title: "Campaign Brief",
  carrier: "tableauPageCollage",
  genre: "ext.tableauBrief",
  composition-grammar: "tableau/default",
)[
  #rhoe-front-matter[
    #rhoe-page-family(title: "Cover Family")[
      #rhoe-tableau-page(title: "Cover")[
        #rhoe-hero-region[
          Campaign brief opener.
        ]
      ]
    ]
  ]
  #rhoe-main-matter[
    #rhoe-section(title: "Analysis")[
      #rhoe-page-family(title: "Core Pages")[
        #rhoe-tableau-page(title: "Analysis", id: "analysis-page")[
          #rhoe-region-group[
            #rhoe-support-region[
              Supporting findings.
            ]
          ]
        ]
      ]
    ]
  ]
  #rhoe-back-matter[
    #rhoe-page-family(title: "Closing Family")[
      #rhoe-tableau-page(title: "Credits")[
        #rhoe-support-region[
          #rhoe-ref(target: "analysis-page", mode: "full")
        ]
      ]
    ]
  ]
]
