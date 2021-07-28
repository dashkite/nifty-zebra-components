# import * as F from "@dashkite/joy/function"
import * as K from "@dashkite/katana"
import * as M from "@dashkite/joy/metaclass"
import * as C from "@dashkite/carbon"

import html from "../html"
import css from "./css"

import {
  Project
} from "#resources/project"

import json from "./form"
form = JSON.parse json

class extends C.Handle

  M.mixin @, [
    C.tag "studio-project-editor"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.describe [
        K.poke Project.get
        C.render (data) -> html {form, data}
        C.focus "input:not(:disabled)"
      ]
    ]
  ]
