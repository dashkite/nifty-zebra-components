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
      doc: handle.dom.textContent
      extensions: [
        basicSetup
        StreamLanguage.define coffeeScript
      ]
    parent: handle.root.querySelector ".editor"

export { editor }
