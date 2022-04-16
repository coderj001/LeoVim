local M = {}

function M.setup()
  require("notify").setup({
    stages = "slide",
    render = "minimal",
    timeout = 1500,
    max_width = 30,
    max_height = 20,
    background_colour = "Normal",
    minimum_width = 26,
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  })
  vim.notify = require("notify")
end

return M
