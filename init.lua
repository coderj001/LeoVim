-- require

require "user.plugin"
require "user.options"
require "user.functions"
require "user.keybindings"
require "user.cmp"
require "user.lsp"

-- Plugin
require "nvim-tree".setup {}


local gl_user = require("global").user

if gl_user ~= nil then
	print("Welcome, ", gl.user)
end
