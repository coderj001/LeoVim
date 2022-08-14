local M = {}

function M.setup()
    vim.g.bufferline = {
        numbers = function(opts)
            return string.format("%s|%s", opts.id, opts.raise(opts.ordinal))
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left", --[[| "center" | "right",]]
            },
        },
        separator_style = "slant", --| "thick" | "thin" | { 'any', 'any' },
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
