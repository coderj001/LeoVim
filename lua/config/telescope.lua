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
		autotag = { enable = true },
		rainbow = { enable = true },
		context_commentstring = { enable = true, config = { javascriptreact = { style_element = "{/*%s*/}" } } },
		refactor = {
			highlight_definitions = { enable = true },
			highlight_current_scope = { enable = true },
		},
	})
end

return M
