vim.cmd("set encoding=utf-8")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.number = true
vim.g.mapleader = " "
vim.api.nvim_exec("language en_US.UTF-8", true) -- 한글 unicode를 yank하기 위해

-- OSC 52를 사용한 클립보드 공유 (SSH 환경용)
local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}

vim.api.nvim_set_option("clipboard", "unnamedplus") -- to use OS clipboard
vim.o.exrc = true
vim.o.secure = true
