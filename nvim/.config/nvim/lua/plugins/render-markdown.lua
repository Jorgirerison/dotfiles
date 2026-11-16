return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "quarto" }, -- adiciona outros filetypes se quiser (ex: "codecompanion")
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons", -- ou "nvim-mini/mini.icons" se usar o mini.nvim
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    -- liga a renderização só no modo normal e em comando (não atrapalha enquanto edita)
    render_modes = { "n", "c" },

    -- é isso aqui que deixa as tabelas bonitas
    pipe_table = {
      enabled = true,
      preset = "round", -- bordas arredondadas (troque pra "none" se preferir configurar manual abaixo)
      style = "full",   -- "full" = desenha a tabela inteira com bordas | "normal" = só o header | "none" = sem bordas
      cell = "padded",  -- "padded" = alinha e dá respiro nas células | "raw" = sem alinhar | "overlay" = sobrepõe o texto original
      alignment_indicator = "━",
      border = { "┌", "┬", "┐", "├", "┼", "┤", "└", "┴", "┘", "│", "─" },
      head = "RenderMarkdownTableHead",
      row = "RenderMarkdownTableRow",
      filler = "RenderMarkdownTableFill",
    },

    -- opcional: se quiser só tabela bonita e deixar o resto (headings, code, etc) no padrão,
    -- pode ignorar tudo abaixo. Deixei como referência caso queira ajustar depois.
    heading = {
      enabled = true,
      sign = false,
    },
    code = {
      enabled = true,
      style = "full",
      border = "thin",
    },
  },
}
