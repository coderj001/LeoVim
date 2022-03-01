local M = {}

function M.setup()
  vim.cmd[[ colorscheme xoria ]]
  require("colorbuddy").colorscheme("nvcode")
end

return M
