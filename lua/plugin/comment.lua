local M = {}

function M.setup()
  require("Comment").setup({
    sticky = false,
    opleader = {
      line = 'gc',
      block = 'gb',
    },
    toggler = {
      line = 'gcc',
      block = 'gbc',
    },
  })
end

return M
