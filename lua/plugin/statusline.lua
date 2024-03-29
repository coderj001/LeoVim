local global = require("global")
local lualine = require("lualine")

-- Color table for highlights
-- stylua: ignore
local colors = {
    darkblue = '#081633',
    orange = '#FF8800',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    red = '#ec5f67',
    deepred = '#ca1243',
    grey = '#a0a1a7',
    black = '#383a42',
    white = '#f3f3f3',
    light_green = '#83a598',
    blue = '#61afef',
    green = '#98c379',
    purple = '#c678dd',
    cyan = '#56b6c2',
    red1 = '#e06c75',
    red2 = '#be5046',
    yellow = '#e5c07b',
    fg = '#abb2bf',
    bg = '#282c34',
    gray1 = '#828997',
    gray2 = '#2c323c',
    gray3 = '#3e4452'
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end
}

-- Config
local config = {
    options = {
        icons_enabled = true,
        component_separators = {left = '', right = ''},
        section_separators = {left = '', right = ''},
        theme = 'onedark',
        disabled_filetypes = {
            "LuaTree", "vista", "Vista", "dbui", "startify", "term", "nerdtree",
            "fugitive", "fugitiveblame", "plug", "NvimTree", "packer",
            "nvim-tree", "floaterm", "dashboard", "SymbolsOutline"
        }
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {}
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {}
    },
    tabline = {},
    extensions = {"nvim-tree"}
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left({
    function() return '▊' end,
    color = {fg = colors.blue}, -- Sets highlighting of component
    padding = {left = 0, right = 1} -- We don't need space before this
})

ins_left({
    function()
        local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red
        }
        vim.api.nvim_command('hi! LualineMode guifg=' ..
                                 mode_color[vim.fn.mode()] .. ' guibg=' ..
                                 colors.bg)
        return "🚀" .. global.username .. " "
    end,
    color = 'LualineMode',
    padding = {right = 1}
})

ins_left({
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty
})

ins_left({
    'filename',
    cond = conditions.buffer_not_empty,
    color = {fg = colors.blue, gui = 'bold'}
})

ins_left({'location', colors = {fg = colors.fg, gui = 'bold'}})

ins_left({'progress', color = {fg = colors.fg, gui = 'bold'}})

ins_left({
    'diagnostics',
    sources = {'nvim_diagnostic'},
    -- symbols = { error = " ", warn = " ", info = " ", hint = " " },
    symbols = {error = " ", warn = " ", info = " ", hint = " "},
    diagnostics_color = {
        color_error = {fg = colors.red},
        color_warn = {fg = colors.yellow},
        color_info = {fg = colors.cyan}
    }
})

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left({function() return '%=' end})

ins_left({
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then return msg end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = {fg = '#ffffff', gui = 'bold'}
})

ins_left({
    'lsp_progress',
    colors = {
        percentage = colors.cyan,
        title = colors.cyan,
        message = colors.cyan,
        spinner = colors.cyan,
        lsp_client_name = colors.magenta,
        use = true
    },
    separators = {
        component = ' ',
        progress = ' | ',
        messages = {pre = '(', post = ')'},
        percentage = {pre = '', post = '%% '},
        title = {pre = '', post = ': '},
        lsp_client_name = {pre = '[', post = ']'},
        spinner = {pre = '', post = ''},
        message = {commenced = 'In Progress', completed = 'Completed'}
    },
    display_components = {
        'lsp_client_name', 'spinner', {'title', 'percentage', 'message'}
    },
    timer = {
        progress_enddelay = 500,
        spinner = 1000,
        lsp_client_name_enddelay = 1000
    },
    spinner_symbols = {
        '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 '
    }
})

ins_right({'branch', icon = '', color = {fg = colors.violet, gui = 'bold'}})

ins_right({
    'diff',
    symbols = {added = ' ', modified = '柳', removed = ' '},
    diff_color = {
        added = {fg = colors.green},
        modified = {fg = colors.orange},
        removed = {fg = colors.red}
    },
    cond = conditions.hide_in_width
})

ins_right({
    function() return '▊' end,
    color = {fg = colors.blue},
    padding = {left = 1}
})

-- Now don't forget to initialize lualine
lualine.setup(config)
