import json from "../fixtures/creator"
creator = JSON.parse json

Creator =
  get: -> creator

export { Creator }
