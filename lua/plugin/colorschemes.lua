local colorbuddy = require("colorbuddy")
local M = {}

function M.setup()
    require("onedarkpro").setup({
        dark_theme = "onedark",
        light_theme = "onelight",
        styles = {
            comments = "italic",
            functions = "bold",
            keywords = "bold,italic",
            strings = "NONE",
            variables = "NONE",
            virtual_text = "NONE"
        },
        options = {transparency = true, underline = true, undercurl = true}
    })
    colorbuddy.colorscheme('onedark_vivid')
    colorbuddy.setup()
end

return M
