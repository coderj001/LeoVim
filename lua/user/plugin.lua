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
  config = function() require'plugin.nvimtree'.setup {} end
 })
end)