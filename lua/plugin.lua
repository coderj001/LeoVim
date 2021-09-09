local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end
return require('packer').startup(function()
    -- Plugin Manager
    use {'wbthomason/packer.nvim'}
    -- UI
    -- Treesitter
    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    config = function () require 'config/treesitter'.setup() end,
    }
    use { 'nvim-treesitter/playground'}
    use { 'nvim-treesitter/nvim-treesitter-refactor', requires= {'nvim-treesitter/nvim-treesitter'}}
-- Use specific branch, dependency and run lua file after load
    -- use {
    --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    --   requires = {'kyazdani42/nvim-web-devicons'}
    -- }
end
)
