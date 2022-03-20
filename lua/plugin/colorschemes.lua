local colorbuddy = require("colorbuddy")
local M = {}

function M.setup()
  vim.cmd[[ colorscheme onedarkpro ]]
  -- colorbuddy.colorscheme('onedarkpro')
  colorbuddy.setup()
end

return M
