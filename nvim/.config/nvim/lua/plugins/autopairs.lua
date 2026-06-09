return {
  'windwp/nvim-autopairs',
  -- Opcional: defina um evento para carregar o plugin.
  -- 'InsertEnter' é uma boa escolha para que ele só seja ativado
  -- quando você entrar no modo de inserção, otimizando o tempo de inicialização.
  event = "InsertEnter",
  -- Opcional: configure o plugin
  opts = {} -- Deixe vazio para usar as configurações padrão
  -- Ou, se quiser configurar:
  -- opts = {
  --   check_ts = true, -- Usa o treesitter para verificar o contexto
  --   ts_config = {
  --     lua = {'string'},-- Desativa para strings no Lua
  --     javascript = {'template_string'}, -- Desativa para template strings no JS
  --     java = false, -- Desativa para Java
  --   }
  -- }
}
