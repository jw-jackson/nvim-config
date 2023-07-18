-- 启用 vim-airline 插件
require('vim-airline').setup({
  -- 主题
  theme = 'wombat',

  -- 显示分隔符
  show_dividers = true,

  -- 分隔符符号
  divider_symbol = '',

  -- 显示文件编码
  encoding = 'utf-8',

  -- 显示 Git 状态
  extensions = {
    'fugitive',
  },
})
