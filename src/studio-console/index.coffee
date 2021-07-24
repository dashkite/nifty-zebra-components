import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as K from "@dashkite/katana"
import * as Meta from "@dashkite/joy/metaclass"
import * as C from "@dashkite/carbon"
import Registry from "@dashkite/helium"

import html from "./html"
import css from "./css"

import {
  Creator
} from "#resources/creator"

import json from "./form"
form = JSON.parse json

class extends C.Handle

  Meta.mixin @, [
    C.tag "studio-console"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.describe [
        K.poke Creator.get
        C.description
        K.poke Fn.binary Obj.merge
        C.render (data) -> html {form, data}
      ]
    ]
  ]
