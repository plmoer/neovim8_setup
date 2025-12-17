return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    -- Core Mason
    local mason = require("mason")

    -- LSP support
    local mason_lspconfig = require("mason-lspconfig")

    -- Formatters / Linters / DAP installers
    local mason_tool_installer = require("mason-tool-installer")

    ------------------------------------------------------------------------
    -- Mason UI
    ------------------------------------------------------------------------
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    ------------------------------------------------------------------------
    -- LSP Servers to install automatically
    ------------------------------------------------------------------------
    mason_lspconfig.setup({
      ensure_installed = {
        -- Web / Frontend
        "html",
        "cssls",
        "emmet_ls",
        "tailwindcss",
        "graphql",
        "prismals",

        -- Python
        "pyright",

        -- Lua
        "lua_ls",

        -- Add more if needed:
        "ts_ls",
        -- "svelte",
        -- "bashls",
        -- "jsonls",
      },
    })

    ------------------------------------------------------------------------
    -- Formatters / Linters (Conform.nvim + LSP + Diagnostics)
    ------------------------------------------------------------------------
    mason_tool_installer.setup({
      ensure_installed = {

        -- Web / JS / TS
        "prettier",
        "eslint_d",

        -- Lua
        "stylua",

        -- Python
        "black",
        "isort",
        "pylint",

        -- Add if needed by other languages:
        -- "gofmt", "goimports",
        -- "rustfmt",
        -- "shfmt",
        -- "xmlformatter",
        -- "sqlfluff",
      },
    })
  end,
}
