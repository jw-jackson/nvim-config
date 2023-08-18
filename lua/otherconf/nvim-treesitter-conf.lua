local configs = require("nvim-treesitter.configs")

configs.setup({
    ensure_installed = { "c", "lua", "markdown" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
