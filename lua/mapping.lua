-- mapping
-- normal mode
vim.api.nvim_set_keymap("n", "<Leader>w", ":w!<cr>", { noremap = true })

-- insert mode
vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true, signal = true })
