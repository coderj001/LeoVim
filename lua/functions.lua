function numbertoggle()
	vim.cmd('autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif')
	vim.cmd('autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif')
end

function centerOnInsert()
    vim.cmd('au InsertEnter * :normal zz')
end

numbertoggle()
centerOnInsert()

function _G.check_back_space()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and [[\<C-n>]] or [[\<Tab>]]
end
