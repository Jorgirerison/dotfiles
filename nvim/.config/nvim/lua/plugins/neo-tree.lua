return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>e", function()
			require("neo-tree.command").execute({
				source = "filesystem", -- Para garantir que estamos na aba "filesystem"
				toggle = true, -- O segredo: "alternar" (abrir/fechar)
				reveal = true, -- Revela o arquivo atual (só funciona ao abrir)
			})
		end, { desc = "Neotree: Alternar e Revelar" })
	end,
}
