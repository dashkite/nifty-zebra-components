import * as F from "@dashkite/joy/function"
import * as K from "@dashkite/katana"
import * as M from "@dashkite/joy/metaclass"
import * as C from "@dashkite/carbon"

import html from "./html"
import css from "./css"

import {
  Project
} from "#resources/project"

import {
  defaultPath
} from "../add-file/helpers"

class extends C.Handle

  M.mixin @, [
    C.tag "studio-add-folder"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.describe [
        K.poke defaultPath
        C.render html
        C.focus "input"
      ]
    ]
  ]
