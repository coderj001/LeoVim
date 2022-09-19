local M = {}
local smoothcursor = require('smoothcursor')

function M.setup()
  smoothcursor.setup {
    cursor = "",
    fancy = {
        enable = true,
        head = { cursor = "", texthl = "SmoothCursor", linehl = nil },
    },
  }
end

return M
