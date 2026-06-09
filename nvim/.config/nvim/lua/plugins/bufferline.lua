return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	opts = {
		options = {
			mode = "buffers",
			diagnostics = "nvim_lsp",
			separator_style = "slant",
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},

	config = function(_, opts)
		require("bufferline").setup(opts)
		vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
		vim.keymap.set(
			"n",
			"<leader>bP",
			"<Cmd>BufferLineGroupClose ungrouped<CR>",
			{ desc = "Delete Non-Pinned Buffers" }
		)
		vim.keymap.set("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete Buffers to the Right" })
		vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Delete Buffers to the Left" })
		vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
		vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
		vim.keymap.set("n", "<C-PageUp>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
		vim.keymap.set("n", "<C-PageDown>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
		vim.keymap.set("n", "[B", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer prev" })
		vim.keymap.set("n", "<<", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer prev" })
		vim.keymap.set("n", "]B", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer next" })
		vim.keymap.set("n", ">>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer next" })
	end,
}
