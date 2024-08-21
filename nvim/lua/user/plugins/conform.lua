require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black", "autopep8"},
    ["*"] = { "codespell" },
    -- clang = {"clang--format"},
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
  vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
	-- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	-- 	conform.format({
	-- 		lsp_fallback = true,
	-- 		async = false,
	-- 		timeout_ms = 1000,
	-- 	})
	-- end, { desc = "Format file or range (in visual mode)" }),
})
