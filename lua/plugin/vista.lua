local M = {}

function M.setup()
  vim.g.vista_disable_statusline = 1
  vim.g.vista_icon_indent = { "╰─▸ ", "├─▸ " }
  vim.g.vista_default_executive = "nvim_lsp"
end

return M
