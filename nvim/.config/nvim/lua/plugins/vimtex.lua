return {
	{
		"lervag/vimtex",
		lazy = false,
		config = function()
			-- Linux: "zathura", macOS: "skim", Multiplataforma: "sioyek"
			vim.g.vimtex_view_method = "zathura"

			-- Ativa a compilação automática a cada salvamento
			vim.g.vimtex_compiler_latexmk = {
				continuous = 1,
			}
		end,
	},
}
