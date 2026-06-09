-- Colocamos essa função global para que o Neovim consiga chamá-la na interface.
-- Ela calcula a porcentagem e o tempo restante em tempo real.
_G.kindle_stats = function()
  local wc = vim.fn.wordcount()
  if wc.words == 0 then return "" end -- Se o arquivo estiver vazio, não mostra nada
  
  -- Cálculo do Tempo Restante (Média de leitura: 200 palavras por minuto)
  local words_left = wc.words - wc.cursor_words
  local wpm = 200 
  local mins_left = math.ceil(words_left / wpm)
  
  -- Cálculo da Porcentagem da Página
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')
  local pct = math.floor((current_line / total_lines) * 100)
  
  -- Formata a string alinhada à direita (%=), com uma cor discreta (%#Comment#)
  return string.format("%%= %%#Comment# %d%%%%  •  ~%d min restantes ", pct, mins_left)
end

return {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Alternar Zen Mode"},
  },
  config = function()
    require("zen-mode").setup({
      window = {
        width = 60, 
        options = {
          number = false,         
          relativenumber = false, 
          cursorline = false,     
          colorcolumn = "",       
          -- Aqui entra a mágica do Kindle: 
          -- Cria uma barra no topo da janela APENAS durante o Zen Mode
          winbar = "%{%v:lua.kindle_stats()%}",
        }
      },
      plugins = {
        gitsigns = { enabled = false },
        tmux = { enabled = false },
      }
    })
  end
}
