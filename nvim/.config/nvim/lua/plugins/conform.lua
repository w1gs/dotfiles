return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>ff",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "Format buffer with conform",
			},
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff" },
					javascript = { "prettierd", "prettier" },
					bash = { "shfmt" },
				},
				notify_on_error = true,
				format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
				formatters = {
					shfmt = {
						prepend_args = { "-i", "4", "-ci" },
					},
				},
			})
		end,
	},
}
