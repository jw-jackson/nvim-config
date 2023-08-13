-- dap 
-- 1. 配置 Adapter 配置加载那个调试器以及如何加载
-- 2. 配置 Configuration 

local dap = require('dap')
local home = os.getenv("HOME")

-- C
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- !!! 此处必须用全路径
    command = home..'/.local/share/nvim/mason/bin/codelldb',
    -- command = '/home/jackson/.local/share/nvim/mason/bin/codelldb',
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

-- If you want to use this debug adapter for other languages, you can re-use the configurations:
dap.configurations.c = dap.configurations.cpp


-- nvim-dap-ui Setup and Configuration
require("dapui").setup()

-- 自动加载和关闭
local dapui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

