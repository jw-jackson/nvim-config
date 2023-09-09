local wk = require("which-key")


local builtin = require('telescope.builtin')
wk.register({
  ["<leader>"] = {
    f = {
      name = "+Telescope",
        f = {builtin.find_files, "find files"},
      --f = { "<cmd>Telescope find_files<cr>", "Find File" },
        l = {builtin.live_grep, "live grep"},
        b = {builtin.buffers, "buffers"},
        h = {builtin.help_tags, "help tags"},
        t = {builtin.tags, "tags"},
        s = {builtin.treesitter, "treesitter"},
        c = {builtin.commands, "commands"},
        a = {builtin.autocommands, "autocommands"},
        g = {builtin.grep_string, "grep string"},
        m = {builtin.marks, "marks"},
        p = {builtin.pickers, "pickers"},
        r = {builtin.registers, "registers"}

    },
  },
})




--[[
弃用
改用内置设置
--
wk.register({
    ["<leader>"] = {
        w = {
            name = "+window",
            s = {":sp<CR>","split window"},
            v = {"<cmd>vsp<cr>","vertical split window"}
        }

    }
})
--map('n', '<Leader>wv', ':vsp<CR>', opts);
--map('n', '<Leader>ws',':sp<CR>', opts);
]]--




-- Terminal
wk.register({
    ["<leader>"] = {
        t = {
            name = "+Terminal",
            s = {":sp | terminal<CR>","split terminal"},
            v = {":vsp | terminal<cr>","vertical split terminal"}
        }

    }
})
--local opts = { noremap = true, silent = false}
-- noremap 不会重新映射
-- silent 不会输出多余信息
--local map = vim.api.nvim_set_keymap

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = false})
--map("t", "<A-w>h", [[ <C-\><C-N><C-w>h ]], opts)
--map("t", "<A-w>j", [[ <C-\><C-N><C-w>j ]], opts)
--map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opts)
--map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opts)



-- noremap 不会重新映射
-- silent 不会输出多余信息
--map('n', '<A-t>', ':NvimTreeToggle<CR>', opts)

-- 快键 < 500 ms生效
wk.register({
    ["<leader>n"] = {":NvimTreeToggle<CR>", "NvimTree"},
})
wk.register({
    ["<leader>n"] = {
        name = "NvimTree",
        f = {":NvimTreeFindFile<CR>", "NvimTreeFindFile"}

    }
})


--Bufferline
--[[
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = false }
map("n", "<A-b>", ':BufferLineCycleNext<CR>', opts);
map("n", "<A-B>", ':BufferLineCyclePrev<CR>', opts);
map("n", "<Leader>bc", ':BufferLinePickClose<CR>', opts);
map('n', '<Leader>bp', ':BufferLineTogglePin<CR>', opts);
--map('n', '<C-h>', ':BufferLineMovePrev<CR>', opts);
--map('n', '<C-l>', ':BufferLineMoveNext<CR>', opts);
-- map('n', '<c-w>', ':bdelete<CR>', opts);
]]--
wk.register({
    ["<A-l>"] = {':BufferLineCycleNext<CR>','BufferLineNext'},
    ["<A-h>"] = {':BufferLineCyclePrev<CR>','BufferLinePrev'},
    ["<A-j>"] = {':BufferLineMoveNext<CR>','BufferLineMoveNext'},
    ["<A-k>"] = {':BufferLineMovePrev<CR>','BufferLineMovePrev'},
})
-- fast < 500ms
wk.register({
    ["<leader>b"] = {":BufferLinePick<CR>", "BufferLinePick"}
})
wk.register({
    ["<leader>b"] = {
        name = "BufferLine",
        c = {":BufferLinePickClose<CR>", "PickClose"},
        p = {":BufferLineTogglePin<CR>", "TogglePin"},
        h = {":BufferLineCloseLeft<CR>", "CloseLeft"},
        l = {":BufferLineCloseRight<CR>", "CloseRight"},
        o = {":BufferLineCloseOthers<CR>", "CloseOthers"}

    }
})


