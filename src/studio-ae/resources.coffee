Project =
  get: ->
    name: "hello"
    title: "Hello, World"
    drive: [
      [ "css", [ "index.styl" ] ]
      [ "src", [ "index.coffee" ] ]
      [ "html", [ "index.pug" ] ]
    ]

export { Project }
