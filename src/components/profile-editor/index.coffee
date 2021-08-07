import * as Fn from "@dashkite/joy/function"
import * as Obj from "@dashkite/joy/object"
import * as K from "@dashkite/katana"
import * as M from "@dashkite/joy/metaclass"
import * as C from "@dashkite/carbon"
import Registry from "@dashkite/helium"

import html from "./html"
import css from "./css"

import {
  Creator
} from "#resources/creator"

class extends C.Handle

  M.mixin @, [
    C.tag "studio-profile-editor"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.describe [
        K.push Creator.get
        K.poke Fn.binary Obj.merge
        C.render html
        C.focus "input:not(:disabled)"
      ]
      C.click "button[name='save']", [
        (el, event) ->
          # TODO actually save the changes, if any
          router = await Registry.get "router"
          # TODO get the creator name from the form
          router.browse
            name: "home"
            parameters:
              creator: "dan"
      ]
      C.click "button[name='cancel']", [
        -> history.back()
      ]
    ]
  ]
