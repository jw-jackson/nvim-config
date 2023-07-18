vim.opt.termguicolors = true

require("bufferline").setup {

    options =
    {
        offsets = {
            {
                filetype = "NvimTree",
                --text = "File Explorer" ,
                text = "Nvim-Tree",
                text_align = "left",
                separator = true
            }
        },
    }
}
