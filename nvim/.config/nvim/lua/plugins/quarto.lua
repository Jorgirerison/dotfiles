return {
	{ -- require plugins in lua/plugins/treesitter.lua and lua/plugins/lsp.lua
		"quarto-dev/quarto-nvim",
		dev = false,
		opts = {
			lspFeatures = {
				enabled = true,
				chunks = "curly",
			},
			codeRunner = {
				enabled = true,
				default_method = "molten",
			},
		},
		dependencies = {
			-- for languagens features in code cells
			-- configured in lua/plugins/lsp.lua
			"jmbuhr/otter.nvim",
		},
	},
	{
		"GCBallesteros/jupytext.nvim",
		config = function()
			require("jupytext").setup({
				style = "quarto",
				force_ft = "quarto",
				extension = "qmd",
			})
		end,
	},
}
