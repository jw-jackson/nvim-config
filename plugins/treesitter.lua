return{
{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        require('otherconf.nvim-treesitter-conf')
    end
 }
 }

