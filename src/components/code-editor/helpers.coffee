import {
  EditorState
  EditorView
  basicSetup
} from "@codemirror/basic-setup"

import { javascript } from "@codemirror/lang-javascript"
import { css } from "@codemirror/lang-css"
import { html } from "@codemirror/lang-html"
import { json } from "@codemirror/lang-json"
import { markdown } from "@codemirror/lang-markdown"
import { StreamLanguage } from "@codemirror/stream-parser"
import {
  coffeeScript as coffeescript
} from "@codemirror/legacy-modes/mode/coffeescript"
import { stylus } from "@codemirror/legacy-modes/mode/stylus"
import { yaml } from "@codemirror/legacy-modes/mode/yaml"

# there's no current or legacy mode for pug :/

languages = {
  html
  css
  javascript
  json
  stylus
  coffeescript
  yaml
}

# TODO how to detect if we've already installed the editor?
editor = (handle) ->
  view = new EditorView
    root: handle.shadow
    state: EditorState.create
      doc: handle.dom.textContent
      extensions: do ->
        handler = languages[ handle.dom.dataset.language ]
        if handler?
          [ basicSetup, StreamLanguage.define handler ]
        else
          [ basicSetup ]
    parent: handle.root.querySelector ".editor"

export { editor }
