set = (root, keys, name, value) ->
  current = root
  path = ""
  for key in keys
    path += "/#{key}"
    current[key] ?= type: "directory", path: path, name: key, content: {}
    current = current[key].content
  current[name] = value

normalize = (drive) ->
  r = {}
  for path, content of drive
    [, keys..., name ] = path.split "/"
    set r, keys, name, {type: "file", path, name, content}
  r

Project =
  get: ->
    name: "hello"
    title: "Hello, World"
    drive: normalize
      "/css/index.styl": ""
      "/src/index.coffee": ""
      "/html/index.html": ""

export { Project }
