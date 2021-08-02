import * as F from "@dashkite/joy/function"
import * as K from "@dashkite/katana"
import * as M from "@dashkite/joy/metaclass"
import * as C from "@dashkite/carbon"

import html from "./html"
import css from "./css"

import {
  Project
} from "#resources/project"

class extends C.Handle

  M.mixin @, [
    C.tag "studio-rename"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.describe [
        C.render html
        C.focus "input"
      ]
    ]
  ]
