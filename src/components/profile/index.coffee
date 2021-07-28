import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as K from "@dashkite/katana"
import * as M from "@dashkite/joy/metaclass"
import * as C from "@dashkite/carbon"

import html from "../html"
import css from "./css"

import {
  Creator
} from "#resources/creator"

import json from "./form"
form = JSON.parse json

class extends C.Handle

  M.mixin @, [
    C.tag "studio-profile"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.describe [
        K.push Creator.get
        K.poke Fn.binary Obj.merge
        K.poke (data) -> { form, data }
        K.poke html
        C.render Fn.identity
      ]
    ]
  ]
