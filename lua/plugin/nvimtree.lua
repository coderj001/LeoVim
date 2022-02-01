local M = {}

function M.setup()
  local g = vim.g

	g.tree_ignore = { ".git", "node_modules", "dist", ".venv"}
	g.disable_netrw = 0
	g.nvim_tree_indent_markers = 1
	g.hijack_netrw = 1
	g.follow = 1
	g.tab_open = 1
	g.nvim_tree_auto_ignore_ft = { "startify", "dashboard" }
	g.nvim_tree_show_icons = {
		git = 1,
		folders = 1,
		files = 1,
	}
  g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
  g.nvim_tree_git_hl = 1
  g.nvim_tree_highlight_opened_files = 0
  g.nvim_tree_indent_markers = 1
  g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
  g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

  g.nvim_tree_window_picker_exclude = {
     filetype = { "notify", "packer", "qf" },
     buftype = { "terminal" },
  }

  g.nvim_tree_show_icons = {
     folders = 1,
     files = 1,
     git = 1,
  }

  g.nvim_tree_icons = {
     default = "",
     symlink = "",
     git = {
        deleted = "",
        ignored = "◌",
        renamed = "➜",
        staged = "✓",
        unmerged = "",
        unstaged = "✗",
        untracked = "★",
     },
     folder = {
        default = "",
        empty = "()",
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = "",
     },
  }
	vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
end

return M
