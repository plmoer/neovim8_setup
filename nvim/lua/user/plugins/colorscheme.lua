-- return {
--   "morhetz/gruvbox",  -- Gruvbox colorscheme plugin
--   priority = 1000,
--   config = function()
--     vim.o.background = "dark"  -- or "light" for a lighter version
--     vim.cmd([[hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f]])
--     vim.cmd([[hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f]])
--     vim.cmd([[hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f]])
--     vim.cmd([[hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f]])

--     vim.cmd("colorscheme gruvbox")  -- Apply the colorscheme
--   end,
-- }
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night",
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      functions = { bold = true },
      keywords = { italic = true },
      sidebars = "dark",
      floats = "dark",
    },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd("colorscheme tokyonight")
  end,
}
