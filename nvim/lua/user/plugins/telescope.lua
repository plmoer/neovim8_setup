return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "folke/trouble.nvim",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local trouble = require("trouble.sources.telescope")

    telescope.setup({
      defaults = {
        path_display = { "smart" },

        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            -- send selections to quickfix then open Trouble
            ["<C-q>"] = function(...)
              actions.send_selected_to_qflist(...)
              require("trouble").open("quickfix")
            end,

            -- open Trouble for the current Telescope picker
            ["<C-t>"] = trouble.open,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -------------------------------------------------------------------
    -- Keymaps
    -------------------------------------------------------------------
    local map = vim.keymap.set

    map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
    map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
    map("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Search text" })
    map("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Search word under cursor" })
    map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Search TODOs" })
  end,
}
