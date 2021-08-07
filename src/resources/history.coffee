import * as It from "@dashkite/joy/iterable"
import history from "../fixtures/history"

format = (item) ->
  result: item.result
  when: new Date item.when
          .toLocaleDateString [],
            hourCycle: "h12"
            hour: "numeric"
            minute: "numeric"
            weekday: "short"
            month: "short"
            day: "numeric"
            year: "numeric"
History =
  get: ->
    status: history.status
    history: It.collect It.map format, history.history

export { History }
