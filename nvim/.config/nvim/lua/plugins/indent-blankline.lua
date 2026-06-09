return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		-- 1. Definimos APENAS o highlight azul que vamos usar
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
		end)

		-- 2. Chamamos a configuração do plugin
		require("ibl").setup({
			-- Configuração para as linhas inativas (continua igual)
			indent = {
				char = "│",
			},
			-- Configuração para o escopo ativo (com as nossas mudanças)
			scope = {
				enabled = true,
				-- Usamos apenas a string "RainbowBlue", em vez da tabela de cores
				highlight = "RainbowBlue",
				char = "┃",
				show_start = false,
				show_end = false,
			},
		})
	end,
}
