#let rhoe-artifact(id: none, title: "", carrier: "", genre: "", composition-grammar: "", body) = [#body]
#let rhoe-front-matter(body) = [#body]
#let rhoe-main-matter(body) = [#body]
#let rhoe-back-matter(body) = [#body]
#let rhoe-frameset(id: none, body) = [#body]
#let rhoe-frame(id: none, shell-role: none, continuation: none, body) = [#body]
#let rhoe-appendix-frameset(id: none, body) = [#body]
#let rhoe-zone(role: "main", body) = [#body]

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
    #rhoe-frameset(id: "core")[
      #rhoe-frame(id: "decision-1", shell-role: "comparisonOption", continuation: "continued")[
        #rhoe-zone(role: "main")[
          Option comparison content.
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
