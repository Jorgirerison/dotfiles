return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.install").prefer_git = true
		require("nvim-treesitter.configs").setup({
			-- Preenchendo chaves vazias para evitar bugs internos
			modules = {},
			sync_install = false,
			ignore_install = {},
			auto_install = true,

			-- O seu combo essencial
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"yaml",
				"htmldjango",
				"html",
				"python",
				"css",
				"javascript",
			},

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false, -- Desativa o sistema antigo para evitar conflitos
			},
			indent = {
				enable = true,
			},
		})
	end,
}
