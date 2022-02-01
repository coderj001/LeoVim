local M = {}

function M.setup()
  require("github-theme").setup({
  theme_style = "dark_default",
  function_style = "italic"
  })
end

return M
