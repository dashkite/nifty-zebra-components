import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as K from "@dashkite/katana"
import * as Meta from "@dashkite/joy/metaclass"
import * as C from "@dashkite/carbon"

import html from "./html"
import css from "./css"

import {
  Creator
} from "#resources/creator"

class extends C.Handle

  Meta.mixin @, [
    C.tag "studio-home"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.describe [
        K.push Creator.get
        K.poke Fn.binary Obj.merge
        C.render html
      ]
    ]
  ]
