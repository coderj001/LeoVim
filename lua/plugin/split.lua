local smartsplits = require("smart-splits")
local M = {}

function M.setup()
    smartsplits.setup({
        ignored_filetypes = {'nofile', 'quickfix', 'prompt'},
        ignored_buftypes = {'NvimTree'}
    })
    smartsplits.resize_up(1)
    smartsplits.resize_down(1)
    smartsplits.resize_left(3)
    smartsplits.resize_right(3)
end

return M
