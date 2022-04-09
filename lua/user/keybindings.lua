-- mapping
-- normal mode
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, silent = true, expr = true }
local term_opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("n", "n", "<Plug>(highlight-current-n-n)", {})
keymap("n", "N", "<Plug>(highlight-current-n-N)", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal
-- Leader Mapping
keymap("n", "<Leader><Enter>", ":nohlsearch<cr>", {})
keymap("n", "<C-n>", ":NvimTreeToggle<cr>", {})
keymap("n", "<C-l>", ":lua require('smart-splits').move_cursor_right()<cr>", opts)
keymap("n", "<C-k>", ":lua require('smart-splits').move_cursor_up()<cr>", opts)
keymap("n", "<C-j>", ":lua require('smart-splits').move_cursor_down()<cr>", opts)
keymap("n", "<C-h>", "::lua require('smart-splits').move_cursor_left()<cr>", opts)
keymap("n", "<C-c>", "<esc>", opts)
keymap("n", "<Leader><Leader>v", ":vsp<cr>", opts)
keymap("n", "<Leader><Leader>V", ":sp<cr>", opts)

-- Telescope
keymap("n", "<Leader>;", ":Telescope command_palette<cr>", opts)
keymap("n", "<Leader>l", ":Telescope find_files<cr>", opts)
keymap("n", "<Leader>k", ":Telescope current_buffer_fuzzy_find<cr>", opts)
keymap("n", "<Leader>j", ":Telescope live_grep<cr>", opts)
keymap("n", "<Leader>hh", ":Telescope help_tags<cr>", opts)
keymap("n", "<Leader>h", ":Telescope marks<cr>", opts)
keymap("n", "<Leader>b", ":Telescope buffers<cr>", opts)
keymap("n", "<Leader><Leader>;", ":Telescope commands<cr>", opts)
keymap("n", "<Leader>n", ":Telescope treesitter<cr>", opts)
keymap("n", "<Leader>m", ":Telescope tags<cr>", opts)
keymap("n", "<Leader>h", ":Telescope tagstacks<cr>", opts)
keymap("n", "<Leader>cc", ":lua require('nvim-comment-frame').add_comment()<cr>", opts)
keymap("n", "<Leader>ca", ":CodeActionMenu<cr>", opts)
keymap("n", "<Leader>C", ":lua require('nvim-comment-frame').add_multiline_comment()<cr>", opts)
keymap("n", "<Leader>xx", ":Trouble<cr>", opts)
keymap("n", "<Leader>xw", ":Trouble workspace_diagnostics<cr>", opts)
keymap("n", "<Leader>xd", ":Trouble document_diagnostics<cr>", opts)
keymap("n", "<Leader>xl", ":Trouble loclist<cr>", opts)
keymap("n", "<Leader>xq", ":Trouble quickfix<cr>", opts)
keymap("n", "gR", ":Trouble lsp_references<cr>", opts)

-- Hide split window
keymap("n", "<Leader>aa", ":hide<cr>", opts)

-- Move to previous/next
keymap("n", "<S-TAB>", ":BufferPrevious<cr>", opts)
keymap("n", "<TAB>", ":BufferNext<cr>", opts)
-- Re-order to previous/next
keymap("n", "<A-<>", ":BufferMovePrevious<cr>", opts)
keymap("n", "<A->>", ":BufferMoveNext<cr>", opts)
-- Goto buffer in position...
keymap("n", "<Leader>1", ":BufferGoto 1<cr>", opts)
keymap("n", "<Leader>2", ":BufferGoto 2<cr>", opts)
keymap("n", "<Leader>3", ":BufferGoto 3<cr>", opts)
keymap("n", "<Leader>4", ":BufferGoto 4<cr>", opts)
keymap("n", "<Leader>5", ":BufferGoto 5<cr>", opts)
keymap("n", "<Leader>6", ":BufferGoto 6<cr>", opts)
keymap("n", "<Leader>7", ":BufferGoto 7<cr>", opts)
keymap("n", "<Leader>8", ":BufferGoto 8<cr>", opts)
keymap("n", "<Leader>9", ":BufferGoto 9<cr>", opts)
keymap("n", "<Leader>0", ":BufferLast<cr>", opts)
keymap("n", "<Leader>o", ":SymbolsOutline<cr>", opts)
keymap("n", "<Leader>oc", ":SymbolsOutlineClose<cr>", opts)
keymap("n", "<Leader>tt", ":ToggleTerm<cr>", opts)
keymap("n", "<Leader>t", ":Telescope toggleterm<cr>", opts)
keymap("n", "<Leader>z", ":NeoZoomToggle<cr>", opts)

-- Close buffer
keymap("n", "<A-c>", ":BufferClose<cr>", opts)
-- Nvimtree
keymap("n", "<A-f>", ":NvimTreeFindFile<cr>", opts)

-- " Use alt + hjkl to resize windows
keymap("n", "<A-up>", ":lua require('smart-splits').resize_up()<cr>", opts)
keymap("n", "<A-down>", ":lua require('smart-splits').resize_down()<cr>", opts)
keymap("n", "<A-right>", ":lua require('smart-splits').resize_right()<cr>", opts)
keymap("n", "<A-left>", ":lua require('smart-splits').resize_left()<cr>", opts)

-- Move text up and down
keymap("n", "<A-j>", ":MoveLine(1)<cr>", opts)
keymap("n", "<A-k>", ":MoveLine(-1)<cr>", opts)
keymap("n", "<A-l>", ":MoveHChar(1)<cr>", opts)
keymap("n", "<A-h>", ":MoveHChar(-1)<cr>", opts)
keymap("n", "<C-n>", ":NvimTreeToggle<cr>", opts)

-- Hop
keymap("n", "s", ":HopChar2AC<cr>", opts)
keymap("n", "S", ":HopChar2BC<cr>", opts)
keymap("n", "<Leader>w", ":HopWordAC<cr>", opts)
keymap("n", "<Leader>W", ":HopWordBC<cr>", opts)

-- Visual --
-- Move text up and down
keymap("v", "<A-j>", ":MoveBlock(1)<cr>", opts)
keymap("v", "<A-k>", ":MoveBlock(-1)<cr>", opts)
keymap("v", "<A-l>", ":MoveHBlock(1)<cr>", opts)
keymap("v", "<A-h>", ":MoveHBlock(-1)<cr>", opts)
keymap("v", "p", '"_dP', opts)
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Insert
-- ESC
keymap("i", "<C-c>", "<esc>", opts)
keymap("i", "<bs>", "<nop>", {})
keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], expr_opts)
keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], expr_opts)


-- Visual Block --
keymap("x", "J", ":move '>+1<cr>gv-gv", opts)
keymap("x", "K", ":move '<-2<cr>gv-gv", opts)
-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
