local M = {}

function M.setup()
  vim.g.bufferline = {
    maximum_length = 25,
    insert_at_end = true,
    insert_at_start = true,
    clickable = false,
    closable = false,
  }
end

return M
