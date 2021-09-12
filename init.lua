-- require

require("plugin")
require("syntax")
require("mapping")
require("functions")
require("options")

local gl_user = require("global").user
if gl_user ~= nil then
	print("Welcome, ", gl.user)
end
