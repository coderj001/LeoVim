local M = {}

function M.setup()
  require("github-theme").setup({
  theme_style = "dark_default",
  function_style = "italic",
  dark_float=true,
  sidebars = {
      "dashboard",
      "help",
      "terminal",
      "packer",
      "lsp-installer",
      "lsp_signature",
      "lspinfo",
      "vista_kind",
  },
    colors = {
      bg_search = '#dae84d',
      fg_search = '#000000',
    }
  })
end

return M
