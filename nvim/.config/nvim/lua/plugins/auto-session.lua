return {
	"rmagatti/auto-session",
	opts = {
		log_level = "error", -- Para não poluir suas mensagens
		auto_session_enable_last_session = false, -- Carrega a última sessão se o nvim for aberto sem argumentos
		auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/", -- Onde salvar os arquivos de sessão
	},
}
