import * as _F from "@dashkite/joy/function"
import * as _M from "@dashkite/joy/metaclass"
import * as _O from "@dashkite/joy/object"
import * as _T from "@dashkite/joy/type"

_ = { _F..., _O..., _M..., _T... }

import * as k from "@dashkite/katana"
import * as ks from "@dashkite/katana/sync"
import * as c from "@dashkite/carbon"

import html from "./html"
import css from "./css"

import {
  Project
} from "./resources"

import {
  editor
  resize
} from "./helpers"

class extends c.Handle

  _.mixin @, [
    c.tag "studio-ae"
    c.diff
    c.initialize [
      c.shadow
      c.sheets main: css
      c.activate [
        c.description
        k.push Project.get
        k.mpoke (project, description) -> { project, description }
        c.render html
        k.read "handle"
        # k.peek editor
        k.peek resize
      ]
      c.event "click", [
        c.within ".file, .folder", [
          ks.peek (el, event, handle) ->
            elx = handle.root.querySelectorAll ".directory .selected"
            for _el in elx when _el != el
              _el.classList.remove "selected"
            selected = el.classList.toggle "selected"
            elx = handle.root.querySelectorAll "button.if-selection"
            for _el in elx
              _el.disabled = !selected
            if selected
              editor handle, ""
        ]
      ]
    ]
  ]
