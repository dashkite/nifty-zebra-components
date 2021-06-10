import * as _F from "@dashkite/joy/function"
import * as _M from "@dashkite/joy/metaclass"
import * as _O from "@dashkite/joy/object"

_ = { _F..., _O..., _M... }

import * as k from "@dashkite/katana"
import * as c from "@dashkite/carbon"

import { Project } from "./resources"
import html from "./html"
import css from "./css"

import {
  EditorState
  EditorView
  basicSetup
} from "@codemirror/basic-setup"

# import { javascript } from "@codemirror/lang-javascript"
import { StreamLanguage } from "@codemirror/stream-parser"
import { coffeeScript } from "@codemirror/legacy-modes/mode/coffeescript"

editor = (handle) ->
  console.log handle.root.querySelector ".editor"
  view = new EditorView
    root: handle.shadow
    state: EditorState.create
      extensions: [
        basicSetup
        StreamLanguage.define coffeeScript
      ]
    parent: handle.root.querySelector ".editor"


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
        k.push _.merge
        c.render html
        k.read "handle"
        k.peek editor
      ]
    ]
  ]
