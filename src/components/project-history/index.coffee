import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as K from "@dashkite/katana"
import * as M from "@dashkite/joy/metaclass"
import * as C from "@dashkite/carbon"
import Registry from "@dashkite/helium"

import html from "./html"
import css from "./css"

import {
  History
} from "#resources/history"

class extends C.Handle

  M.mixin @, [
    C.tag "studio-project-history"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.describe [
        K.push History.get
        K.poke Fn.binary Obj.merge
        C.render html
      ]
    ]
  ]
