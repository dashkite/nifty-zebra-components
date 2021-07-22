import * as F from "@dashkite/joy/function"
import * as K from "@dashkite/katana"

defaultPath = (description) ->
  path = ""
  if description.directory?
    path += "#{description.directory}/"
  path += "untitled"
  if description.extension?
    path += ".#{description.extension}"
  { path, description... }

export {
  defaultPath
}
