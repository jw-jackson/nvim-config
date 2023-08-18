# VIM guide

## Search

1. `/`
2. input
3. `Enter`
4. `n` 向下，`N` 向上

`noh` `nohlsearch`来清空搜索后的高亮

搜索当前词汇`*` `#` 

强制忽略大小写的另一种方法是在搜索模式后附加`\c`。 例如，`/Linux\c`执行忽略大小写搜索。 模式强制大小写匹配搜索之后的大写`\C`。





# 配置过程



# init.lua

初始化设置文件，neovim 会在 `~/.config/nvim/init.lua` 读取配置文件。

`checkhealth` 检查配置问题

**Python 3 provider**

* 按照建议使用`:help provider-python`查看建议
* 需要安装`pynvim` module

**其他的 optional provider warning 可以不管**



**使用 lua**

Lua 模块通常位于 `runtimepath` 中的 `lua/` 文件夹中。

`~/.config/nvim/after` 就是其中一个 `runtimepath`	

`runtimepath` 中的一些特殊目录中的 lua 文件会被自动加载，如`plugin/`...



**在 VImscript 中使用 lua**

`:lua ....`



**加载 lua 文件**

* `:luafile`
* `:sourece`
* `:rntime`

`%` 表示当前正在处理的文件`so %` 



**命令加载和 require()**



**Vim命名空间**

Neovim 会暴露一个全局的 `vim` 变量作为 Lua 调用 Vim API 的入口。它还提供给用户一些额外的函数和子模块“标准库”。

一些比较实用的函数和子模块如下：

- `vim.inspect`: 把 Lua 对象以更易读的方式打印（在打印 Lua table 时会很有用）
- `vim.regex`: 在 Lua 中使用 Vim 正则表达式
- `vim.api`: vim 暴露的 API (`:h API`) 模块（别的远程调用也是调用同样的 API)
- `vim.ui`: 可被插件覆写的 UI 相关函数
- `vim.loop`: Neovim 的 event loop 模块（使用 LibUV)
- `vim.lsp`: 控制内置 LSP 客户端的模块
- `vim.treesitter`: 暴露 tree-sitter 库中一些实用函数的模块

上面列举功能的并不全面。如果你想知道更多可行的操作可以参见：[`:help lua-stdlib`](https://neovim.io/doc/user/lua.html#lua-stdlib) 和 [`:help lua-vim`](https://neovim.io/doc/user/lua.html#lua-vim)。你也可以通过 `:lua print(vim.inspect(vim))` 获得所有可用模块。API 函数的详细文档请参见 [`:help api-global`](https://neovim.io/doc/user/api.html#api-global)



**管理 Vim 的设置选项**

两种方法：

* 使用 api 函数
* 使用元访问器



**插件基本都需要启动，theme貌似不需要**

























# nvim config

* 解决主题显示问题，不使用 macos 自带的 terminal 终端，改为 iterm2
* Your terminal emulator must be configured to use that font, usually "Hack Nerd Font"
* 安装字体 (nerd-fonts)[https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts]

* 语法高亮，使用 treesitter 插件


# LSP
Language Server Protocol
在出现之前，各家编辑器各做各的语法识别功能，互补相同，该协议抽象了语法识别，让编辑器可以专心做编辑器的功能，语法识别部分大家都一样。其运作过程为编辑器通过协议向语言服务器发送请求，获得语法识别。因此，要使用此功能，我们的编辑器必须是支持 LSP 的客户端，显然 neovim 是支持的，其次还要有服务器，这部分需要我们自己搭建。至于我们常见的大型 ide ，其服务器都是内嵌的，我们无需安装。

**nvim 需要的插件**
* nvim-lspconfig This is only a collection of LSP configs.也就是说这个插件的作用就是为我们的 nvim lsp client 提供 配置文件的，它的意义就是帮我们简化配置过程。
* mason.nvim Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters. 可以见的这个插件的作用是为了提供 LSP server。在其 出现之前该插件的作者创建了 nvim-lsp-installer，但是这个项目已经停止维护了，转而开发更高级的 mason.vim
* mason-lspconfig.nvim 按照常理有了client protocol server 就已经足够了，但是mason.nvim 和 lspconfig 之间的协调也是问题，因此提供了此插件。mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.

**配置过程**
1. 配置 masson
2. 配置 masson-lspconfig 在这里添加需要的服务器
3. 连接到服务器 use `:lua print(vim.inspect(vim.lsp.buf_get_clients()))` 查看连接情况

```lua
require'lspconfig'.clangd.setup{}
```









# DAP
Debug Adapter Protocol 是一种协议。

使用 Masson 可以安装 DAP server。



## nvim-dap 

It is a Debug Adapter Protocol client implement for Neovim

* Launch an application to debug
* Attach to running applications and debug them
* Set breakpoints and step through code
* Inspect the state of the application



## nvim-dap-ui
A UI for nvim-dap



## C++

这里只是借用 debug tools，可执行程序运行时是不依赖源代码的，但是调试的时候想让调试器能够准确的知道当前在源码的位置并且能够显示当前变量的值，这个时候需要在可执行程序中打包符号表。







# Map



## \<leader> mapleader 前缀键

Vim 内置许多快捷键，再加上各类插件的快捷键，大量快捷键出现在单层空间中难免会冲突。为了解决该问题，引入了前缀键盘 `<leader>`。

藉由前缀键， 则可以衍生出更多的快捷键命名空间（namespace)。

