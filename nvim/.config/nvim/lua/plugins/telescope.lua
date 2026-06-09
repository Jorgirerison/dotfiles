return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			-- Sugestão forte: Se puder, instale o fzf-native depois (veja nota abaixo)
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local map = vim.keymap.set

			-- Configuração GLOBAL do Telescope deve vir aqui
			telescope.setup({
				defaults = {
					-- Otimização visual para não poluir
					file_ignore_patterns = {
						"node_modules",
						".git",
						"venv",
						".venv",
						"%.env",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			-- Carrega a extensão ui-select
			telescope.load_extension("ui-select")

			-- --- KEYMAPS ---

			-- Busca no dir da config do Neovim
			map("n", "<leader>fg", function()
				builtin.live_grep({})
			end, { desc = "Buscar conteúdo dentro dos arquivos" })

			-- Busca no dir da config do Neovim
			map("n", "<leader>fc", function()
				builtin.find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end, { desc = "Buscar arquivos da config do Neovim" })

			-- A CORREÇÃO DO SEU PROBLEMA AQUI:
			map("n", "<leader>fp", function()
				builtin.find_files({
					-- Em vez de deixar o Lua filtrar, mandamos o 'ripgrep' já entregar limpo.
					-- Isso é MUITO mais rápido pois o disco nem lê a pasta venv.
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob",
						"!**/.git/*",
						"--glob",
						"!**/venv/*",
						"--glob",
						"!**/__pycache__/*",
						"--glob",
						"!**/.mypy_cache/*", -- Remove o cache do MyPy (sua imagem)
						"--glob",
						"!**/.pytest_cache/*", -- Já previne o cache de testes
						"--glob",
						"!**/.ruff_cache/*", -- Previne cache do Ruff (se usar)
						"--glob",
						"!**/.idea/*",
						"--glob",
						"!**/.vscode/*",
					},
				})
			end, { desc = "Buscar na raiz do projeto (Otimizado)" })
		end,
	},
}
