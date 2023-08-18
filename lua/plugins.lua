return
{
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('otherconf.bufferline-conf')
        end,
    },


    {
        "mfussenegger/nvim-dap",
        config = function()
            require('dapconf.nvim-dap-conf')
        end,
        lazy = false,
        dependencies =
        {
            "rcarriga/nvim-dap-ui",
        },
    },

    {
        --Debugger user interface{
        "rcarriga/nvim-dap-ui",
        config = function()
            require('dapconf.nvim-dap-ui-conf')
        end,
        lazy = true,
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = function()
            require('lspconf.mason-conf')
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require('lspconf.mason-lspconfig-conf')
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require('lspconf.nvim-lspconfig-conf')
        end

    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()

        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require('otherconf.nvim-tree-conf')
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require('otherconf.nvim-treesitter-conf')
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telecsopeconf.telescope-conf')
        end
    },
    { "lukas-reineke/indent-blankline.nvim",
        config = function()
                require('otherconf.indent-blankline-conf')
        end


        },


}