使用指令 `help <Leader>` 可以查看帮助。







# Document

`CTRL ]` `CTRL O`

`:ta {subject}` `CTRL-t`

**Get specific help**

`:help command`



## intro



### Notation



## Helphelp



### Help commands

`:h[elp]` `<F1>` `i_<F1>`

`i_` 也就是在 insert mode 按 `<F1>` 也可以。



`^V`可以代替`CTRL-V`

`[count]`可有的数字前缀，默认为 1，例如`20 V`是可视 20 行。









**Vim可视模式**

* v 字符文本
* V 行文本
* \<Ctrl-v> 块文本



**快捷键移动**
G 跳转到文件最后一行
gg 跳转到文件首行
$ 跳转到行末尾



# Vim 实用技巧

## Vim 解决问题的方式

### 技巧 1 结识 . 命令

**. 命令重复上一次修改**

**. 命令是一个微型的宏 macro**

### 技巧 2 不要自我重复

**减少不必要的重复**

`$`是将光标移动到行尾部，而 `a` 是在光标后插入，

将这两个操作进行封装得到 `A`。



### 技巧 3 以退为进

**使修改可重复**

```
int a = b+c+d+e+f;
// 想要加入空格在加号两边
// 先退一步
f+s
删除+
重新键入space+space
;.
```

```
;			Repeat latest f, t, F or T [count] times. See |cpo-;|
```





### 技巧 4 执行、重复、回退

对于`.`我们可以使用`u`回退

对于`;`我们可以使用`,`回退

还有其他的重复操作及如何回退可在书籍中查询







### 技巧 5 查找并手动替换

`:%s/ab/cd/g`会把全局的 `ab` 替换成 `cd`

但有时候部分 ab 是我们不想替换的，这个时候我们需要无需输入就可以进行查找

这个时候就需要使用`*`命令

```
/content or 光标定位到 ab
*
cwcd<ESC>
n
.
```

`cw` 会删除从光标开始到单词结束的所有字符并进入插入模式

```
* Search forward for the [count]'th occurrence of the word nearest to the cursor. 
n	Repeat the latest "/" or "?" [count] times.

```



### 技巧 6 结识 . 范式

总结上面技巧，可得

**理想模式：用一键移动，另一键执行**



## 普通模式



### 技巧 7 停顿时请移开画笔

思考，阅读以及在代码中穿梭浏览时请回到 Normal 模式



### 技巧 8 把撤销单元切成块
反撤销 `CTRL-r`
`u`键会撤销命令，它会撤销最新的修改。其中包括普通模式、可视模式以及命令行模式中所触发的命令。其中一次插入中的所有操作都算作一次修改。
在 vim 中我们可以控制撤销操作的粒度，从插入模式开始，直到返回普通模式为止，这期间所有的操作都被当作一次修改。因此只要我们控制好对`<ESC>`的使用，就可以使撤销命令作用于单词，句子或段落。
在插入模式时光标位于行尾时另起一行最快的方式是`<CR>`，但我们可以使用`<Esc>o`。这样可以拥有更细的粒度。
NOTE：在插入模式移动光标会重置修改状态，简单理解就是先`<Esc>`再`h j k l`

