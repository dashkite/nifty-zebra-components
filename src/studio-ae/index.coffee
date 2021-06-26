import * as F from "@dashkite/joy/function"
import * as A from "@dashkite/joy/array"
import * as M from "@dashkite/joy/metaclass"
import * as O from "@dashkite/joy/object"
import * as T from "@dashkite/joy/type"

import * as K from "@dashkite/katana"
import * as Ks from "@dashkite/katana/sync"
import * as C from "@dashkite/carbon"

import html from "./html"
import css from "./css"

import {
  Project
} from "./resources"

contains = (selector, fx) ->
  F.pipe [
    Ks.push (event) -> event.composedPath().find (el) -> el.matches? selector
    Ks.test T.isDefined, F.pipe fx
  ]

matches = (selector, fx) ->
  Ks.test ((el) -> el.matches selector), F.pipe fx

class extends C.Handle

  M.mixin @, [
    C.tag "studio-ae"
    C.diff
    C.initialize [
      K.peek (handle) -> handle.data = tabs: {}
      C.shadow
      C.sheets main: css
      C.observe "data", [
        C.render html
        K.read "handle"
      ]
      C.activate [
        K.push Project.get
        C.assign "data"
      ]
      C.event "click", [
        C.within ".folder, .file", [
          Ks.peek (el, event, handle) ->
            if (entry = handle.data.files[el.dataset.path])?
              handle.data.tabs[ el.dataset.path ] = entry
          Ks.push (el, event, handle) ->
            selected: el.dataset.path if handle.data.selected != el.dataset.path
            selectedFile: if handle.data.files[ el.dataset.path ]?
              el.dataset.path
            else
              handle.data.selectedFile
          C.assign "data"
        ]
      ]
    C.event "click", [
      contains "button[name^='close-']", [
        Ks.peek (el, event, handle) ->
          delete handle.data.tabs[el.dataset.path]
      ]
    ]
    ]
  ]
