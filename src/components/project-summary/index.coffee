# import * as F from "@dashkite/joy/function"
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
    C.tag "studio-project-summary"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.describe [
        K.poke Project.get
        C.description
        K.pop (description, data) ->
          router = await Registry.get "router"
          data.links = 
            workspace: router.link
              name: "workspace"
              parameters: description
            editor: router.link
              name: "project editor"
              parameters: description
        C.render html
      ]
    ]
  ]
