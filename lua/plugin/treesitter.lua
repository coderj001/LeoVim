local M = {}

function M.setup()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "cpp", "python", "javascript", "html", "json", "tsx", "go", "gomod",
            "typescript", "bash", "lua", "dockerfile", "comment", "markdown",
            "glimmer", "regex", "tsx", "vim", "yaml", "toml"
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            disable = {"cpp", "latex"}
        },
        indent = {enable = {"javascriptreact"}},
        playground = {
            enable = true,
            disable = {},
            updatetime = 25,
            persist_queries = false
        },
        rainbow = {enable = true, extendend_mode = true, max_file_lines = 1000},
        autotag = {enable = true},
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
            config = {
                typescript = "// %s",
                css = "/* %s */",
                scss = "/* %s */",
                html = "<!-- %s -->",
                svelte = "<!-- %s -->",
                vue = "<!-- %s -->",
                json = "",
                javascriptreact = {style_element = "{/*%s*/}"}
            },
            refactor = {
                highlight_definitions = {
                    enable = true,
                    clear_on_cursor_move = true
                },
                highlight_current_scope = {enable = false},
                smart_rename = {enable = true, keymaps = {smart_rename = "grr"}},
                navigation = {
                    enable = true,
                    keymaps = {
                        goto_definition = "gnd",
                        list_definitions = "gnD",
                        list_definitions_toc = "gO",
                        goto_next_usage = "<a-*>",
                        goto_previous_usage = "<a-#>"
                    }
                }
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner"
                    }
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = "@class.outer"
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer"
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer"
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer"
                    }
                }
            },
            spellsitter = {enable = true},
            endwise = {enable = true},
            context = {
                enable = true,
                max_lines = 0,
                trim_scope = 'outer',
                patterns = {
                    default = {
                        'class', 'function', 'method', 'for', 'while', 'if',
                        'switch', 'case'
                    }
                },
                exact_patterns = {},
                zindex = 20,
                mode = 'cursor',
                separator = nil
            }
        }
    })
end

return M
