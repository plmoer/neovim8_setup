-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = false, silent = true }
--window manipulation keybindings
keymap("n", "<C-h>", "<C-w>h", { noremap = false })
keymap("n", "<C-j>", "<C-w>j", { noremap = false })
keymap("n", "<C-k>", "<C-w>k", { noremap = false })
keymap("n", "<C-l>", "<C-w>l", { noremap = false })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", opts)

-- delete single character without copying into register
-- keymap("n", "x", '"_x', opts)

-- -- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- select all
-- keymap("n", "C-a", "gg<S-v>G", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "p", '"_dP', opts)

keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = false })
keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = false })
keymap("i", "<C-j>", "<esc>:m .+1<CR>==", { noremap = false })
keymap("i", "<C-k>", "<esc>:m .-2<CR>==", { noremap = false })
keymap("n", "<leader>j", ":m .+1<CR>==", { noremap = false })
keymap("n", "<leader>k", ":m .-2<CR>==", { noremap = false })

keymap("n", "<F6>", ":setlocal spell! spelllang=en_us<CR>", { noremap = false })

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- toggle file explorer

-- telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- find files within current working directory, respects .gitignore
keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts) -- find string in current working directory as you type
keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts) -- find string under cursor in current working directory
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts) -- list open buffers in current neovim instance
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", opts) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts) -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts) -- list current changes per file with diff preview ["gs" for git status]

-- mapping for Markdown Preview
keymap("n", "<leader>mp", "<CMD> MarkdownPreview<CR>", { desc = "Open Preview" })
keymap("n", "<leader>mc", "<CMD> MarkdownPreviewStop<CR>", { desc = "Close Preview" })
