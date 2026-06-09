return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local map = vim.keymap.set

			null_ls.setup({
				sources = {
					-- formatters
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.biome,
					null_ls.builtins.formatting.prettier,
					-- null_ls.builtins.formatting.black,
					-- null_ls.builtins.formatting.isort,

					-- diagnostics
					require("none-ls.diagnostics.eslint"), -- <- substituição correta aqui
					-- require("none-ls.diagnostics.flake8"), -- <- substituição correta aqui

					-- DJANGO ADDED
					null_ls.builtins.formatting.djlint.with({
						extra_args = { "--indent", "2", "--profile", "django" },
					}), -- (indentação)
					null_ls.builtins.diagnostics.djlint, --(fechamento de tags)
				},
			})

			-- Grupo de comandos para LSP (Language Server Protocol)
			map("n", "<leader>lf", vim.lsp.buf.format, { desc = "[l]SP [f]ormat" })
			map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "[l]SP [r]ename" })

			-- Grupo de comandos para Diagnostics
			map("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "[d]iagnostic [p]revious" })
			map("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "[d]iagnostic [n]ext" })
			map("n", "<leader>de", vim.diagnostic.open_float, { desc = "[d]iagnostic [e]rror details" })
			map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "[d]iagnostic [l]ist" })
		end,
	},
}
