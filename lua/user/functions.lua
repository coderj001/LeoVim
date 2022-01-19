function numbertoggle()
	vim.cmd('autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif')
	vim.cmd('autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif')
end

function centerOnInsert()
    vim.cmd('au InsertEnter * :normal zz')
end

function setLeader()
  vim.cmd('let mapleader = ","')
end

numbertoggle()
centerOnInsert()
setLeader()
