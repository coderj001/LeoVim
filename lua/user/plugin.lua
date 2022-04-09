local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

return require("packer").startup(function ()
   -- Plugin Manager
	use({ "wbthomason/packer.nvim" })

  -- File Manager
  use({ "kyazdani42/nvim-tree.lua",
		as = "nvimtree",
		requires = { "kyazdani42/nvim-web-devicons" },
    config = function ()
      require("plugin.nvimtree").setup()
    end
 })

   -- color UI
  use({
    'olimorris/onedarkpro.nvim',
    requires = "tjdevries/colorbuddy.nvim",
    config = function ()
      require("plugin.colorschemes").setup()
    end
  })

  use({
    "nvim-lualine/lualine.nvim",
    config = function ()
      require("plugin.statusline")
    end,
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  })
  use({"arkav/lualine-lsp-progress"})

  -- Telescope - Manager
  use({ "nvim-lua/popup.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({
    "nvim-telescope/telescope.nvim" ,
    config = function ()
      require("plugin.telescope")
    end,
  })
  use({"nvim-telescope/telescope-ui-select.nvim"})
	use({"nvim-telescope/telescope-media-files.nvim" })
  use({"LinArcX/telescope-command-palette.nvim" })
  use({"gbrlsnchs/telescope-lsp-handlers.nvim" })
  use({"nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({"da-moon/telescope-toggleterm.nvim" })

  -- Treesitter
  use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function ()
			require("plugin.treesitter").setup()
		end,
	})
	use({ "nvim-treesitter/playground" })
	use({
    "nvim-treesitter/nvim-treesitter-refactor",
    requires = { "nvim-treesitter/nvim-treesitter" }
    })
  use({"nvim-treesitter/nvim-treesitter-textobjects"})
  use({"s1n7ax/nvim-comment-frame"})
  use({"JoosepAlviste/nvim-ts-context-commentstring"})
  -- You can specify multiple plugins in a single call
	use({
    "tjdevries/colorbuddy.vim",
    requires = { "nvim-treesitter/nvim-treesitter", opt = true }
  })
  use({"p00f/nvim-ts-rainbow"})
  use({"windwp/nvim-ts-autotag"})
  use({
    "haringsrob/nvim_context_vt",
    config = function ()
      require("plugin.context_vt").setup()
    end
  })
  use ({'lewis6991/spellsitter.nvim'})

  -- cmp plugins
  use({"hrsh7th/nvim-cmp"})
  use({"hrsh7th/cmp-buffer"})
  use({"hrsh7th/cmp-path"})
  use({"hrsh7th/cmp-cmdline"})
  use({"saadparwaiz1/cmp_luasnip"})
  use({"hrsh7th/cmp-nvim-lsp"})
  use({"hrsh7th/cmp-nvim-lua"})
  use({"ray-x/cmp-treesitter"})
  use({"lukas-reineke/cmp-rg"})
  use({"quangnguyen30192/cmp-nvim-tags"})

  -- LSP
  use({"neovim/nvim-lspconfig"})
  use({"williamboman/nvim-lsp-installer"})
  use({"tamago324/nlsp-settings.nvim"})
  use({"nvim-lua/lsp-status.nvim"})
  use({
    "ray-x/lsp_signature.nvim",
    config = function ()
      require("lsp_signature").setup()
    end
  })
  -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  -- snippets
  use({"L3MON4D3/LuaSnip"})
  use({"rafamadriz/friendly-snippets"})

  -- dashboard
  use({"glepnir/dashboard-nvim"})

  -- indentLine
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require("plugin.indentline").setup()
    end
  })

   -- comment
  use({
    "numToStr/Comment.nvim",
    config = function ()
      require("plugin.comment").setup()
    end
  })
  -- auto-pairs
  use({"windwp/nvim-autopairs"})

  -- surround
  use {
  "ur4ltz/surround.nvim",
  config = function ()
    require("surround").setup {mappings_style = "surround"}
  end
  }

  -- gitsign
  use({"lewis6991/gitsigns.nvim"})

  -- barbar
  use({
    "romgrk/barbar.nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function ()
      require"plugin.barbar".setup()
    end
  })

  -- toggler term
  use({
   "akinsho/toggleterm.nvim",
    config = function ()
      require"plugin.togglerterm"
    end
  })

  use({"tomlion/vim-solidity"})

  -- go language
  use({
   "ray-x/go.nvim",
    config = function ()
      require("go").setup()
    end
  })

  use({
    "max397574/better-escape.nvim",
    config = function ()
      require("plugin.betterescape").setup()
    end,
  })

  use({
    "AckslD/nvim-revJ.lua",
    requires = {"kana/vim-textobj-user", "sgur/vim-textobj-parameter"},
    config = function ()
      require("revj").setup{
        keymaps = {
        operator = "<Leader>aw",
        line = "<Leader>aw",
        visual = "<Leader>aw",
        },
      }
    end
  })

  use({
    "nathom/filetype.nvim",
    config = function ()
      vim.g.did_load_filetypes = 1
    end
  })

  -- match-up is a plugin that lets you highlight, navigate, and operate on sets of matching text.
  use({
    "andymass/vim-matchup",
    event = "BufRead"
  })

  -- on saving a file.
  use({
    "jghauser/mkdir.nvim",
    cmd = "new",
    config = function ()
      require("mkdir")
    end
  })

  -- Code formatter.
  use({
    "sbdchd/neoformat",
    config = function ()
      require("plugin.neoformat").setup()
    end,
    cmd = "Neoformat"
  })

  -- lastplace
  use({
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function ()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = {
          "quickfix",
          "nofile",
          "help",
        },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
          "hgcommit",
        },
        lastplace_open_folds = true,
        })
    end,
  })

  use({"ray-x/guihua.lua", run = "cd lua/fzy && make"})

  use({
    "ray-x/navigator.lua",
    config=function ()
      require("plugin.navigation").setup()
    end,
    requires = {"ray-x/guihua.lua", run = "cd lua/fzy && make"},
  })

  use({
    "simrat39/symbols-outline.nvim",
    config=function ()
      require("plugin.symbol")
    end
  })

  use({"fedepujol/move.nvim"})

  use({
    "rktjmp/highlight-current-n.nvim", config=function ()
      require("highlight_current_n").setup({
        highlight_group = "IncSearch"
    })
  end
  })

  use({
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  })

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function ()
        require("plugin.troubleplugin").setup()
    end
  })

  use({
    "gelguy/wilder.nvim",
    config = function ()
      vim.cmd[[ call wilder#setup() ]]
    end
  })

  use({"Pocco81/HighStr.nvim"})
  use({
    "norcalli/nvim-colorizer.lua",
    config = function ()
      require("colorizer").setup()
    end
  })

  use({
  "mvllow/modes.nvim",
  config = function()
    require('modes').setup({
      colors = {
        normal   = "#111111",
        insert   = "#98be65",
        delete   = "#ca1243",
        copy     = "#ec5f67",
        visual   = "#51afef",
      },
      line_opacity = 0.1,
      set_cursor = true,
      focus_only = true
      })
  end
  })

  use({
    "karb94/neoscroll.nvim",
    config = function ()
      require("neoscroll").setup()
    end
  })

  use({"nyngwang/NeoZoom.lua"})

  use({ "McAuleyPenney/tidy.nvim", event = "BufWritePre" })
  use({
    "mrjones2014/smart-splits.nvim",
    config = function ()
      require("plugin.split").setup()
    end
  })

  use({
    "phaazon/hop.nvim",
    branch = "v1",
    config = function ()
      require("hop").setup()
    end
  })
end)
