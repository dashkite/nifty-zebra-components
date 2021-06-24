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
    tree: {}
    drive: {}
  for path, content of drive
    entry = { type: "file", path, name, content }
    set r.drive[path], entry
    [, keys..., name ] = path.split "/"
    set r.tree, keys, name, entry
  r

_drive =
  "/css/index.styl": ""
  "/src/index.coffee": ""
  "/html/index.html": ""

Project =
  get: ->
    {
      name: "hello"
      title: "Hello, World"
      sizes: [ 15, 85 ]
      (normalize _drive)...
    }

export { Project }
