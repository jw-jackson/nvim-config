require("mason-lspconfig").setup {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
    -- This setting has no relation with the `automatic_installation` setting. 还有一个默认选项是 automatic_installation 这俩没关系
    -- 这个 list 在官网可见 server name
    -- clangd 是 C/C++ 的 server name
    -- dap is not support
    ensure_installed = { "lua_ls", "clangd", "marksman" },
}
