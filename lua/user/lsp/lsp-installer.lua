local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
local lsp_installer_servers = require('nvim-lsp-installer.servers')

if not status_ok then
	return
end

local servers = {
  "gopls",
  "tsserver"
}

for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function ()
            local opts = {}
            server:setup(opts)
        end)
        if not server:is_installed() then
            server:install()
        end
    end
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local lsp_handlers = require("user.lsp.handlers")
    local lsp_capabilities = require("user.lsp.handlers").capabilities

    local opts = {
        on_attach = lsp_handlers.on_attach,
        capabilities = lsp_capabilities,
    }

    if server.name == "jsonls" then
        local jsonls_opts = require("user.lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", opts, jsonls_opts)
    elseif server.name == "lua_ls" then
        local lua_ls_opts = require("user.lsp.settings.lua_ls")
        opts = vim.tbl_deep_extend("force", opts, lua_ls_opts)
    elseif server.name == "pyright" then
        local pyright_opts = require("user.lsp.settings.pyright")
        opts = vim.tbl_deep_extend("force", opts, pyright_opts)
    elseif server.name == "sourcekit" then
        local sourcekit_opts = require("user.lsp.settings.sourcekit")
        opts = vim.tbl_deep_extend("force", opts, sourcekit_opts)
    elseif server.name == "dockerls" then
        local dockerls_opts = require("user.lsp.settings.dockerls")
        opts = vim.tbl_deep_extend("force", opts, dockerls_opts)
    elseif server.name == "gopls" then
        local gopls_opts = require("user.lsp.settings.gopls")
        opts = vim.tbl_deep_extend("force", opts, gopls_opts)
    end

    server:setup(opts)
end)

lsp_installer.settings({
  ui = {
    icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗"
    }
  }
})
