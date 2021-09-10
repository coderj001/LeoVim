-- mapping
-- normal mode
local keymap=vim.api.nvim_set_keymap

-- Normal
-- Leader Mapping
-- Save file
keymap("n", "<Leader>w", ":w!<cr>", {})
keymap("n", "<Leader><Enter>", ":nohlsearch<cr>", {})
-- Ctrl Mapping
keymap("n", "<C-n>", ":NvimTreeToggle<cr>", {})
local opts={noremap = true}
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-h>", "<C-w>h", opts)

-- Insert
-- ESC
keymap("i", "jk", "<esc>", {})
