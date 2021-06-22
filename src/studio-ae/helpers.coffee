editor = (handle, content) ->
  

import split from "split.js"

resize = (handle) ->
  split [
    handle.root.querySelector ".navigator"
    handle.root.querySelector ".editor"
  ],
  sizes: [ 25, 75 ]
  gutterSize: 5
  minSize: [ 240, 720 ]
  onDragEnd: ->
    # TODO do something to remember the setting


export { editor, resize }
