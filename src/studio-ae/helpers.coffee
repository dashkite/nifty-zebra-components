import * as A from "@dashkite/joy/array"
import * as O from "@dashkite/joy/object"
import * as Te from "@dashkite/joy/text"
import * as It from "@dashkite/joy/iterable"
import * as K from "@dashkite/katana"


initialize = K.peek (handle) -> handle.data = tabs: {}

removeTab = (handle, path) ->
  if handle.data.selected == path
    paths = O.keys handle.data.tabs
    for _path, i in paths
      if _path == path
        O.assign handle.data, Path.parseFile paths[ Math.abs i - 1 ]
        break
  delete handle.data.tabs[el.dataset.path]

Path =
  directory: (path) -> It.join "/", (Te.split "/", path)[..-2]
  basename: (path) -> A.last Te.split "/", path
  extension: (path) -> (Te.split ".", (Path.basename path))[1]
  parseFile: (path) ->
    selected: path
    tab: path
    isFile: true
    isDirectory: false
    directory: Path.directory path
    extension: Path.extension path
  parseDirectory: (path) ->
    selected: path
    isFile: false
    isDirectory: true
    directory: path
    extension: undefined

export {
  initialize
  removeTab
  Path
}
