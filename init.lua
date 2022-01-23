-- require
require "user.plugin"
require "user.options"
require "user.functions"
require "user.keybindings"
require "user.cmp"
require "user.lsp"

-- Plugin
require "nvim-tree".setup {}
require "plugin.dashboard"
require "plugin.autopairs"
require "plugin.gitsigns"

local gl_user = require("global").user

if gl_user ~= nil then
	print("Welcome, ", gl_user)
end
