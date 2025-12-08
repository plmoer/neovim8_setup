return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- Web / frontend
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },

        -- Lua
        lua = { "stylua" },

        -- Python
        python = { "isort", "black" },

        -- Go
        go = { "gofmt", "goimports" },

        -- Rust
        rust = { "rustfmt" },

        -- C / C++ / Obj-C
        c = { "clang_format" },
        cpp = { "clang_format" },
        objc = { "clang_format" },

        -- Java
        java = { "google_java_format" },

        -- Kotlin
        kotlin = { "ktlint" },

        -- PHP
        php = { "php_cs_fixer" },

        -- Ruby
        ruby = { "rubocop" },

        -- Swift
        swift = { "swiftformat" },

        -- Shell
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },

        -- SQL
        sql = { "sqlfluff" },

        -- TOML
        toml = { "taplo" },

        -- XML
        xml = { "xmlformat" },

        -- Docker
        dockerfile = { "dockfmt" },

        -- Proto
        proto = { "buf" },

        -- Misc
        nix = { "nixfmt" },
      },

      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    -- Manual format keybind
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
