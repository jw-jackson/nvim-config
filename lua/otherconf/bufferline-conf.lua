--keymapping*******************************************************************
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }
map("n", "<A-b>", ':BufferLineCycleNext<CR>', opts);
map("n", "<A-B>", ':BufferLineCyclePrev<CR>', opts);
map("n", "<Leader>bc", ':BufferLinePickClose<CR>', opts);
map('n', '<Leader>bp', ':BufferLineTogglePin<CR>', opts);
map('n', '<C-h>', ':BufferLineMovePrev<CR>', opts);
map('n', '<C-l>', ':BufferLineMoveNext<CR>', opts);
-- map('n', '<c-w>', ':bdelete<CR>', opts);
--*****************************************************************************

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
