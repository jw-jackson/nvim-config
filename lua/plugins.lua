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

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
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

    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            vim.env.OPENAI_API_KEY = "sk-RNycOuFn91F914abA706T3BLbKFJ75fdA60EDF7A495c9738"
            --vim.env.OPENAI_API_KEY = "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"
            vim.env.OPENAI_API_HOST = "aigptx.top"
            --api.ohmygpt
            --cn2us02.opapi.win
            --cfwus02.opapi.win
            -- sk-vGgVAN4s398D6BdC9eCcT3BlBkFJe5Ff551d552d409C8A20
            -- sk-yPFSDAUv203f0e807672T3BlbKFJ3904Aa14B25143B493Fd
            vim.keymap.set('n', '<C-a>', "<cmd>ChatGPT<CR>", {})
            require("chatgpt").setup({
                yank_register = "\"",
                openai_params = {
                    --model = "gpt-4",
                    --model = "gpt-3.5-turbo-16k-0613",
                    model = "gpt-4-0613",
                    --model = "gpt-3.5-turbo-16k",
                    frequency_penalty = 0,
                    presence_penalty = 0,
                    max_tokens = 1000,
                    temperature = 0.2,
                    top_p = 1,
                    n = 1,
                },
                popup_window = {
                    border = {
                        highlight = "FloatBorder",
                        style = "rounded",
                        text = {
                            top = " note ",
                        },
                    },
                },
                popup_input = {
                    border = {
                        text = {
                            top_align = "center",
                            --top = " Prompt ",
                            top = " grep ",
                        },
                    }
                }
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        config = function()
            require('wkconf.which_key_conf')
        end
    },
    {
        'simrat39/symbols-outline.nvim',
        config = function()
            require('outline.symbols_outline')
        end
    }

}
