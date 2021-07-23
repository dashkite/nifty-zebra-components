import json from "../fixtures/projects"
projects = JSON.parse json

Projects =
  get: -> { projects }

export { Projects }
