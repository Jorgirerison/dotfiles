-- api global de lua pode ser chamado com 'vim.'
-- tabela onde cada chave é uma opção do Vim
local opt = vim.opt
local add = vim.filetype.add

-- reconher log como arquivo
add({
	extension = {
		log = "log",
		-- Aqui você pode adicionar outras no futuro
		conf = "conf",
		env = "sh",
	},
})

-- differentiating djangoTemplate from html
add({
	extension = {
		html = function(path, bufnr)
			-- Lê as primeiras 50 linhas do arquivo (pra não pesar em arquivos gigantes)
			local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 50, false)
			for _, line in ipairs(lines) do
				-- Se encontrar tags de template Django/Jinja
				if line:match("{%%") or line:match("{{") or line:match("{#") then
					return "htmldjango"
				end
			end
			-- Se não achar nada, mantém como html puro
			return "html"
		end,
	},
})

-- Opções boleanas
-- Ativa a exibição de caracteres invisíveis
opt.list = true
-- Define os "marcadorsinhos"
opt.listchars = {
	eol = "¬", -- (Opcional) Uma seta indicando a quebra de linha (Enter)
	tab = "  ", -- (Opcional) Uma seta indicando a quebra de linha (Enter)
}
opt.relativenumber = true -- linhas relativas (meu maior xodó)
opt.expandtab = true -- substitui o tab por espaços
-- opção ligada ao matchtime
-- (default)
-- opt.showmatch = false -- opção relacionada ao destaque no fechamento do parentese
opt.number = true -- Mostra os números das linhas
opt.cursorline = true -- Habilita o destaque da linha do cursor

-- Se quiser destacar APENAS o número (e não a linha inteira, para não poluir):
opt.cursorlineopt = "number"
-- Opções funcionais
opt.mouse = ""

-- Opções de texto
opt.termguicolors = true -- Habilita cores de 24-bit no terminal
opt.wrap = true -- Quebra linha para o conteúdo ficar todo na tela
opt.linebreak = true -- Palavras que não cabem na tela serão colocadas na próxima linha
opt.incsearch = true

-- Opçoẽs numéricas
-- NEORG --
-- opção para esconder o caminho dos links
opt.conceallevel = 2
opt.tabstop = 2
-- opção abaixo descreve o tempo de 0.5 s
-- ao escrever o fechamento de um parentese o cursor
-- teleporta automaticamente para o primeiro
-- parentese quando showmatch está ativo
-- (default)
-- opt.matchtime = 5

-- devido a opção abaixo
-- keymaps de identação em keymaps.lua
-- afim de identar no modo de inserção
opt.shiftwidth = 2 -- Tamanho da indentação (para >>, <<)

opt.tabstop = 2 -- largura do tab
opt.numberwidth = 5 -- largura do espaçamento da numeração das linhas
opt.scrolloff = 3 -- limita o cursor quando scrollar

vim.diagnostic.config({
	virtual_text = true, -- mostra o erro em linha
	signs = true, -- mostra ícones na lateral
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})

vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/.venv/bin/python3")
