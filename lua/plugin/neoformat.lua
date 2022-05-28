local M = {}

function M.setup()
  local g = vim.g

  g.neoformat_basic_format_align = true
  g.neoformat_verbose = true
  g.neoformat_basic_format_trim = true
end

return M
