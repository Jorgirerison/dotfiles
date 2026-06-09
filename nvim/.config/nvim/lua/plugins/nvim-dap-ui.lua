return {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		-- Adicionado para facilitar a integração com Python
		"mfussenegger/nvim-dap-python",
	},
	opts = {
		-- Mantive seus controles e layouts originais
		controls = {
			element = "repl",
			enabled = false,
			icons = {
				disconnect = "",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = "",
			},
		},
		layouts = {
			{
				elements = {
					{ id = "scopes", size = 0.50 },
					{ id = "stacks", size = 0.30 },
					{ id = "watches", size = 0.10 },
					{ id = "breakpoints", size = 0.10 },
				},
				size = 40,
				position = "left",
			},
			{
				elements = { "repl", "console" },
				size = 10,
				position = "bottom",
			},
		},
		-- ... outros opts que você já tinha
	},
	config = function(_, opts)
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup(opts)

		-- Estilização dos Breakpoints (Mantida)
		vim.api.nvim_set_hl(0, "DapStoppedHl", { fg = "#98BB6C", bg = "#2A2A2A", bold = true })
		vim.api.nvim_set_hl(0, "DapStoppedLineHl", { bg = "#204028", bold = true })
		vim.fn.sign_define(
			"DapStopped",
			{ text = "", texthl = "DapStoppedHl", linehl = "DapStoppedLineHl", numhl = "" }
		)
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

		-- Listeners para abrir o UI automaticamente
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end

		------------------------------------------------------------------
		-- CONFIGURAÇÃO PYTHON / DJANGO
		------------------------------------------------------------------

		-- Se você usa venv, o nvim-dap-python tenta encontrar o python automaticamente
		-- Troque o caminho abaixo pelo caminho do seu interpretador global ou do venv principal
		require("dap-python").setup("python")

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Django: Run Server",
				program = "${workspaceFolder}/manage.py",
				args = { "runserver", "--noreload" },
				django = true,
				console = "integratedTerminal",
			},
			{
				type = "python",
				request = "attach",
				name = "Django: Attach Docker",
				connect = { port = 5678, host = "127.0.0.1" },
				pathMappings = {
					{ localRoot = "${workspaceFolder}", remoteRoot = "/app" },
				},
			},
		}

		-- Keymaps (Mantidos e organizados)
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]AP: [C]ontinuar" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]AP: Toggle [B]reakpoint" })
		vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "[D]AP: Step Over" })
		vim.keymap.set("n", "<leader>dk", dap.step_into, { desc = "[D]AP: Step Into" })
		vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "[D]AP: Step Out" })
		vim.keymap.set("n", "<leader>dX", dap.terminate, { desc = "[D]AP: Terminar" })
		vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "[D]AP: [U]I Toggle" })
	end,
}