### 技巧 9 构造可重复的修改
在 Vim 中完成一件事的方法不止一种
```
The end is nigh
```
光标位于 h 如何删除 nigh
反向删除`db x`
正向删除`b dw`
删除整个单词`daw` 这是使用更为精准的`aw`文本对象。
但是 `daw` 更胜一筹，因为其为一个操作。

### 技巧 10 用次数做简单的算术运算
很多普通模式命令都可以带一个 count 前缀，这样 Vim 就会把该命令执行指定次数，而不是一次.
`<Ctrl-a>` 和 '<Ctrl-x` 命令分别对数字执行加减操作，每次默认加 1 。前提是光标在数字上，不在会正向查找一个数字。
```
int a = 10;
```
将 10 改为 100
`90<Ctrl-a>`
007 的 后面是什么？答案是 010 。如果你对任意以 0 开头的数字使用`<C-a>`指令时，Vim 会把以 0 开头的数字解释为八进制，而不是十进制。`nrformats = `可以进行设置。

### 技巧 11 能够重复就别用次数
缓冲区的如下文字
```
Delete more than one word
```
假设要删除 more than
* `d2s`
* `2dw`
* `dw` `.`
使用第三种方法具有更细的粒度，而且不用计算次数。
**只在必要时使用次数**

### 技巧 12 双剑合璧 天下无敌
Vim 的强大之处很大程度上来源于操作符与动作命令的相结合。
`操作符 + 动作命令 = 操作`
`d{motion}`可以对一个字符dl 一个完成单词daw 一整个段落dap 进行操作。c y 以及其他的命令也类似，他们统称为**操作符 operator** 可以用`:h operator`来获得完成的列表。
`g~ gu gU`要两次按键来调用，我们可以把`g`当作一个前缀字符，用以改变其后面的按键行为，参考**操作服待决模式**
vim 的语法有一条额外的规则，即当一个操作符命令被连续调用两次时，它会作用于当前行。
Vim 的常见操作符命令
```
c
d
y
g~
gu
gU
>
<
=
!
```

**拓展命令组合的威力**
自定义操作符与已有命令协同工作，例如使用注释插件，可以使用`:h map-operator`查看自定义操作符

自定义动作命令与已有操作符协同工作，Vim 缺省的动作命令集已经相当全面了，但是我们还是可以定义新的动作命令及文本对象来进一步增强它。

**操作符待决模式Operator-Pending mode**

## 插入模式
尽管删除、复制以及粘贴命令都是在普通模式中执行的，不过我们有一种方便快捷的方式无需离开插入模式就能粘贴寄存器中的文本。
替换模式是插入模式的一种特例，它会替换文档中已有的字符。
我们也会结识插入-普通模式，它是一个子模式，可以让我们执行一个普通模式命令，之后又马上回到插入模式。
自动补全是插入模式才有的高级功能。

### 技巧 13 在插入模式中可及时更正错误
在插入模式下纠正错误没必要切回普通模式再进入插入模式。除了退格键我们还可以使用这些组合键
```
<C-h> 同退格键
<C-w> 删除前一个单词
<C-u> 删除至行首
```

### 技巧 14 返回普通模式
插入模式我们专注于输入文字，而普通模式是我们大部分时间都使用的模式。两者之前切换很重要，本节介绍如何快速切换减少切换带来的损耗。
最经典的就是`<Esc>`键，但是在许多键盘上这个键离得有点远我们可以使用`<C-[>`代替。
`<C-o>` 切换到插入-普通模式，我们在插入时想运行一个普通模式命令，然后立马回到原来的位置继续输入。为此 Vim 提供了一套方法。
插入-普通模式是普通模式的一个特例，它能让我们执行一次普通模式的命令。
`zz` 当当前行处于窗口顶部或底部时，我们需要滚动窗口，以看到更多的上下文，用此可以重绘屏幕使当前行处于屏幕正中间。

### 技巧 15 不离开插入模式，粘贴寄存器文本
在插入模式我们使用`<C-r>0`把寄存器中复制的文本复制到光标处。
这个命令的一般模式为`<C-r>{register}` 参见`:h i_CTRL-R`
如果寄存器中包含大量文本，你也许会发现屏幕更新会出现延迟。这是因为 Vim 在 插入寄存器内的文本时，其插入方式就如同这些文本是由键盘上一个一个输入的。因此如果`textwidth`和`autoindent`被激活的话，最终可能出现没必要的换行或额外的缩进。
`<C-r><C-p>{register}`可能会更智能一些，它会按原义插入寄存内的文本，并修正任何没必要的缩进，不过这个命令有点不太友好！


