local status_ok, telescope = pcall(require, "telescope")
if not status_ok then return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,
        ["  "] = actions.close,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

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
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      }
  },
  extensions = {
    find_cmd = "rg",
    command_palette = {
      {"File",
        { "entire selection", ':call feedkeys("GVgg")' },
        { "save current file", ':w' },
        { "save all files", ':wa' },
        { "quit", ':qa' },
        { "file browser", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
        { "search word", ":lua require('telescope.builtin').live_grep()", 1 },
        { "git files", ":lua require('telescope.builtin').git_files()", 1 },
        { "files",     ":lua require('telescope.builtin').find_files()", 1 },
        { "media",     ":Telescope media_files<cr>", 1 },
      },
      {"Help",
        { "tips", ":help tips" },
        { "cheatsheet", ":help index" },
        { "tutorial", ":help tutor" },
        { "summary", ":help summary" },
        { "quick reference", ":help quickref" },
        { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
      },
      {"Vim",
        { "reload vimrc", ":source $MYVIMRC" },
        { 'check health', ":checkhealth" },
        { "jumps", ":lua require('telescope.builtin').jumplist()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers", ":lua require('telescope.builtin').registers()" },
        { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
        { "vim options", ":lua require('telescope.builtin').vim_options()" },
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
        { "search history", ":lua require('telescope.builtin').search_history()" },
        { "paste mode", ':set paste!' },
        { 'cursor line', ':set cursorline!' },
        { 'cursor column', ':set cursorcolumn!' },
        { "spell checker", ':set spell!' },
      },
      {"LSP",
        { "LSP declaration", ":Telescope lsp_definitions" },
        { "LSP reference", ":Telescope lsp_references" },
        { "LSP document symbol", ":Telescope lsp_document_symbols" },
        { "LSP implementation", ":Telescope lsp_implementation" },
        { "LSP code_action", ":Telescope lsp_code_actions" },
        { "LSP workspace_symbols", ":Telescope lsp_workspace_symbols" },
      },
      {"GitSigns",
        { "Blame Line", ":Gitsigns blame_line" },
        { "Diffthis", ":Gitsigns diffthis" },
        { "Toggle Sign", ":Gitsigns toggle_signs" },
        { "Preview Hunk", ":Gitsigns preview_hunk" },
        { "Toggle Current Line Blame", ":Gitsigns toggle_current_line_blame" },
        { "Toggle Word Diff", ":Gitsigns toggle_word_diff" },
        { "Toggle Number Highlight", ":Gitsigns toggle_numhl" },
        { "Toggle Line Highlight", ":Gitsigns toggle_linehl" },
        { "Toggle Signs", ":Gitsigns toggle_signs" },
        { "Toggle Refresh", ":Gitsigns refresh" },
      },
    },
    lsp_handlers = {
			code_action = {
				telescope = require('telescope.themes').get_dropdown({}),
			},
		},
  },
}

require("telescope").load_extension('media_files')
require("telescope").load_extension('command_palette')
require("telescope").load_extension('lsp_handlers')
require("telescope").load_extension('fzf')
