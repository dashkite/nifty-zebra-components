import * as F from "@dashkite/joy/function"
import * as M from "@dashkite/joy/metaclass"
import * as O from "@dashkite/joy/object"
import * as T from "@dashkite/joy/type"
import * as K from "@dashkite/katana"
import * as Ks from "@dashkite/katana/sync"
import * as C from "@dashkite/carbon"

import html from "./html"
import css from "./css"

import { editor } from "./helpers"

class extends C.Handle

  M.mixin @, [
    C.tag "studio-code-editor"
    C.diff
    C.initialize [
      C.shadow
      C.sheets main: css
      C.activate [
        C.render html
        K.read "handle"
        K.peek editor
      ]

    ]
  ]
