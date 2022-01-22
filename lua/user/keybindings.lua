-- mapping
-- normal mode
local keymap = vim.api.nvim_set_keymap


local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal
-- Leader Mapping

keymap("n", "<Leader>w", ":w!<cr>", {}) -- Save file
keymap("n", "<Leader><Enter>", ":nohlsearch<cr>", {}) -- hide highlight
-- ctrl
keymap("n", "<C-n>", ":NvimTreeToggle<cr>", {})
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<Leader><Leader>h", ":sp<cr>", opts)
keymap("n", "<Leader><Leader>v", ":vsp<cr>", opts)

-- Telescope
keymap("n", "<Leader>l", ":Telescope find_files<cr>", opts)
keymap("n", "<Leader>k", ":Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<Leader>j", ":Telescope live_grep<cr>", opts)
keymap("n", "<Leader>hh", ":Telescope help_tags<cr>", opts)
keymap("n", "<Leader>b", ":Telescope buffers<cr>", opts)
keymap("n", "<Leader>c", ":Telescope command_palette<cr>", opts)
keymap("n", "<Leader><Leader>c", ":Telescope commands<cr>", opts)

-- Delete Buffers
keymap("n", "<A-b>", ":BWipeout hidden<cr>", opts)

-- Hide split window
keymap("n", "<Leader>aa", ":hide<cr>", opts)

-- Insert
-- ESC
keymap("i", "jk", "<esc>", {})
keymap("i", "<bs>", "<nop>", {})

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
