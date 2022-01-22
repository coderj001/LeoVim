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
  config = function() require'plugin.nvimtree'.setup()  end
 })

 -- color UI
  use ({'EdenEast/nightfox.nvim',
    config = function () require'plugin.colorscheme'.setup() end
    })
  use 'folke/tokyonight.nvim'
  use 'tiagovla/tokyodark.nvim'
  use 'shaunsingh/moonlight.nvim'

  -- Statusbar
  -- Galaxyline
  use {
    'glepnir/galaxyline.nvim',
      branch = 'main',
      config = function() require'plugin.statusline' end,
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Telescope - Manager
  use({ "nvim-lua/popup.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use ({ "nvim-telescope/telescope.nvim" , 
        config = function() require"plugin.telescope" end,
  })
	use({ "nvim-telescope/telescope-media-files.nvim" })
  use({ "LinArcX/telescope-command-palette.nvim" })


  -- Treesitter
  use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require"plugin.treesitter".setup()
		end,
	})
	use({ "nvim-treesitter/playground" })
	use({
    "nvim-treesitter/nvim-treesitter-refactor",
    requires = { "nvim-treesitter/nvim-treesitter" }
    })

  -- You can specify multiple plugins in a single call
	use({
    "tjdevries/colorbuddy.vim",
    requires = { "nvim-treesitter/nvim-treesitter", opt = true } })
  use "p00f/nvim-ts-rainbow"
  use "windwp/nvim-ts-autotag"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- dashboard
  use "glepnir/dashboard-nvim"

  -- indentLine
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function ()
      require"plugin.indentline".setup()
    end
  })

  use({
    "kazhala/close-buffers.nvim",
    config = function ()
      require"plugin.buffer-delete".setup()
    end
  })

  -- comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require"plugin.comment".setup()
    end
}

end)
