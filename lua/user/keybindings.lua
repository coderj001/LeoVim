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

keymap("n", "<Leader>w", ":w!<cr>", {})
keymap("n", "<Leader><Enter>", ":nohlsearch<cr>", {})
keymap("n", "<C-n>", ":NvimTreeToggle<cr>", {})
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-c>", "<esc>", opts)
keymap("n", "<Leader><Leader>v", ":vsp<cr>", opts)
keymap("n", "<Leader><Leader>V", ":sp<cr>", opts)

-- Telescope
keymap("n", "<C-x>", ":Telescope command_palette<cr>", opts)
keymap("n", "<Leader>l", ":Telescope find_files<cr>", opts)
keymap("n", "<Leader>k", ":Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<Leader>j", ":Telescope live_grep<cr>", opts)
keymap("n", "<Leader>hh", ":Telescope help_tags<cr>", opts)
keymap("n", "<Leader>b", ":Telescope buffers<cr>", opts)
keymap("n", "<Leader>;", ":Telescope commands<cr>", opts)
keymap("n", "<Leader>n", ":Telescope treesitter<cr>", opts)
keymap("n", "<Leader>m", ":Telescope tags<cr>", opts)
keymap("n", "<Leader>h", ":Telescope tagstacks<cr>", opts)
keymap('n', '<Leader>cc', ":lua require('nvim-comment-frame').add_comment()<cr>", opts)
keymap('n', '<Leader>ca', ":CodeActionMenu<cr>", opts)
keymap('n', '<Leader>C', ":lua require('nvim-comment-frame').add_multiline_comment()<cr>", opts)
keymap("n", "<leader>xx", ":Trouble<cr>", opts)
keymap("n", "<leader>xw", ":Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", ":Trouble document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", ":Trouble loclist<cr>", opts)
keymap("n", "<leader>xq", ":Trouble quickfix<cr>", opts)
keymap("n", "gR", ":Trouble lsp_references<cr>", opts)

-- Hide split window
keymap("n", "<Leader>aa", ":hide<cr>", opts)

-- Move to previous/next
keymap('n', '<S-TAB>', ':BufferPrevious<CR>', opts)
keymap('n', '<TAB>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<Leader>1', ':BufferGoto 1<CR>', opts)
keymap('n', '<Leader>2', ':BufferGoto 2<CR>', opts)
keymap('n', '<Leader>3', ':BufferGoto 3<CR>', opts)
keymap('n', '<Leader>4', ':BufferGoto 4<CR>', opts)
keymap('n', '<Leader>5', ':BufferGoto 5<CR>', opts)
keymap('n', '<Leader>6', ':BufferGoto 6<CR>', opts)
keymap('n', '<Leader>7', ':BufferGoto 7<CR>', opts)
keymap('n', '<Leader>8', ':BufferGoto 8<CR>', opts)
keymap('n', '<Leader>9', ':BufferGoto 9<CR>', opts)
keymap('n', '<Leader>0', ':BufferLast<CR>', opts)
-- Close buffer
keymap('n', '<A-c>', ':BufferClose<CR>', opts)

keymap('n', '<Leader>tt', ':ToggleTerm<CR>', opts)

-- Nvimtree
keymap('n', '<A-f>', ':NvimTreeFindFile<CR>', opts)

-- " Use alt + hjkl to resize windows
keymap("n", "<A-up>", ":resize -1<cr>", opts)
keymap("n", "<A-down>", ":resize +1<cr>", opts)
keymap("n", "<A-right>", ":vertical resize -1<cr>", opts)
keymap("n", "<A-left>", ":vertical resize +1<cr>", opts)

-- Insert
-- ESC
keymap("i", "<C-c>", "<esc>", opts)
keymap("i", "<bs>", "<nop>", {})

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap('n', '<A-j>', ":MoveLine(1)<CR>", opts)
keymap('n', '<A-k>', ":MoveLine(-1)<CR>", opts)
keymap('n', '<A-l>', ":MoveHChar(1)<CR>", opts)
keymap('n', '<A-h>', ":MoveHChar(-1)<CR>", opts)
keymap("n", "<C-n>", ":NvimTreeToggle<cr>", opts)
keymap("v", "p", '"_dP', opts)
-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap('v', '<A-j>', ":MoveBlock(1)<CR>", opts)
keymap('v', '<A-k>', ":MoveBlock(-1)<CR>", opts)
keymap('v', '<A-l>', ":MoveHBlock(1)<CR>", opts)
keymap('v', '<A-h>', ":MoveHBlock(-1)<CR>", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
