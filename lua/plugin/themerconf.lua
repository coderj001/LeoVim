local M = {}
local themer = require("themer")

function M.setup()
  themer.setup({
    colorscheme = "rose_pine",
    transparent = false,
    term_colors = true,
    dim_inactive = false,
    disable_telescope_themes = {},
    styles = {
      heading = {
        h1 = {},
        h2 = {},
      },
      ["function"] = {},
      functionBuiltIn = {},
      variable = {},
      variableBuiltIn = {},
      include = {},
      identifier = {},
      keyword = {},
      keywordBuiltIn = {},
      struct = {},
      string = {},
      parameter = {},
      field = {},
      type = {},
      typeBuiltIn = {},
      property = {},
      comment = {},
      punctuation = {},
      constructor = {},
      operator = {},
      constant = {},
      constantBuiltIn = {},
      todo = {},
      character = {},
      conditional = {},
      number = {},
      statement = {},
      uri = {},
      diagnostic = {
        underline = {
          error = {},
          warn = {},
          info = {},
          hint = {},
        },
        virtual_text = {
          error = {},
          warn = {},
          info = {},
          hint = {},
        },
      },
    },
    remaps = {
      palette = {},
      highlights = {},
    },
    langs = {
      html = true,
      md = true,
    },
    plugins = {
      treesitter = true,
      indentline = true,
      barbar = true,
      bufferline = true,
      cmp = true,
      gitsigns = true,
      lsp = true,
      telescope = true,
    },
    enable_installer = false,
  })
end

return M
