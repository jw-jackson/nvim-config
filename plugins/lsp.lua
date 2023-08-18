return {
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
        "hrsh7th/nvim-cmp",
        -- load cmp on InsertEnter
        event = "InsertEnter",
        -- these dependencies will only be loaded when cmp loads
        -- dependencies are always lazy-loaded unless specified otherwise
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            -- vsnip
            'hrsh7th/cmp-vsnip', -- { name = 'vsnip' }
            'hrsh7th/vim-vsnip',
            'rafamadriz/friendly-snippets',
            -- lspkind
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-path'
        },
        config = function()
            -- ...
            local lspkind = require('lspkind')
            local cmp = require 'cmp'

            cmp.setup {
                -- 指定 snippet 引擎
                snippet = {
                    expand = function(args)
                        -- For `vsnip` users.
                        vim.fn["vsnip#anonymous"](args.body)

                        -- For `luasnip` users.
                        -- require('luasnip').lsp_expand(args.body)

                        -- For `ultisnips` users.
                        -- vim.fn["UltiSnips#Anon"](args.body)

                        -- For `snippy` users.
                        -- require'snippy'.expand_snippet(args.body)
                    end,
                },
                -- 来源
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    -- For vsnip users.
                    { name = 'vsnip' },
                    -- For luasnip users.
                    -- { name = 'luasnip' },
                    --For ultisnips users.
                    -- { name = 'ultisnips' },
                    -- -- For snippy users.
                    -- { name = 'snippy' },
                }, { { name = 'buffer' },
                    { name = 'path' }
                }),

                -- 快捷键
                --mapping = require 'keybindings'.cmp(cmp),
                mapping = cmp.mapping.preset.insert({
                  ['<C-j>'] = cmp.mapping.select_next_item(),
                  ['<C-k>'] = cmp.mapping.select_prev_item(),
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  --['<C-I>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                -- 使用lspkind-nvim显示类型图标
                formatting = {
                    format = lspkind.cmp_format({
                        with_text = true, -- do not show text alongside icons
                        maxwidth = 50,    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        before = function(entry, vim_item)
                            -- Source 显示提示来源
                            vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                            return vim_item
                        end
                    })
                },
            }

            -- Use buffer source for `/`.
            cmp.setup.cmdline('/', {
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':'.
            cmp.setup.cmdline(':', {
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end,
    },


}
