local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

local opts = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.nullls").setup(opts)
-- require "user.lsp.null-ls"
