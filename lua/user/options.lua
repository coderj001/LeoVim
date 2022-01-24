local set = vim.opt

local function bind_option(options)
	for k, v in pairs(options) do
		if v == true or v == false then
			vim.cmd("set " .. k)
		else
			vim.cmd("set " .. k .. "=" .. v)
		end
	end
end

local function bind_extra_cmd(options)
	for optionCount = 1, #options do
		vim.cmd(options[optionCount])
	end
end

-- :help options
set.backup = false                          -- creates a backup file
set.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
set.cmdheight = 2                           -- more space in the neovim command line for displaying messages
set.completeopt = { "menuone", "noselect" } -- mostly just for cmp
set.conceallevel = 0                        -- so that `` is visible in markdown files
set.fileencoding = "utf-8"                  -- the encoding written to a file
set.hlsearch = true                         -- highlight all matches on previous search pattern
set.ignorecase = true                       -- ignore case in search patterns
set.mouse = "a"                             -- allow the mouse to be used in neovim
set.pumheight = 10                          -- pop up menu height
set.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
set.showtabline = 2                         -- always show tabs
set.smartcase = true                        -- smart case
set.smartindent = true                      -- make indenting smarter again
set.splitbelow = true                       -- force all horizontal splits to go below current window
set.splitright = true                       -- force all vertical splits to go to the right of current window
set.swapfile = false                        -- creates a swapfile
set.termguicolors = true                    -- set term gui colors (most terminals support this)
set.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
set.undofile = true                         -- enable persistent undo
set.updatetime = 300                        -- faster completion (4000ms default)
set.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
set.expandtab = true                        -- convert tabs to spaces
set.shiftwidth = 2                          -- the number of spaces inserted for each indentation
set.tabstop = 2                             -- insert 2 spaces for a tab
set.cursorline = true                       -- highlight the current line
set.number = true                           -- set numbered lines
set.relativenumber = true                   -- set relative numbered lines
set.numberwidth = 4                         -- set number column width to 2 {default 4}
set.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
set.wrap = false                            -- display lines as one long line
set.scrolloff = 8                           -- is one of my fav
set.sidescrolloff = 8
set.guifont = "monospace:h10"               -- the font used in graphical neovim applications
set.history = 500
set.so = 7
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

set.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work



local function load_extra_options()
	local options = {
		"filetype plugin on",
		"filetype indent on",
		"cabbr Q q",
		"cabbr Q! q!",
		"cabbr W! w!",
		"cabbr W w",
		"cabbr WA wa",
		"cabbr Wa wa",
		"cabbr Wq wq",
		"cabbr WQ wq",
		"cabbr Qa qa",
		"cabbr QA qa",
	}
	bind_extra_cmd(options)
end

load_extra_options()
