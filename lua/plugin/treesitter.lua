local M = {}

function M.setup()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
      "cpp",
      "python",
      "javascript",
      "html",
      "json",
      "tsx",
      "go",
      "gomod",
      "typescript",
      "bash",
      "lua",
      "dockerfile",
      "comment",
      "markdown",
      "glimmer",
      "regex",
      "tsx",
      "vim",
      "yaml",
      "toml",
    },
		highlight = {
			enable = true,
			disable = { "cpp" },
		},
		indent = { enable = { "javascriptreact" } },
		playground = {
			enable = true,
			disable = {},
			updatetime = 25,
			persist_queries = false,
		},
		rainbow = {
      enable = true,
      extendend_mode = true,
      max_file_lines = nil,
    },
		autotag = { enable = true },
		context_commentstring = { enable = true, config = { javascriptreact = { style_element = "{/*%s*/}" } } },
		refactor = {
			highlight_definitions = { enable = true },
			highlight_current_scope = { enable = true },
      smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
        },
      },
      navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
		},
    textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
        },
      },
    },
    context_vt = {
      prefix = '',
      highlight = 'CustomContextVt',
      disable_ft = { 'markdown' },
      disable_virtual_lines = false,
      disable_virtual_lines_ft = { 'yaml' },
      min_rows = 1,
      min_rows_ft = {},
    },
	})
end

return M
