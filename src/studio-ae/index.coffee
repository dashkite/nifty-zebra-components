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

contains =  (selector) ->
  (event) ->
    event.composedPath().find (el) -> el.matches? selector

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
        k.peek editor
        k.peek resize
      ]
      c.event "click", [
        ks.write "event"
        ks.push contains ".file, .folder"
        ks.test _.isDefined, _.pipe [
          ks.read "event"
          # c.intercept
          ks.discard
          ks.read "handle"
          ks.peek (handle) ->
            handle.root.querySelector ".navigator"
              .classList.add "selected"
            for el in handle.root.querySelectorAll ".navigator .selected"
              el.classList.remove "selected"
          ks.discard
          ks.peek (el) ->
            console.log el
            el.classList.add "selected"
        ]
      ]
    ]
  ]
