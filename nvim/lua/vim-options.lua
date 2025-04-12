vim.cmd("set encoding=utf-8")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.number = true
vim.g.mapleader = " "
vim.api.nvim_exec("language en_US.UTF-8", true) -- 한글 unicode를 yank하기 위해
vim.api.nvim_set_option("clipboard", "unnamedplus") -- to use OS clipboard
vim.o.exrc = true
vim.o.secure = true
