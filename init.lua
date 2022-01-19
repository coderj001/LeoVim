-- require

require "user.plugin"
require "user.options"
require "user.functions"
require "user.keybindings"

-- Plugin
require "nvim-tree".setup {}


local gl_user = require("global").user

if gl_user ~= nil then
	print("Welcome, ", gl.user)
end
