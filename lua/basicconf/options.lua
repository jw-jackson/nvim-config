-- 显示行号
vim.opt.number = true
-- 显示相对行号
vim.opt.relativenumber = true


-- 缩进
-- :help 'tabstop' use way 2
-- Set 'tabstop' and 'shiftwidth' to whatever you prefer and use 'expandtab'.  This way you will always insert spaces.  The formatting will never be messed up when 'tabstop' is changed.
vim.opt.tabstop = 4
vim.opt.shiftwidth= 4
vim.opt.expandtab = true

-- 系统剪贴板
-- what is difference between unnamed and unnamedplus
-- https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
-- 一句话，windows macos下没有区别，在Linux下有区别
vim.opt.clipboard:append("unnamedplus")

-- wrap
-- 行满是是否折叠至下一行
vim.opt.wrap = true


-- serach
-- 不区分大小写
vim.opt.ignorecase = true
-- 只搜索大写就是大写
vim.opt.smartcase = true


-- 终端真颜色
-- 许多 nvim 主题需要
-- vim.opt.termguicolors = true

--
-- vim.opt.signcolumn = "yes"

-- 鼠标启用
vim.opt.mouse:append("a")


-- 默认新窗口
-- vim.opt.splitright = true
-- vim.opt.splitlow = true
