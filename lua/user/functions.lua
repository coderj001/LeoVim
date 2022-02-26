local function numbertoggle()
	vim.cmd("autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif")
	vim.cmd("autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif")
end

local function centerOnInsert()
    vim.cmd("au InsertEnter * :normal zz")
end

local function persistent_undo()
  local set = vim.opt
  local path = require "global".vim_path
  if vim.fn.has('persistent_undo') == 1 then
    set.undodir = path .. "/undodir"
    set.undofile = true  -- enable persistent undo
    set.undolevels = 10000
  end
end

numbertoggle()
centerOnInsert()
persistent_undo()
