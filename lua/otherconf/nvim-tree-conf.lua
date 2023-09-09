

require("nvim-tree").setup {
    auto_reload_on_write = true,
    renderer = {
        icons = {
            show = {
                file = false,
                folder = false,
                folder_arrow = false,
                git = false,
                modified = false
            }
        }
    }
}
