local M = {}

function _G.move_or_open()
	if #vim.api.nvim_list_wins() == 1 then
		vim.cmd("vnew | wincmd h | vert resize 30 | wincmd l")
	else
		vim.cmd("wincmd l")
	end
end

function M.config()
	lvim.builtin.nvimtree = {
		active = true,
		on_config_done = nil,
		side = "left",
		width = 30,
		show_icons = {
			git = 1,
			folders = 1,
			files = 1,
			folder_arrows = 1,
			tree_width = 30,
		},
		ignore = { ".git", "node_modules", ".cache" },
		auto_open = 0,
		auto_close = 1,
		quit_on_open = 0,
		follow = 1,
		hide_dotfiles = 1,
		git_hl = 1,
		root_folder_modifier = ":t",
		tab_open = 0,
		allow_resize = 1,
		lsp_diagnostics = 1,
		auto_ignore_ft = { "startify", "dashboard" },
		icons = {
			default = "",
			symlink = "",
			git = {
				unstaged = "",
				staged = "S",
				unmerged = "",
				renamed = "➜",
				deleted = "",
				untracked = "U",
				ignored = "◌",
			},
			folder = {
				default = "",
				open = "",
				empty = "",
				empty_open = "",
				symlink = "",
			},
		},
	}
end

function M.setup()
	vim.g.nvim_tree_ignore = { ".git", "node_modules", "dist" }
	vim.g.nvim_tree_disable_netrw = 0
	vim.g.nvim_tree_indent_markers = 1
	vim.g.nvim_tree_hijack_netrw = 1
	vim.g.nvim_tree_follow = 1
	vim.g.nvim_tree_tab_open = 1
	vim.g.nvim_tree_auto_ignore_ft = { "startify", "dashboard" }
	vim.g.nvim_tree_show_icons = {
		git = 1,
		folders = 1,
		files = 1,
	}
	vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
end

return M