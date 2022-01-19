-- mapping
-- normal mode
local keymap = vim.api.nvim_set_keymap


-- Normal
-- Leader Mapping

keymap("n", "<Leader>w", ":w!<cr>", {}) -- Save file
keymap("n", "<Leader><Enter>", ":nohlsearch<cr>", {}) -- hide highlight
keymap("n", "<Leader>aa", ":hide<cr>", {}) -- hide current window
-- ctrl
-- keymap("n", "<C-n>", ":NvimTreeToggle<cr>", {})
local opts1 = { noremap = true }
keymap("n", "<C-l>", "<C-w>l", opts1)
keymap("n", "<C-k>", "<C-w>k", opts1)
keymap("n", "<C-j>", "<C-w>j", opts1)
keymap("n", "<C-h>", "<C-w>h", opts1)
keymap("n", "<Leader><Leader>h", ":sp<cr>", opts1)
keymap("n", "<Leader><Leader>v", ":vsp<cr>", opts1)
-- Hide split window
keymap("n", "<Leader>aa", ":hide<cr>", opts1)

-- Insert
-- ESC
keymap("i", "jk", "<esc>", {})
