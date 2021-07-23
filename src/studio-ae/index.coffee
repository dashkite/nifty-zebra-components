import * as F from "@dashkite/joy/function"
import * as A from "@dashkite/joy/array"
import * as O from "@dashkite/joy/object"
import * as M from "@dashkite/joy/metaclass"
import * as T from "@dashkite/joy/type"
import * as Te from "@dashkite/joy/text"
import * as It from "@dashkite/joy/iterable"

import * as K from "@dashkite/katana"
import * as Ks from "@dashkite/katana/sync"
import * as C from "@dashkite/carbon"

import Registry from "@dashkite/helium"

import html from "./html"
import css from "./css"

import {
  Project
} from "#resources/project"

import {
  initialize
  removeTab
  Path
} from "./helpers"


class extends C.Handle

  M.mixin @, [
    C.tag "studio-ae"
    C.diff
    C.initialize [
      initialize
      C.shadow
      C.sheets main: css
      C.observe "data", [
        C.render html
        K.read "handle"
      ]
      C.describe [
        K.push Project.get
        K.poke F.binary O.merge
        C.assign "data"
      ]
      C.event "click", [
        C.within ".folder", [
          Ks.push (el, event, handle) -> Path.parseDirectory el.dataset.path
          C.assign "data"
        ]
      ]
      C.event "click", [
        C.within ".file", [
          Ks.peek (el, event, handle) ->
            handle.data.tabs[ el.dataset.path ] =
              handle.data.files[ el.dataset.path ]
          Ks.push (el, event, handle) -> Path.parseFile el.dataset.path
          C.assign "data"
        ]
      ]
      C.event "select", [
        C.matches "vellum-tabs", [
          Ks.push (event, handle) -> Path.parseFile event.detail
          C.assign "data"
        ]
      ]
      C.event "change", [
        C.matches "vellum-split", [
          Ks.peek (event) ->
            # TODO save event detail (sizes) to project
        ]
      ]
      C.capture "click", [
        C.within "button[name^='close-']", [
          C.intercept
          Ks.peek (el, event, handle) ->
            removeTab handle, el.dataset.path
        ]
      ]
      C.click ".actions button", [
        Ks.peek (el, event, handle) ->
          router = await Registry.get "router"
          console.log handle.data
          router.browse
            name: el.name
            parameters: {
              (handle.data)...
              el.dataset...
            }
      ]
    ]
  ]
