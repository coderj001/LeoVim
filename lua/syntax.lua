-- neovim syntax

-- tab title as file name
vim.o.title = true
-- set this so we wont break indentation plugin
vim.o.conceallevel = 2
-- open vertical split to the right
vim.o.splitright = true
-- open horizontal split to the bottom
vim.o.splitbelow = true
-- Use ripgrep for grepprg (vim search)
vim.o.grepprg = "rg --vimgrep"
-- Always show current position
vim.o.ruler = true
-- Height of the command bar
vim.o.cmdheight = 2
-- A buffer becomes hidden when it is abandoned
vim.o.hid = true
-- Ignore case when searching
vim.o.ignorecase = true
-- When searching try to be smart about cases
vim.o.smartcase = true
-- Highlight search results
vim.o.hlsearch = true
-- Makes search act like search in modern browsers
vim.o.incsearch = true
-- Don't redraw while executing macros (good performance config)
vim.o.lazyredraw = true
-- For regular expressions turn magic on
-- set magic
-- Show matching brackets when text indicator is over them
vim.o.showmatch = true
-- How many tenths of a second to blink when matching brackets
vim.o.mat = 2
-- No annoying sound on errors
-- line
vim.o.number = true

-- leader set
vim.g.mapleader = ','
