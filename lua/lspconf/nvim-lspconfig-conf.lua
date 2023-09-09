vim.lsp.set_log_level(vim.log.levels.INFO)



-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--keymapping*******************************************************************
-- Global Mappings
local opts = { noremap = true, silent = false }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)



-- https://github.com/neovim/nvim-lspconfig/wiki/Multiple-language-servers-FAQ
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local common_on_attach = function(client, bufnr)
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
    --vim.keymap.set('n', '<Leader>f', ':%!clang-format<CR>', bufopts)
end
--*************************************************************************************************

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()




local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}



-- 连接到 clangd 服务器
require 'lspconfig'.clangd.setup {
    on_attach = function(client, bufnr)
        common_on_attach(client, bufnr)
        { noremap = true, silent = false, buffer = bufnr }
        --vim.keymap.set('n', '<Leader>f', ':%!clang-format<CR>', { noremap = true, silent = false, buffer = bufnr })
    end,
    capabilities = capabilities,
    flags = lsp_flags,
}


-- 连接到 lua_ls 服务器
require 'lspconfig'.lua_ls.setup {
    -- solve undefined global 'vim'
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
    on_attach = function(client, bufnr)
        common_on_attach(client, bufnr)
        --vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end,
            --{ noremap = true, silent = false, buffer = bufnr })
    end,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            }
        }
    },
}


require 'lspconfig'.marksman.setup {}
require 'lspconfig'.bashls.setup {}
--*************************************************************************************************
