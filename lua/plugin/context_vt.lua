local nvim_context_vt = require("nvim_context_vt")
local M = {}

function M.setup()
    nvim_context_vt.setup({
        enable = true,
        prefix = "   ",
        disable_ft = {'markdown'},
        default_virtual_lines_ft = {'yaml', 'json'},
        disable_virtual_lines = false
    })
end

return M
