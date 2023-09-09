local opts = { noremap = true, silent = false}
-- noremap 不会重新映射
-- silent 不会输出多余信息
local map = vim.api.nvim_set_keymap


-- test vim.api.nvim_set_keymap('n', '<Leader>h', ':help<CR>', opts);

--map('n', '<A-h>', '<c-w>h', opts);
--map('n', '<A-j>', '<c-w>j', opts);
--map('n', '<A-k>', '<c-w>k', opts);
--map('n', '<A-l>', '<c-w>l', opts);
--map('n', '<A-w>', '<c-w>w', opts);

--map("n", "<C-Down>", ":resize +2<CR>", opts)
--map("n", "<C-Up>", ":resize -2<CR>", opts)
--map('n', '<C-Left>', ":vertical resize +2<CR>", opts);
--map('n', '<C-Right>', ":vertical resize -2<CR>", opts);


