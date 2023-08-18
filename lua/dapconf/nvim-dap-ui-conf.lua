-- nvim-dap-ui Setup and Configuration
require("dapui").setup
{
controls = {
  element = "repl",
  enabled = true,
  icons = {
    pause = "pause",
    play = "˃",
    step_into = "↓",
    step_over = "→",
    step_out = "↑",
    step_back = "←",
    run_last = "R",
    terminate = "■",
    disconnect = "disconnecte",
  }
},
element_mappings = {},
expand_lines = true,
floating = {
  border = "single",
  mappings = {
    close = { "q", "<Esc>" }
  }
},
force_buffers = true,
icons = {
  collapsed = "▸",
  current_frame = "2",
  expanded = "▾"
},
layouts = { {
    elements = { {
        id = "scopes",
        size = 0.25
      }, {
        id = "breakpoints",
        size = 0.25
      }, {
        id = "stacks",
        size = 0.25
      }, {
        id = "watches",
        size = 0.25
      } },
    position = "left",
    size = 40
  }, {
    elements = { {
        id = "repl",
        size = 0.5
      }, {
        id = "console",
        size = 0.5
      } },
    position = "bottom",
    size = 10
  } },
mappings = {
  edit = "e",
  expand = { "<CR>", "<2-LeftMouse>" },
  open = "o",
  remove = "d",
  repl = "r",
  toggle = "t"
},
render = {
  indent = 1,
  max_value_lines = 100
}
}

-- 自动加载和关闭
local dapui = require("dapui")
local dap = require('dap')
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

function DapuiClose()
    dapui.close()
end
vim.api.nvim_command('command! DapuiClose lua DapuiClose()')
