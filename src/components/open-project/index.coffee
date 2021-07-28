# import * as F from "@dashkite/joy/function"
import * as K from "@dashkite/katana"
import * as M from "@dashkite/joy/metaclass"
import * as C from "@dashkite/carbon"

import html from "./html"
import css from "./css"

import {
  Projects
} from "#resources/projects"

class extends C.Handle

  M.mixin @, [
    C.tag "studio-open-project"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.describe [
        K.poke Projects.get
        C.render html
      ]
    ]
  ]
