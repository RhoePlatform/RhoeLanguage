#import "../../../reference-packs/rhoeTypstCore/rhoe-core.typ": *

#rhoe-artifact(
  id: "platform-guide",
  title: "Platform Guide",
  carrier: "scrollStream",
  genre: "ext.reviewStream",
  composition-grammar: "stream/default",
)[
  #rhoe-front-matter[
    #rhoe-support-matter[
      Overview and navigation map.
    ]
  ]
  #rhoe-main-matter[
    #rhoe-section(title: "Runtime", id: "runtime-segment")[
      #rhoe-stream[
        #rhoe-file-segment(path: "docs/intro.md")[
          Intro segment.
        ]
        #rhoe-file-segment(path: "docs/runtime.md", id: "runtime-target")[
          Runtime segment.
        ]
      ]
    ]
  ]
  #rhoe-back-matter[
    #rhoe-support-matter[
      #rhoe-ref(target: "runtime-target", mode: "full")
    ]
  ]
]
