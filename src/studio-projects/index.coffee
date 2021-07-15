import * as F from "@dashkite/joy/function"
import * as K from "@dashkite/katana"
import * as M from "@dashkite/joy/metaclass"
import * as C from "@dashkite/carbon"

import html from "./html"
import css from "./css"

focus = (selector) ->
  F.flow [
    K.read "handle"
    K.peek (handle) -> (handle.root.querySelector selector)?.focus()
  ]

import {
  Project
} from "#resources/project"

class extends C.Handle

  M.mixin @, [
    C.tag "studio-projects"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.activate [
        C.render html
        focus "input"
      ]
    ]
  ]
