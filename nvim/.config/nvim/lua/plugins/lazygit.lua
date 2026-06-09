return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- Dependência opcional para integração com Telescope (se você usar)
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- Essa função roda quando o plugin carrega
		vim.g.lazygit_floating_window_scaling_factor = 0.9 -- (opcional) tamanho da janela

		-- CORREÇÃO DO LAG:
		-- Cria um autocomando que desliga os mappings quando entra no lazygit
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "lazygit",
			callback = function()
				-- Desativa o mapeamento jj/jk APENAS nesse buffer
				local opts = { buffer = true, nowait = true }
				vim.keymap.set("t", "jj", "jj", opts)
				vim.keymap.set("t", "jk", "jk", opts)
				-- Se você usa jk, adicione aqui também
			end,
		})
	end,
	-- Configuração das teclas (Keymaps)
}
