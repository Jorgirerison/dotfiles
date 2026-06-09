return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			local keymap = vim.keymap.set

			gitsigns.setup() -- Configura o plugin primeiro

			-- Navegação
			keymap("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					gitsigns.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Próxima alteração Git" })

			keymap("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					gitsigns.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Alteração Git anterior" })

			-- Suas teclas
			keymap("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
			keymap("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Blame" })
		end,
	},
}
