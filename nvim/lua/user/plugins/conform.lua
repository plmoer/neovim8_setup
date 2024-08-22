require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		lua = { "stylua" },
		nix = { "nixfmt" },
		python = { "autopep8" },
		c = { "clang-format" },
		cpp = { "clang-format" },
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
	}),
	-- vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	-- 	conform.format({
	-- 		lsp_fallback = true,
	-- 		async = false,
	-- 		timeout_ms = 1000,
	-- 	})
	-- end, { desc = "Format file or range (in visual mode)" }),
})
