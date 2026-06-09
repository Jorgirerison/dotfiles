-- Grupo para organizar nossos autocmds
local my_autocmds = vim.api.nvim_create_augroup("MyAutocmds", { clear = true })
-- clear = true é para evitar que os comandos sejam duplicados

-- LSP FORMAT automático
vim.api.nvim_create_autocmd("BufWritePre", { -- Evento: "Antes de um buffer ser escrito (salvo)"
	group = my_autocmds, -- Associamos ao nosso grupo
	pattern = { "*.lua", "*.md", "*.py" }, -- Padrão: python, lua e markdown
	callback = function() -- Ação: Uma função Lua
		vim.lsp.buf.format({ async = false }) -- Comando para formatar o buffer
	end,
	desc = "Formata arquivos python,lua e markdown ao salvar",
})
