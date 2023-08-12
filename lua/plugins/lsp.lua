return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
                -- This setting has no relation with the `automatic_installation` setting. 还有一个默认选项是 automatic_installation 这俩没关系
                -- 这个 list 在官网可见 server name
                -- clangd 是 C/C++ 的 server name
                -- dap is not support
                ensure_installed = { "lua_ls", "clangd", "marksman" },
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- lspconfig
            -- Mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            local opts = { noremap = true, silent = false}
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = false, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                --vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
                vim.keymap.set('n', '<Leader>f', ':%!clang-format-10<CR>', bufopts)
            end

            local lsp_flags = {
                -- This is the default in Nvim 0.7+
                debounce_text_changes = 150,
            }


            -- 连接到 clangd 服务器
            require 'lspconfig'.clangd.setup {
                on_attach = on_attach,
                flags = lsp_flags,
            }
            -- 连接到 lua_ls 服务器
            require 'lspconfig'.lua_ls.setup {

                -- solve undefined global 'vim'
                -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
                on_attach = on_attach,
                flags = lsp_flags,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        }
                    }
                },
            }

            require 'lspconfig'.marksman.setup {}
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
            'onsails/lspkind-nvim'
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
