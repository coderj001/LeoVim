local M = {}

function M.setup()
    vim.g.bufferline = {
        maximum_length = 25,
        insert_at_end = false,
        insert_at_start = true,
        clickable = false,
        closable = false,
        icon_separator_active = '▎',
        icon_separator_inactive = '▎',
        icon_close_tab = '',
        icon_close_tab_modified = '●',
        icon_pinned = '車',
        semantic_letters = true,
        animation = false
    }
end

return M
