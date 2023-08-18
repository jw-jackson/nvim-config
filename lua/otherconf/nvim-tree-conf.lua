--keymapping*******************************************************************
local opts = { noremap = true, silent = false}
-- noremap 不会重新映射
-- silent 不会输出多余信息
local map = vim.api.nvim_set_keymap
map('n', '<A-t>', ':NvimTreeToggle<CR>', opts)
--*****************************************************************************


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

