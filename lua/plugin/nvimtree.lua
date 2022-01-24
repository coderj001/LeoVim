local M = {}

function M.setup()
	vim.g.tree_ignore = { ".git", "node_modules", "dist" }
	vim.g.disable_netrw = 0
	vim.g.nvim_tree_indent_markers = 1
	vim.g.hijack_netrw = 1
	vim.g.follow = 1
	vim.g.tab_open = 1
	vim.g.nvim_tree_auto_ignore_ft = { "startify", "dashboard" }
	vim.g.nvim_tree_show_icons = {
		git = 1,
		folders = 1,
		files = 1,
	}
	vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
end

return M
