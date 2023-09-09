
--runtimepath 是个 neovim 的
--vim.opt.runtimepath:prepend("/home/jackson/.local/share/nvim/ripgrep/")
vim.env.PATH = vim.env.PATH .. ":" .. os.getenv("HOME") .. "/.local/share/nvim/ripgrep"
