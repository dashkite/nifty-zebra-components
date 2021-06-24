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
    entry = { type: "file", path, name, content }
    r.files[path] = entry
    set r.drive, keys, name, entry
  r

_drive =
  "/css/index.styl": "// this is stylus code"
  "/src/index.coffee": "# this is coffeescript code"
  "/html/index.pug": "//- this is pug code"

Project =
  get: ->
    {
      name: "hello"
      title: "Hello, World"
      sizes: [ 15, 85 ]
      (normalize _drive)...
    }

export { Project }
