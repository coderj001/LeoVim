local status_ok, telescope = pcall(require, "telescope")
local trouble = require("trouble")
local fb_actions = require"telescope".extensions.file_browser.actions

if not status_ok then return end

local actions = require "telescope.actions"

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            "rg", "--color=never", "--no-heading", "--with-filename",
            "--line-number", "--column", "--smart-case", "--hidden",
            "--glob=!.git/", "--glob=!node_modules/", "--glob=!.venv/"
        },
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = function(_, cols, _)
                    if cols < 120 then
                        return math.floor(cols * 0.5)
                    end
                    return math.floor(cols * 0.6)
                end,
                results_width = 0.8,
                mirror = false
            },
            vertical = {mirror = false},
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = {
            "node_modules", ".venv", "venv", "ctags", ".git"
        },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = {"truncate"},
        winblend = 0,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-c>"] = require("telescope-toggleterm").actions
                    .exit_terminal,
                ["  "] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["<Tab>"] = actions.toggle_selection +
                    actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection +
                    actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist +
                    actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-_>"] = actions.which_key,
                ["<A-t>"] = trouble.open_with_trouble
            },
            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<Tab>"] = actions.toggle_selection +
                    actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection +
                    actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist +
                    actions.open_qflist,
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,
                ["?"] = actions.which_key,
                ["<A-t>"] = trouble.open_with_trouble
            }
        }
    },
    pickers = {find_files = {hidden = true}},
    live_grep = {only_sort_text = true},
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        },
        find_cmd = "rg",
        command_palette = {
            {
                "File", {"entire selection", ':call feedkeys("GVgg")'},
                {"save current file", ':w'}, {"save all files", ':wa'},
                {"quit", ':qa'}, {
                    "file browser",
                    ":lua require'telescope'.extensions.file_browser.file_browser()",
                    1
                },
                {
                    "search word",
                    ":lua require('telescope.builtin').live_grep()", 1
                },
                {
                    "git files",
                    ":lua require('telescope.builtin').git_files()", 1
                },
                {"files", ":lua require('telescope.builtin').find_files()", 1},
                {"media", ":Telescope media_files<cr>", 1}
            }, {
                "Vim", {"reload vimrc", ":source $MYVIMRC"},
                {'check health', ":checkhealth"},
                {"jumps", ":lua require('telescope.builtin').jumplist()"},
                {
                    "command history",
                    ":lua require('telescope.builtin').command_history()"
                },
                {"registers", ":lua require('telescope.builtin').registers()"},
                {
                    "colorshceme",
                    ":lua require('telescope.builtin').colorscheme()", 1
                },
                {
                    "vim options",
                    ":lua require('telescope.builtin').vim_options()"
                }, {"keymaps", ":lua require('telescope.builtin').keymaps()"},
                {
                    "search history",
                    ":lua require('telescope.builtin').search_history()"
                }, {"paste mode", ':set paste!'},
                {'cursor line', ':set cursorline!'},
                {'cursor column', ':set cursorcolumn!'},
                {"spell checker", ':set spell!'},
                {"unfold all", ':set nofoldenable!'},
                {"disable clipboard", ':set clipboard=""'},
                {"enable clipboard", ':set clipboard+=unnamedplus'}
            }, {
                "LSP", {"LSP FORMATTING", ":lua vim.lsp.buf.formatting_sync()"},
                {"LSP declaration", ":Telescope lsp_definitions"},
                {"LSP reference", ":Telescope lsp_references"},
                {"LSP document symbol", ":Telescope lsp_document_symbols"},
                {"LSP implementation", ":Telescope lsp_implementation"},
                {"LSP code_action", ":Telescope lsp_code_actions"},
                {"LSP workspace_symbols", ":Telescope lsp_workspace_symbols"}
            }, {
                "TELESCOPE", {"registers", ":Telescope registers"},
                {"diagnostics", ":Telescope diagnostics"},
                {"resume", ":Telescope resume"}
            }, {
                "GitSigns", {"Blame Line", ":Gitsigns blame_line"},
                {"Diffthis", ":Gitsigns diffthis"},
                {"Toggle Sign", ":Gitsigns toggle_signs"},
                {"Preview Hunk", ":Gitsigns preview_hunk"},
                {
                    "Toggle Current Line Blame",
                    ":Gitsigns toggle_current_line_blame"
                }, {"Toggle Word Diff", ":Gitsigns toggle_word_diff"},
                {"Toggle Number Highlight", ":Gitsigns toggle_numhl"},
                {"Toggle Line Highlight", ":Gitsigns toggle_linehl"},
                {"Toggle Signs", ":Gitsigns toggle_signs"},
                {"Toggle Refresh", ":Gitsigns refresh"}
            }, {
                "Buffers", {"Buffer Enable", ":BufferEnable"},
                {"Buffer Disable", ":BufferDisable"},
                {"Buffers Wipeout", ":BufferWipeout"},
                {"Buffer Close All But Current", ":BufferCloseAllButCurrent"},
                {"Buffer Order By Buffer Number", ":BufferOrderByBufferNumber"},
                {"Buffer Order By Directory", ":BufferOrderByDirectory"},
                {"Buffer Order By Langauge", ":BufferOrderByLanguage"}
            },
            {
                "Mouse", {"Mouse Enable", ":set mouse=a"},
                {"Mouse Disable", ":set mouse-=a"}
            }, {"Builtin", {"built-in", ":Telescope builtin"}}, {
                "Help", {"tips", ":help tips"}, {"cheatsheet", ":help index"},
                {"tutorial", ":help tutor"}, {"summary", ":help summary"},
                {"quick reference", ":help quickref"},
                {
                    "search help(F1)",
                    ":lua require('telescope.builtin').help_tags()", 1
                }
            }
        },
        lsp_handlers = {
            code_action = {
                telescope = require('telescope.themes').get_dropdown({})
            }
        },
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
                ["i"] = {["<C-h>"] = fb_actions.goto_home_dir},
                ["n"] = {["<C-h>"] = fb_actions.goto_home_dir}
            }
        }
    }
}

telescope.load_extension('media_files')
telescope.load_extension('command_palette')
telescope.load_extension('lsp_handlers')
telescope.load_extension('fzf')
telescope.load_extension('toggleterm')
telescope.load_extension('notify')
telescope.load_extension "file_browser"

