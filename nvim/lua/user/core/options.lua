HOME = os.getenv("HOME")
local opt = vim.opt

-- -------------------------------------------------------
-- Leader keys
-- -------------------------------------------------------
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- -------------------------------------------------------
-- UI Appearance (TokyoNight Optimized)
-- -------------------------------------------------------
opt.termguicolors = true            -- REQUIRED for tokyonight
opt.background = "dark"             -- always dark
opt.cursorline = true               -- highlight current line

opt.number = true                   -- absolute line numbers
-- opt.relativenumber = true        -- enable if you like hybrid numbers

opt.signcolumn = "yes"              -- consistent sign column
opt.laststatus = 3                  -- global statusline (looks better w/ tokyonight)
opt.showcmd = false                 -- cleaner command area
opt.showmode = false                -- lualine handles the mode
opt.wrap = false                    -- don't wrap lines
opt.scrolloff = 5                   -- keep screen context
opt.sidescrolloff = 5

-- Show matching brackets
opt.showmatch = true
opt.matchtime = 2

-- Disable listchars for cleaner colors
opt.list = false

-- -------------------------------------------------------
-- Tabs & Indentation
-- -------------------------------------------------------
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true
opt.formatoptions = "qnj1"

-- -------------------------------------------------------
-- Search
-- -------------------------------------------------------
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- -------------------------------------------------------
-- Folds
-- -------------------------------------------------------
opt.foldenable = false
opt.foldlevel = 4
opt.foldmethod = "syntax"

-- -------------------------------------------------------
-- Files, Backup, Undo
-- -------------------------------------------------------
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.undodir = HOME .. "/.cache/nvim/undo"

-- -------------------------------------------------------
-- Clipboard
-- -------------------------------------------------------
opt.clipboard:append("unnamedplus")

-- -------------------------------------------------------
-- Splits
-- -------------------------------------------------------
opt.splitright = true
opt.splitbelow = true

-- -------------------------------------------------------
-- Misc Settings
-- -------------------------------------------------------
opt.encoding = "utf-8"
opt.history = 1000
opt.completeopt = "menuone,noselect"
opt.startofline = true
opt.errorbells = false
opt.numberwidth = 2
opt.synmaxcol = 300 -- performance

-- keyword improvement (useful in coding)
opt.iskeyword:append("-")

-- improve command-line completion
opt.wildignore =
  "deps,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc"
