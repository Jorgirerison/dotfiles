return {
	"jakewvincent/mkdnflow.nvim",
	ft = { "markdown", "rmd" },
	config = function()
		require("mkdnflow").setup({
			-- Configuração de caminhos que você já tinha
			path_resolution = {
				primary = "current",
				fallback = "current",
			},

			-- Desativa o mapeamento padrão do Tab para devolver o Ctrl + i
			mappings = {
				MkdnNextLink = false,
				MkdnPrevLink = false,
			},

			-- Configuração do Cabeçalho/Template
			new_file_template = {
				enabled = true,
				-- O template em si. Você pode usar formatação YAML no topo.
				template = [[
---
titulo: {{ title }}
data: {{ date }}
tags: []
---

# {{ title }}

]],
				-- Lógica para substituir as variáveis no template acima
				placeholders = {
					title = function(ctx)
						-- Tenta usar o título do link criado. Se não houver, usa o nome do arquivo [cite: 154]
						return ctx.link_title or ctx.filename or vim.fn.expand("%:t:r")
					end,
					date = function()
						-- Pega a data atual do sistema
						return os.date("%Y-%m-%d")
					end,
				},
			},
		})
	end,
}