### 技巧 16 随时随地运算
表达式寄存器允许我们做运算并把运算结果直接插入到文档中。
大部分寄存器都是保存文本，而表达式寄存器是个另类，它用来执行一段vim 脚本，并返回其结果。
我们可以用 `=` 表明使用表达式寄存器。在 Insert Mode 输入`<C-R>=`就可以访问这一寄存器。
当然表达式寄存器能做的不止算术运算。


### 技巧 17 用字符编码插入非常用字符 
Vim 可以使用 Character Code 插入任意字符。
只要知道某个字符的编码，在 Insert Mode 中输入 `<C-v>{code>`即可。
Vim 接受的字符编码包含 3 位数。例如大写字母 A `<C-v>065`
假设我们要插入一个编码超过 3 位数的字符该怎么办。Unicode 的地址空间最大会有 65535 个字符，解决方法是**用 4 位十六进制编码来输入。`<C-v>u{00bf}`¿。
使用`:h i_CTRL-V_digit`查看更多帮助。
查询任意字符的编码，Normal Mode `ga`
`C-v`的反向用法，如果后面跟一个非数字键，它会插入这个按键本身所代表的字符。如果启用了`expandtab`选项，我们按下`<Tab>`键入的是空格而非制表符，但是`<C-v><Tab>`键入的一定是制表符。
`<C-v>{nondigit}`按原义插入非数字
`<C-k>{char1}{char2}`插入二合字母 char1 char2 表示的字符

### 技巧 18 用二合字母插入任意非常用字符
我们可以使用二合字母 digraph 来插入非常用字符。
`:h digraphs-default`文档帮助
`:digraphs` 查看可用二合字母列表
`: digraph-table`查看另一个更为有用的列表

### 技巧 19 用替换模式替换已有文档
替换模式中输入会替换文档中已有文本。
用`R`命令可以由普通模式进入替换模式。如果有`<Insert>`也可以在两种模式间进行切换。
```
abc
```
**用虚拟替换模式替换制表符**
某些字符会使替换模式变得复杂化。以制表符为例，在文件中它以单个字符表示，但在屏幕上他却会占若干列的宽度，此宽度由`tabstop`设置决定。
不过 Vim 还有一种替换模式，成为 Virtual Replace mode，该模式`gR`触发，它会把制表符当成一组空格进行处理。
`12341234`
尽量使用虚拟替换模式

## 可视模式
Vim 具有 3 种不同的可视模式，分别用于操作字符文本、行文本或块文本。

### 技巧 20 深入理解可视模式
某些可视模式命令执行的基本功能与普通模式相同，但操作上有细微的变化。例如在两种模式中`c`命令都是删除指定文本并切换到插入模式。不过要指定其所操作的范围，二者的方式却不相同。
在普通模式，我们先触发修改命令，然后使用动作命令指定其作用范围。这被称为操作符命令。
在可视模式，我们先选中选区，然后再触发修改命令。这种次序的颠倒对所有操作符都适用。
```
将 March 改为 April
两种方法，替换模式，选中删除
viw 选中 c 删除
March
iw 和 aw
aw 会选区空格
```

**结识选择模式**
在经典的编辑器中我们选择任意一段文本，再输入任意可见字符时，这些文本就会被可见字符替代，虽然 Vim 从未遵循此惯例，但是其选择模式 Select Mode 是按照此工作方式工作的。`:h Select-mode`
按`<C-g>`可以在可视模式和选择模式下切换，先进入可视模式再按。

### 技巧 21 选择高亮选区
`v`键是通往可视模式的大门。在普通模式，按`v`可激活面向字符的可视模式。
`V, <C-v>`
`gv`可以重选上一次高亮区域

**切换选区的活动端**
高亮选区的范围由两个端点界定，其中一个端点固定，另一端可以随光标自由移动。我们可以用`o`键来切换其活动的端点。
```
Select from here to here
vbb
b [counts] word backward 
o
e
e Forward to the end of word [count]

### 技巧 22 重复执行面向行的可视命令
**Tabs and Spaces** 主题详解了如何配置`shiftwidth``softtabstop`等选项。

**先缩进一次，然后重复**


### 技巧 23 
