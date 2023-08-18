-- dap
-- 1. 配置 Adapter 配置加载那个调试器以及如何加载
-- 2. 配置 Configuration
local dap = require('dap')
local home = os.getenv("HOME")

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = home .. '/.local/share/nvim/mason/bin/OpenDebugAD7',
  --command = home .. '/.config/nvim/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    -- 这个是用来远程调试的，需要在远程机器上启动 gdbserver
    --name = 'Attach to gdbserver :1234',
    name = 'Attach to gdbserver :5678',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    --miDebuggerServerAddress = 'localhost:1234',
    miDebuggerServerAddress = 'localhost:5678',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}


dap.configurations.c = dap.configurations.cpp









-- keybindings
local opts = { noremap = true, silent = false}
-- noremap 不会重新映射
-- silent 不会输出多余信息

local map = vim.api.nvim_set_keymap



map('n','<F1>',':DapToggleBreakpoint<CR>', opts)

map('n','<F9>',':DapContinue<CR>', opts)
map('n','<F10>',':DapStepOut<CR>', opts)
map('n','<F11>',':DapStepInto<CR>', opts)
map('n','<F12>',':DapStepOver<CR>', opts)




-- codelldb
--[[
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

--]]
