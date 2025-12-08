return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",

  config = function()
    -- Disable netrw (recommended)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local nvimtree = require("nvim-tree")

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
        preserve_window_proportions = true,
      },

      renderer = {
        highlight_git = true,
        highlight_opened_files = "name",

        indent_markers = {
          enable = true,
        },

        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- collapsed
              arrow_open = "", -- expanded
            },
          },
        },
      },

      actions = {
        open_file = {
          resize_window = true,
          window_picker = { enable = false },
        },
      },

      filters = {
        custom = { ".DS_Store" },
      },

      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },

      update_focused_file = {
        enable = true,
        update_root = false,
      },
    })

    -------------------------------------------------------------------
    -- Keymaps
    -------------------------------------------------------------------
    local map = vim.keymap.set

    map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Reveal current file in explorer" })
    map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse all folders" })
    map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
  end,
}
