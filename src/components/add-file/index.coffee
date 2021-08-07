import * as F from "@dashkite/joy/function"
import * as K from "@dashkite/katana"
import * as M from "@dashkite/joy/metaclass"
import * as C from "@dashkite/carbon"
import Registry from "@dashkite/helium"

import {
  Project
} from "#resources/project"

import html from "./html"
import css from "./css"

import {
  defaultPath
} from "./helpers"

class extends C.Handle

  M.mixin @, [
    C.tag "studio-add-file"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.describe [
        K.poke defaultPath
        C.render html
        C.focus "input"
      ]
      C.click "button", [
        (el, event) ->
          # TODO actually save the changes, if any
          router = await Registry.get "router"
          # TODO get the creator name from the form
          router.browse
            name: "workspace"
            parameters:
              creator: "dan"
              project: "hello"
      ]
      C.click "a[name='cancel']", [
        -> history.back()
      ]
    ]
  ]
