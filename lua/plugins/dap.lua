return {

    {
        "mfussenegger/nvim-dap",
        config = function()
        end,
        lazy = true,
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
            end,
            lazy = true,
        },
    }
