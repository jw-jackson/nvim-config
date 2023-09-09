
vim.opt.termguicolors = true
require("bufferline").setup {

        options = {
            indicator = {
                --icon = '', -- this should be omitted if indicator style is not 'icon'
                --style = 'icon' | 'underline' | 'none',
                style =  'underline',
            },
            buffer_close_icon = 'X',
            modified_icon = '•',
            close_icon = 'x',
            left_trunc_marker = '←',
            right_trunc_marker = '→',
        }
}
