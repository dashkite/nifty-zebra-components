editor = (handle, content) ->


import _split from "split.js"

split = (handle) ->
  _split [
    handle.root.querySelector ".navigator"
    handle.root.querySelector ".editor"
  ],
  sizes: handle.preferences?.sizes ? [ 25, 75 ]
  gutterSize: 5
  minSize: [ 240, 720 ]
  onDragEnd: (sizes) ->
    handle.preferences ?= {}
    handle.preferences.sizes = sizes

export { editor, split }
