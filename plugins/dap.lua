return {

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
    }
    ,

    {
        --Debugger user interface{
            "rcarriga/nvim-dap-ui",
            config = function()
                require('dapconf.nvim-dap-ui-conf')
            end,
            lazy = true,
        },
    }
