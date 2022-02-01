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
keymap("n", "<Leader>n", ":Telescope treesitter<cr>", opts)
keymap("n", "<Leader>m", ":Telescope tags<cr>", opts)
keymap("n", "<Leader>h", ":Telescope tagstacks<cr>", opts)

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

keymap('n', '<Leader><Leader>t', ':ToggleTerm<CR>', opts)
-- LSP
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', opts)
keymap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', opts)
keymap('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', opts)
keymap('n', 'gr', ':lua vim.lsp.buf.references()<cr>', opts)
keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<cr>', opts)
keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
keymap('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', opts)
keymap('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', opts)
keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', opts)

-- " Use alt + hjkl to resize windows
keymap("n", "<A-up>", ":resize -1<cr>", opts)
keymap("n", "<A-down>", ":resize +1<cr>", opts)
keymap("n", "<A-right>", ":vertical resize -1<cr>", opts)
keymap("n", "<left>", ":vertical resize +1<cr>", opts)

-- Insert
-- ESC
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
