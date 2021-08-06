languages =
  html: "html"
  css: "css"
  js: "javascript"
  pug: "pug"
  coffee: "coffeescript"
  styl: "stylus"

extension = (name) ->
  (name.split ".")[1]

set = (root, keys, name, value) ->
  current = root
  path = ""
  for key in keys
    path += "/#{key}"
    current[key] ?= type: "directory", path: path, name: key, content: {}
    current = current[key].content
  current[name] = value

normalize = (drive) ->
  r =
    files: {}
    drive: {}
  for path, content of drive
    [, keys..., name ] = path.split "/"
    language = languages[ extension name ]
    entry = { type: "file", path, name, content, language }
    r.files[path] = entry
    set r.drive, keys, name, entry
  r

import project from "../fixtures/project"

Project =
  get: ->
    {
      project...
      (normalize project.files)...
    }

export { Project }
