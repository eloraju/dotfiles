local opt = vim.o
opt.number = true -- line number
opt.relativenumber = true -- relative line numbers
opt.cursorline = true -- highlight current line
opt.wrap = false -- do not wrap lines by default
opt.scrolloff = 10 -- keep 10 lines above/below cursor
opt.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

opt.tabstop = 2 -- tabwidth
opt.shiftwidth = 2 -- indent width
opt.softtabstop = 2 -- soft tab stop not tabs on tab/backspace
opt.expandtab = true -- use spaces instead of tabs
opt.smartindent = true -- smart auto-indent
opt.autoindent = true -- copy indent from current line

opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- case sensitive if uppercase in string
opt.hlsearch = true -- highlight search matches
opt.incsearch = true -- show matches as you type

opt.signcolumn = "yes" -- always show a sign column
opt.colorcolumn = "100" -- show a column at 100 position chars
opt.showmatch = true -- highlights matching brackets
opt.cmdheight = 1 -- single line command line
opt.completeopt = "menuone,noinsert,noselect" -- completion options
opt.showmode = false -- do not show the mode, instead have it in statusline
opt.pumheight = 10 -- popup menu height
opt.pumblend = 10 -- popup menu transparency
opt.winblend = 0 -- floating window transparency
opt.conceallevel = 0 -- do not hide markup
opt.concealcursor = "" -- do not hide cursorline in markup
opt.lazyredraw = true -- do not redraw during macros
opt.synmaxcol = 300 -- syntax highlighting limit
opt.fillchars = { eob = " " } -- hide "~" on empty lines

local undodir = vim.fn.expand("~/.local/share/nvim/undodir")
if
	vim.fn.isdirectory(undodir) == 0 -- create undodir if nonexistent
then
	vim.fn.mkdir(undodir, "p")
end

opt.backup = false -- do not create a backup file
opt.writebackup = false -- do not write to a backup file
opt.swapfile = false -- do not create a swapfile
opt.undofile = true -- do create an undo file
opt.undodir = undodir -- set the undo directory
opt.updatetime = 300 -- faster completion
opt.timeoutlen = 500 -- timeout duration
opt.ttimeoutlen = 50 -- key code timeout
opt.autoread = true -- auto-reload changes if outside of neovim
opt.autowrite = false -- do not auto-save

opt.hidden = true -- allow hidden buffers
opt.errorbells = false -- no error sounds
opt.backspace = "indent,eol,start" -- better backspace behaviour
opt.autochdir = false -- do not autochange directories
opt.iskeyword:append("-") -- include - in words
opt.path:append("**") -- include subdirs in search
opt.selection = "inclusive" -- include last char in selection
opt.mouse = "a" -- enable mouse support
opt.clipboard:append("unnamedplus") -- use system clipboard
opt.modifiable = true -- allow buffer modifications
opt.encoding = "utf-8" -- set encoding

-- Folding: requires treesitter available at runtime; safe fallback if not
opt.foldmethod = "expr" -- use expression for folding
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
opt.foldlevel = 99 -- start with all folds open

opt.splitbelow = true -- horizontal splits go below
opt.splitright = true -- vertical splits go right

opt.wildmenu = true -- tab completion
opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
opt.diffopt:append("linematch:60") -- improve diff display
opt.redrawtime = 10000 -- increase neovim redraw tolerance
opt.maxmempattern = 20000 -- increase max memory
