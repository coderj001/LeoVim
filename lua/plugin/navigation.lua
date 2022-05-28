local M = {}
local navigator = require("navigator")

function M.setup()
  navigator.setup({
    debug = false,
    width = 0.75,
    height = 0.3,
    preview_height = 0.35,
    border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
    default_mapping = false,
    keymaps = {{key="gK", func="declaration()"}},
    treesitter_analysis = true,
    transparency = 70,
    lsp_signature_help = true,
    icons = {
      code_action_icon = "🏏",
      diagnostic_head = '🐛',
      diagnostic_head_severity_1 = "x",
    },
    lsp_installer = false,
    lsp = {
      code_action = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
      code_lens_action = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
      format_on_save = true,
      disable_format_cap = {"sqls", "sumneko_lua", "gopls"},
      disable_lsp = {'pylsd', 'sqlls'},
      diagnostic_scrollbar_sign = {'▃', '▆', '█'},
      diagnostic_virtual_text = true,
      diagnostic_update_in_insert = false,
      disply_diagnostic_qf = true
    }
  })
end

return M
