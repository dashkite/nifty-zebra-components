import {
  EditorState
  EditorView
  basicSetup
} from "@codemirror/basic-setup"

# import { javascript } from "@codemirror/lang-javascript"
import { StreamLanguage } from "@codemirror/stream-parser"
import { coffeeScript } from "@codemirror/legacy-modes/mode/coffeescript"

# TODO how to detect if we've already installed the editor?
editor = (handle) ->
  view = new EditorView
    root: handle.shadow
    state: EditorState.create
      extensions: [
        basicSetup
        StreamLanguage.define coffeeScript
      ]
    parent: handle.root.querySelector ".editor"

import split from "split.js"

resize = (handle) ->
  split [
    handle.root.querySelector ".navigator"
    handle.root.querySelector ".editor"
  ],
  sizes: [ 25, 75 ]
  gutterSize: 5
  minSize: [ 240, 720 ]


export { editor, resize }
