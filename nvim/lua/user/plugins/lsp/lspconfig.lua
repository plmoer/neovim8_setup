return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },

  config = function()
    ---------------------------------------------------------------------------
    -- Imports
    ---------------------------------------------------------------------------
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    ---------------------------------------------------------------------------
    -- LSP capabilities (for completion & snippets)
    ---------------------------------------------------------------------------
    local capabilities = cmp_nvim_lsp.default_capabilities()

    ---------------------------------------------------------------------------
    -- Keymaps (global, applied for each attached LSP)
    ---------------------------------------------------------------------------
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        local function map(mode, lhs, rhs, desc)
          opts.desc = desc
          keymap.set(mode, lhs, rhs, opts)
        end

        -- Navigation
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Go to definitions")
        map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Go to implementations")
        map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Go to type definitions")
        map("n", "gR", "<cmd>Telescope lsp_references<CR>", "Show references")

        -- Actions
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code actions")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")

        -- Diagnostics
        map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer diagnostics")
        map("n", "<leader>d", vim.diagnostic.open_float, "Line diagnostics")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

        -- Docs
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")

        -- LSP
        map("n", "<leader>rs", ":LspRestart<CR>", "Restart LSP")
      end,
    })

    ---------------------------------------------------------------------------
    -- Diagnostic signs
    ---------------------------------------------------------------------------
    local signs = {
      Error = " ",
      Warn = " ",
      Hint = "󰠠 ",
      Info = " ",
    }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      vim.diagnostic.config()
    end

    vim.diagnostic.config({
      virtual_text = true,
      severity_sort = true,
      float = {
        border = "rounded",
      },
    })

    ---------------------------------------------------------------------------
    -- Servers explicitly enabled
    ---------------------------------------------------------------------------
    local servers = {
      "pyright",
      "html",
      "cssls",
      "bashls",
      "lua_ls",
    }

    ---------------------------------------------------------------------------
    -- Mason LSP Auto Setup
    ---------------------------------------------------------------------------
    mason_lspconfig.setup({
      ensure_installed = servers,
    })

    mason_lspconfig.setup_handlers({

      -------------------------------------------------------------------------
      -- Default server setup
      -------------------------------------------------------------------------
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,

      -------------------------------------------------------------------------
      -- Custom: Svelte
      -------------------------------------------------------------------------
      ["svelte"] = function()
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,

      -------------------------------------------------------------------------
      -- Custom: GraphQL
      -------------------------------------------------------------------------
      ["graphql"] = function()
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = {
            "graphql",
            "gql",
            "svelte",
            "typescriptreact",
            "javascriptreact",
          },
        })
      end,

      -------------------------------------------------------------------------
      -- Custom: Emmet
      -------------------------------------------------------------------------
      ["emmet_ls"] = function()
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = {
            "html",
            "css",
            "scss",
            "sass",
            "less",
            "typescriptreact",
            "javascriptreact",
            "svelte",
          },
        })
      end,

      -------------------------------------------------------------------------
      -- Custom: Lua
      -------------------------------------------------------------------------
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })

    ---------------------------------------------------------------------------
    -- Pyright performance tuning (optional)
    ---------------------------------------------------------------------------
    lspconfig.pyright.setup({
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    })
  end,
}
