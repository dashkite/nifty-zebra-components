import assert from "@dashkite/assert"
import { test } from "@dashkite/amen"

import "@dashkite/studio-components"

do ->

  window.__test = await do ->

    test "In-Browser Tests", []
