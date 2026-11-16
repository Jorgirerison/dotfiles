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
    })
  end,
}
