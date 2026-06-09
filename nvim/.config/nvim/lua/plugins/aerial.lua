return {
	"stevearc/aerial.nvim",
	-- Opcional, mas recomendado para ícones e extração via Treesitter
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	-- Configura o atalho e faz o "lazy load" do plugin apenas quando você apertar as teclas
	keys = {
		{ "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Abrir/Fechar Sumário (Aerial)" },
	},
	config = function()
		require("aerial").setup({
			-- Prioridade de onde ele vai extrair os títulos
			backends = { "treesitter", "lsp", "markdown", "asciidoc" },

			layout = {
				-- Define a lateral direita como padrão
				default_direction = "right",
				-- "edge" garante que ele empurre tudo e fique no canto da tela
				placement = "edge",
				-- Define uma largura fixa confortável para ler os nomes das funções
				width = 0.5,
				min_width = 0.5,
			},

			-- Filtro: Se você não quiser ver variáveis, apenas funções e classes
			filter_kind = {
				"Class",
				"Constructor",
				"Enum",
				"Function",
				"Interface",
				"Module",
				"Method",
				"Struct",
			},
		})
	end,
}
