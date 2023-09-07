local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end
    },
    sources = cmp.config.sources({
        -- nvim_lsp 需要配置 lsp server
        { name = 'nvim_lsp' },
        { name = 'path' },
        {
            name = 'luasnip',
            option = { show_autosnippets = true }
        },
        { name = 'buffer' },
        --{ name = 'cmdline' }
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
}

-- `/` cmdline setup.
--cmp.setup.cmdline('/', {
    --mapping = cmp.mapping.preset.cmdline(),
    --sources = {
        --{ name = 'buffer' }
    --}
--})
-- `:` cmdline setup.
--cmp.setup.cmdline(':', {
    --mapping = cmp.mapping.preset.cmdline(),
    --sources = cmp.config.sources({
        --{ name = 'path' }
    --}, {
        --{
            --name = 'cmdline',
            --option = {
                --ignore_cmds = { 'Man', '!' }
            --}
        --}
    --})
----})
