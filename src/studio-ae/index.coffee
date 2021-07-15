import * as F from "@dashkite/joy/function"
import * as A from "@dashkite/joy/array"
import * as M from "@dashkite/joy/metaclass"
import * as O from "@dashkite/joy/object"
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

Path =
  directory: (path) -> It.join "/", (Te.split "/", path)[..-2]
  basename: (path) -> A.last Te.split "/", path
  extension: (path) -> (Te.split ".", (Path.basename path))[1]

initialize = K.peek (handle) -> handle.data = tabs: {}

decorate = (data) ->
  if data.selectedFile?
    {
      data...
      directory: Path.directory data.selected
      extension: Path.extension data.selected
    }
  else if data.selected?
    {
      data...
      directory: data.selected
    }
  else
    data

class extends C.Handle

  M.mixin @, [
    C.tag "studio-ae"
    C.diff
    C.initialize [
      initialize
      C.shadow
      C.sheets main: css
      C.observe "data", [
        K.poke decorate
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
      C.event "select", [
        C.matches "vellum-tabs", [
          Ks.push (event, handle) ->
            selected: event.detail
            selectedFile: event.detail
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
            if handle.data.selectedFile == el.dataset.path
              paths = O.keys handle.data.tabs
              for path, i in paths
                if path == el.dataset.path
                  handle.data.selectedFile = paths[ Math.abs i - 1 ]
                  break
            delete handle.data.tabs[el.dataset.path]
        ]
      ]
      C.click ".actions button", [
        Ks.peek (el, event, handle) ->
          router = await Registry.get "router"
          router.browse
            name: el.name
            parameters: {
              el.dataset...
              name: handle.data.name
              (decorate handle.data)...
            }
      ]
    ]
  ]
