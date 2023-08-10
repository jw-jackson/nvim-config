-- dsp 
-- 1. 配置 Adapter 配置加载那个调试器以及如何加载
-- 2. 配置 Configuration 

local dap = require('dap')

-- C
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- !!! 此处必须用全路径
    command = '/home/jackson/.local/share/nvim/mason/bin/codelldb',
    -- command = '~/.local/share/nvim/mason/bin/codelldb',
    args = {"--port", "${port}"},
    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

--[[
dap.adapters.cppdbg = {
    id = "cppdbg",
    type = 'executable',
    -- command = "/User/jason/.local/share/nvim/mason/bin/OpenDebugAD7",
    command = "/Users/jason/.local/share/nvim/mason/bin/OpenDebugAD7",
}
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,

        cwd = "${workspaceFolder}",
        stopAtEntry = true,
    },
}
--]]

-- If you want to use this debug adapter for other languages, you can re-use the configurations:
dap.configurations.c = dap.configurations.cpp
