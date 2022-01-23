local M = {}

function M.setup()
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "cpp", "python", "javascript", "html", "json", "tsx", "vue", "typescript", "bash", "lua" },
		highlight = {
			enable = true,
			disable = { "cpp" },
		},
		indent = { enable = { "javascriptreact" } },
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
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
	})
end

return M
