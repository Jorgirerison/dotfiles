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
# {{ title }}
*Tags: #*

## 🗂️ Legenda de Classificação
* **[Story] Funcionalidade:** Desenvolvimento planejado (ex: nova tela, automação nova).
* **[Task] Técnica:** Manutenção de bastidores (ex: atualizar ambiente, refatorar código).
* **[Bug] Falha:** Quebra de produção (ex: erro no fluxo de aprovação).
* **[Request] Suporte:** Atendimentos operacionais e rotina corporativa (ex: liberação de acessos).
* **[Spike] Pesquisa:** Estudos e buscas de informação geral (ex: pesquisar mercado, ler docs).
* **[Pessoal] Rotina:** Compromissos e vida fora do dev (ex: academia, finanças, casa).

# 🎯 Foco
(*Lembre-se que ao dia você só pode no máximo planejar 14 pomodoros na melhor das hipóteses*)
- [ ] [Story] [Power Bi]
- [ ] [Task] [Sharepoint]

## 🚧 Interrupções / Não Planejado
(*Anotar aqui qualquer coisa que tentar roubar sua atenção durante um ciclo, geralmente Bugs e Requests vão cair muito aqui*)
- [ ] [Request] 
- [ ] [Bug]
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
