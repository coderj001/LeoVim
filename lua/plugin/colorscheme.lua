local M = {}

function M.setup()
    vim.g.astron_italic_comments = true
    vim.g.astron_italic_functions = true
    vim.g.astron_italic_variables = true
    vim.cmd[[colorscheme astron]]
end

return M
