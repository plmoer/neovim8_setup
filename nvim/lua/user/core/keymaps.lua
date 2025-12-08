-- Set leader key
vim.g.mapleader = " "

local keymap = vim.keymap.set

-- Insert mode
keymap("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

-- Searching
keymap("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Number increment/decrement
keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Window splits
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Equalize split sizes" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Tabs
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
keymap("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Next tab" })
keymap("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Previous tab" })
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open buffer in new tab" })
