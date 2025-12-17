return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },

  config = function()
    ---------------------------------------------------------------------------
    -- Capabilities
    ---------------------------------------------------------------------------
    local capabilities =
      require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

    ---------------------------------------------------------------------------
    -- LspAttach keymaps
    ---------------------------------------------------------------------------
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local map = function(mode, lhs, rhs, desc)
          opts.desc = desc
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gd", vim.lsp.buf.definition, "Definition")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "gt", vim.lsp.buf.type_definition, "Go to type definition")
        map("n", "gR", vim.lsp.buf.references, "Go to references")
        -- map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        -- map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Definitions")
        -- map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Implementations")
        -- map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Type definitions")
        -- map("n", "gR", "<cmd>Telescope lsp_references<CR>", "References")

        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")

        map("n", "<leader>d", vim.diagnostic.open_float, "Line diagnostics")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")

        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP")
      end,
    })

    ---------------------------------------------------------------------------
    -- Diagnostics
    ---------------------------------------------------------------------------
    vim.diagnostic.config({
      virtual_text = true,
      severity_sort = true,
      float = { border = "rounded" },
    })

    ---------------------------------------------------------------------------
    -- Mason (installation only)
    ---------------------------------------------------------------------------
    local servers = {
      "pyright",
      "html",
      "cssls",
      "bashls",
      "lua_ls",
      "svelte",
      "graphql",
      "emmet_ls",
    }

    require("mason-lspconfig").setup({
      ensure_installed = servers,
    })

    ---------------------------------------------------------------------------
    -- Native LSP configuration (NEW API)
    ---------------------------------------------------------------------------

    -- Default
    for _, server in ipairs(servers) do
      vim.lsp.config(server, {
        capabilities = capabilities,
      })
    end

    -- Lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          completion = { callSnippet = "Replace" },
        },
      },
    })

    -- Svelte
    vim.lsp.config("svelte", {
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

    -- GraphQL
    vim.lsp.config("graphql", {
      capabilities = capabilities,
      filetypes = {
        "graphql",
        "gql",
        "svelte",
        "typescriptreact",
        "javascriptreact",
      },
    })

    -- Emmet
    vim.lsp.config("emmet_ls", {
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

    ---------------------------------------------------------------------------
    -- Enable all configured servers
    ---------------------------------------------------------------------------
    vim.lsp.enable(servers)
  end,
}
