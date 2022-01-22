local M = {}

function M.setup()
  require("close_buffers").setup({
    preserve_window_layout = { 'hidden' }
  })
end

return M
