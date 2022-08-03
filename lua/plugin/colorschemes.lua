local colorbuddy = require("colorbuddy")
local M = {}

function M.setup()
    vim.cmd [[ colorscheme dracula ]]
    -- vim.cmd[[ colorscheme tokyonight ]]
    -- colorbuddy.colorscheme('onedarkpro')
    colorbuddy.setup()
end

return M
