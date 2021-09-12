-- mapping
-- normal mode
local keymap = vim.api.nvim_set_keymap

-- Normal
-- Leader Mapping
-- Save file
keymap("n", "<Leader>w", ":w!<cr>", {})
keymap("n", "<Leader><Enter>", ":nohlsearch<cr>", {})
-- Ctrl Mapping
keymap("n", "<C-n>", ":NvimTreeToggle<cr>", {})
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
local opts2 = { expr = true, noremap = true }
-- keymap("i", "<TAB>", "pumvisible() ? '\\<C-n>' : v:lua.check_back_space() ? '\\<Tab>' : v:lua.smart_tab()", opts2)
keymap("i", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', opts2)
keymap("i", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', opts2)
