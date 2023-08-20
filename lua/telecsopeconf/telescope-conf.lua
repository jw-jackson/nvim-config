--keymapping*******************************************************************
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--*****************************************************************************

--runtimepath 是个 neovim 的
--vim.opt.runtimepath:prepend("/home/jackson/.local/share/nvim/ripgrep/")
vim.env.PATH = vim.env.PATH .. ":" .. os.getenv("HOME") .. "/.local/share/nvim/ripgrep"
