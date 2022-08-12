if (not vim.g.vscode) then
    -- require
    require "user.plugin"
    require "user.options"
    require "user.functions"
    require "user.keybindings"
    require "user.cmp"
    require "user.lsp"

    -- Plugin
    require "plugin.autopairs"
    require "plugin.gitsigns"
    require "plugin.rest"
end
