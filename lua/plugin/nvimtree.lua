local M = {}

function M.setup()
    require("nvim-tree").setup {
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        ignore_ft_on_setup = {},
        open_on_tab = false,
        hijack_cursor = false,
        update_cwd = false,
        diagnostics = {
            enable = false,
            icons = {hint = "", info = "", warning = "", error = ""}
        },
        update_focused_file = {
            enable = false,
            update_cwd = false,
            ignore_list = {}
        },
        system_open = {cmd = nil, args = {}},
        filters = {dotfiles = true, custom = {}},
        git = {enable = true, ignore = true, timeout = 500},
        view = {
            width = 30,
            height = 30,
            hide_root_folder = false,
            side = 'left',
            mappings = {custom_only = false, list = {}},
            number = false,
            relativenumber = false,
            signcolumn = "yes"
        },
        trash = {cmd = "trash", require_confirm = true}
    }

    local g = vim.g

    g.tree_ignore = {".git/", "node_modules/", "dist/", ".venv/"}
    g.disable_netrw = 0
    g.hijack_netrw = 1
    g.follow = 1
    g.tab_open = 1
    g.nvim_tree_auto_ignore_ft = {"startify", "dashboard"}
    g.renderer.icons.show = {git = 1, folder = 1, file = 1}
    g.nvim_tree_add_trailing = 0
    g.nvim_tree_git_hl = 1
    g.renderer.highlight_opened_files = 0
    g.renderer.indent_markers.enable = 1
    g.renderer.root_folder_modifier = table.concat {
        ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??"
    }

    g.renderer.icons.show = {folders = 1, files = 1, git = 1}

    g.renderer.icons.glyphs = {
        default = "",
        symlink = "",
        git = {
            deleted = "",
            ignored = "◌",
            renamed = "➜",
            staged = "✓",
            unmerged = "",
            unstaged = "✗",
            untracked = "★"
        },
        folder = {
            default = "",
            empty = "()",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = ""
        }
    }
end

return M
