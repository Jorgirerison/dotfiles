return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Substitui require("nvim-treesitter.configs").setup({...})
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- Substitui "ensure_installed" (instala uma vez; :TSUpdate mantém atualizado)
    local langs = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      "yaml",
      "htmldjango",
      "html",
      "python",
      "css",
      "javascript",
    }
    require("nvim-treesitter").install(langs)

    -- Substitui "highlight.enable" + "indent.enable"
    -- (não existe mais "enable = true"; você mesmo liga por filetype)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        -- só liga se o parser da linguagem detectada estiver instalado
        local lang = vim.treesitter.language.get_lang(args.match)
        local ok_parser = lang and vim.tbl_contains(langs, lang)
        if not ok_parser then
          return
        end

        vim.treesitter.start()

        -- fold via treesitter
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldmethod = "expr"

        -- FIX: abrir o arquivo com tudo expandido, nunca dobrado.
        -- Sem isso, o fold funciona "certo" mas já entrega o buffer
        -- fechado, porque em algum lugar da config o foldlevel inicial
        -- tá em 0. Isso afeta QUALQUER filetype com parser instalado
        -- (lua, python, markdown, etc) — não é coisa de um plugin específico.
        vim.wo[0][0].foldlevel = 99

        -- indent via treesitter (ainda experimental)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
