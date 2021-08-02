import * as F from "@dashkite/joy/function"
import * as K from "@dashkite/katana"
import * as M from "@dashkite/joy/metaclass"
import * as C from "@dashkite/carbon"
import Registry from "@dashkite/helium"

import html from "./html"
import css from "./css"

import {
  Project
} from "#resources/project"

class extends C.Handle

  M.mixin @, [
    C.tag "studio-link"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.describe [
        K.read "handle"
        K.mpoke (handle, data) ->
          router = await Registry.get "router"
          name = handle.dom.getAttribute "name"
          link: router.link name: name, parameters: data
        C.render html
        C.focus "input"
      ]
    ]
  ]
