return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- Ou "<2.0.0" para evitar mudanças que quebram a compatibilidade
		dependencies = { "3rd/image.nvim" }, -- Molten depende de image.nvim para imagens
		build = ":UpdateRemotePlugins", -- Comando a ser executado após a instalação/atualização
		init = function()
			-- vim.g.molten_virt_lines_off_by_1 = true
			vim.g.molten_auto_open_output = false
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20 -- Ajuste conforme sua preferência
			vim.g.molten_virt_text_output = true
		end,
		config = function()
			vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
			vim.keymap.set(
				"n",
				"<localleader>e",
				":MoltenEvaluateOperator<CR>",
				{ silent = true, desc = "run operator selection" }
			)
			vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
			vim.keymap.set(
				"n",
				"<localleader>rr",
				":MoltenReevaluateCell<CR>",
				{ silent = true, desc = "re-evaluate cell" }
			)
			vim.keymap.set(
				"v",
				"<localleader>r",
				":<C-u>MoltenEvaluateVisual<CR>gv",
				{ silent = true, desc = "evaluate visual selection" }
			)
			vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
			vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
			vim.keymap.set(
				"n",
				"<localleader>os",
				":noautocmd MoltenEnterOutput<CR>",
				{ silent = true, desc = "show/enter output" }
			)
			vim.api.nvim_create_autocmd("User", {
				pattern = "MoltenInitPost",
				callback = function()
					-- quarto code runner mappings
					local r = require("quarto.runner")
					vim.keymap.set("n", "<localleader>rc", r.run_cell, { desc = "run cell", silent = true })
					vim.keymap.set("n", "<localleader>ra", r.run_above, { desc = "run cell and above", silent = true })
					vim.keymap.set("n", "<localleader>rb", r.run_below, { desc = "run cell and below", silent = true })
					vim.keymap.set("n", "<localleader>rA", r.run_all, { desc = "run all cells", silent = true })
					vim.keymap.set("n", "<localleader>RA", function()
						r.run_all(true)
					end, { desc = "run all cells of all languages", silent = true })
				end,
			})
		end, -- Adicione se precisar de setup específico do Molten
	},
	-- {
	--   -- image.nvim: plugin para renderizar imagens no Neovim
	--   -- Consulte o README do image.nvim para mais informações sobre como configurar este plugin.
	--   "3rd/image.nvim",
	--   opts = {
	--     backend = "kitty", -- Escolha o backend que deseja usar (ex: "kitty", "ueberzug", "iterm", etc.)
	--     -- "kitty" funciona bem se você usa o terminal Kitty.
	--     -- IMPORTANTE: Defina max_width e max_height para evitar que imagens grandes travem o terminal!
	--     max_width = 100, -- Ajuste para a largura máxima desejada para as imagens
	--     max_height = 12, -- Ajuste para a altura máxima desejada para as imagens

	--     -- Necessário para o Molten renderizar janelas de saída nas dimensões corretas
	--     max_height_window_percentage = math.huge,
	--     max_width_window_percentage = math.huge,

	--     window_overlap_clear_enabled = true, -- Limpa imagens quando janelas se sobrepõem
	--     window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
	--   },
	--   -- O guia recomenda fixar a versão do image.nvim para maior estabilidade com Molten.
	--   -- Exemplo: version = "Seu_tag_ou_commit_preferido_do_image.nvim"
	-- },
}
