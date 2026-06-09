return {
	{ -- for lsp features in code cells / embedded code
		"jmbuhr/otter.nvim",
		dev = false,
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp = vim.lsp

			lsp.config("ts_ls", {
				capabilities = capabilities,
			})
			lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", lsp.buf.definition, { desc = "[g]o to [definition]"})
			vim.keymap.set("n", "<leader>gr", lsp.buf.references, { desc = "[g]o to [references]"})
			vim.keymap.set("n", "<leader>ca", lsp.buf.code_action, { desc = "[c]ode [a]ction"})
		end,
	},
	-- CONFIG ANTIGA QUE USAVA PARA CONFIGURAR O JAVA
	-- NÃO USAR
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	dependencies = {
	-- 		"williamboman/mason-lspconfig.nvim",
	-- 		-- Plugins opcionais, mas úteis, do vídeo
	-- 		{ "j-hui/fidget.nvim", opts = {} }, --
	-- 		{ "folke/neodev.nvim", opts = {} }, --
	-- 	},
	-- 	config = function()
	-- 		local lspconfig = require("lspconfig")
	-- 		local capabilities = require("cmp_nvim_lsp").default_capabilities()

	-- 		-- Configuração automática de LSPs instalados pelo Mason
	-- 		require("mason-lspconfig").setup({
	-- 			-- Função que roda para cada servidor
	-- 			function(server_name)
	-- 				-- Ignora o 'jdtls' para configuração manual em outro lugar
	-- 				if server_name ~= "jdtls" then
	-- 					lspconfig[server_name].setup({
	-- 						capabilities = capabilities,
	-- 					})
	-- 				end
	-- 			end,
	-- 		})
	-- },
}
