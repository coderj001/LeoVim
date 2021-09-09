local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end
return require("packer").startup(function()
	-- Plugin Manager
	use({ "wbthomason/packer.nvim" })
	-- UI
	-- Treesitter
	-- Post-install/update hook with neovim command
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("config.treesitter").setup()
		end,
	})
	use({ "nvim-treesitter/playground" })
	use({ "nvim-treesitter/nvim-treesitter-refactor", requires = { "nvim-treesitter/nvim-treesitter" } })
	-- You can specify multiple plugins in a single call
	use({ "tjdevries/colorbuddy.vim", { "nvim-treesitter/nvim-treesitter", opt = true } })
	-- You can alias plugin names
	use({
		"dracula/vim",
		as = "dracula",
		config = function()
			require("config.colorscheme").setup()
		end,
	})
	-- Use specific branch, dependency and run lua file after load
	-- use({
	-- 	"glepnir/galaxyline.nvim",
	-- 	branch = "main",
	-- 	config = function()
	-- 		require("config.statusline")
	-- 	end,
	-- 	requires = { "kyazdani42/nvim-web-devicons" },
	-- })
	-- surround
	use({
		"blackCauldron7/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "sandwich" })
		end,
	})
	-- telescope
	use({ "nvim-lua/popup.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-media-files.nvim" })
	-- brower
	use({
		"kyazdani42/nvim-tree.lua",
		as = "nvimtree",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("config.nerdtree").setup()
		end,
	})
end)
