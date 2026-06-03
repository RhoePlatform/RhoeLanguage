#import "../../../reference-packs/rhoeTypstCore/rhoe-core.typ": *

#rhoe-artifact(
  id: "planning-sheet",
  title: "Planning Sheet",
  carrier: "sheetField",
  genre: "ext.sheetWorkspace",
  composition-grammar: "sheet/default",
)[
  #rhoe-front-matter[
    #rhoe-top-band(title: "Header Band")[
      Working assumptions and owner notes.
    ]
  ]
  #rhoe-main-matter[
    #rhoe-section(title: "Current Plan")[
      #rhoe-sheet(title: "Current Plan")[
        #rhoe-region(title: "Main Workspace", id: "worksheet-main")[
          Primary worksheet region.
        ]
      ]
    ]
  ]
  #rhoe-back-matter[
    #rhoe-bottom-band(title: "Footer Band")[
      #rhoe-ref(target: "worksheet-main", mode: "full")
    ]
  ]
]
