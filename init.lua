require('core.options')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.g.mapleader = " "
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


--require("lazy").setup({nvim_tree_plugin},{})
require("lazy").setup("plugins")

require('core.keybindings')
--require('nvim-tree').setup()
