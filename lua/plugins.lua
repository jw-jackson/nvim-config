return
{
    {
        'akinsho/bufferline.nvim',
        version = "*",
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
    },

    {
        --Debugger user interface{
        "rcarriga/nvim-dap-ui",
        config = function()
            require('dapconf.nvim-dap-ui-conf')
        end,
        lazy = false,
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
        config = function()

        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
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
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require('otherconf.indent-blankline-conf')
        end


    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require('cmpconf.nvim-cmp-conf')
        end

    },
    {
        'hrsh7th/cmp-path',
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'L3MON4D3/LuaSnip'
    },
    {
        'saadparwaiz1/cmp_luasnip'
    },
    {
        'hrsh7th/cmp-buffer'
    },
    {
        'hrsh7th/cmp-cmdline'
    },
    {
        "Borwe/wasm_nvim"
    },
}
