HOME = os.getenv("HOME")
local opt = vim.opt -- for conciseness

-- line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
-- opt.relativenumber = false -- show relative line numbers

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- basic settings
opt.encoding = "utf-8"
opt.backspace = "indent,eol,start" -- backspace works on every char in insert mode
opt.completeopt = "menuone,noselect"
opt.history = 1000
-- opt.dictionary = '/usr/share/dict/words'
opt.startofline = true

-- Mapping waiting time
opt.timeout = false
opt.ttimeout = true
opt.ttimeoutlen = 100

opt.errorbells = false

-- Display
opt.showmatch = true -- show matching brackets
opt.scrolloff = 3 -- always show 3 rows from edge of the screen
opt.synmaxcol = 300 -- stop syntax highlight after x lines for performance
opt.laststatus = 2 -- always show status line

opt.list = false -- do not display white characters
opt.foldenable = false
opt.foldlevel = 4 -- limit folding to 4 levels
opt.foldmethod = "syntax" -- use language syntax to generate folds
opt.wrap = false --do not wrap lines even if very long
opt.eol = false -- show if there's no eol char
opt.showbreak = "↪" -- character to show when line is broken

-- Sidebar
opt.numberwidth = 2 -- always reserve 3 spaces for line number
opt.signcolumn = "yes" -- keep 1 column for coc.vim  check
opt.modelines = 0
opt.showcmd = true -- display command in bottom bar

-- Search
opt.incsearch = true -- starts searching as soon as typing, without enter needed
opt.ignorecase = true -- ignore letter case when searching
opt.smartcase = true -- case insentive unless capitals used in search

opt.matchtime = 2 -- delay before showing matching paren
opt.mps = vim.o.mps .. ",<:>"

-- White characters
opt.autoindent = true
opt.smartindent = true
opt.tabstop = 2 -- 1 tab = 2 spaces
opt.softtabstop = 2
opt.shiftwidth = 2 -- indentation rule
opt.formatoptions = "qnj1" -- q  - comment formatting; n - numbered lists; j - remove comment when joining lines; 1 - don't break after one-letter word
opt.expandtab = true -- expand tab to spaces

-- Backup files
opt.backup = true -- use backup files
opt.writebackup = false
opt.swapfile = false -- do not use swap file
opt.undodir = HOME .. "/.vim/tmp/undo//" -- undo files
opt.backupdir = HOME .. "/.vim/tmp/backup//" -- backups
opt.directory = "/.vim/tmp/swap//" -- swap files

-- Commands mode
opt.wildmenu = true -- on TAB, complete options for system command
opt.wildignore =
	"deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc"

opt.background = "dark"
--vim.g.material_style = "palenight"
opt.cursorline = true
--opt.termguicolors = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word
