local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = true,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = false,
    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    filters = {
      dotfiles = true,
      custom = {}
    },
    git = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view = {
      width = 30,
      height = 30,
      hide_root_folder = false,
      side = 'left',
      auto_resize = false,
      mappings = {
        custom_only = false,
        list = {}
      },
      number = false,
      relativenumber = false,
      signcolumn = "yes"
    },
    trash = {
      cmd = "trash",
      require_confirm = true
    }
  }
    
  local g = vim.g

	g.tree_ignore = { ".git/", "node_modules/", "dist/", ".venv/"}
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
end

return M
