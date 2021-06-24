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
  split
} from "./helpers"


class extends c.Handle

  _.mixin @, [
    c.tag "studio-ae"
    c.diff
    c.initialize [
      k.peek (handle) ->
        handle.data = tabs: {}
      c.shadow
      c.sheets main: css
      c.observe "data", [
        k.peek (data) -> console.log data
        c.render html
        k.read "handle"
      ]
      c.activate [
        k.push Project.get
        c.assign "data"
      ]
      c.event "click", [
        c.within ".folder, .file", [
          ks.peek (el, event, handle) ->
            if (entry = handle.data.files[el.dataset.path])?
              handle.data.tabs[ el.dataset.path ] = entry
          ks.push (el, event, handle) ->
            selected: el.dataset.path if handle.data.selected != el.dataset.path
          c.assign "data"
        ]

      ]
    ]
  ]
