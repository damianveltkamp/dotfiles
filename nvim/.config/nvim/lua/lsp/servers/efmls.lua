local eslint = require 'lsp/efm/eslint'
local prettier = require 'lsp/efm/prettier'

-- TODO add back prettier for html when i find a way to implement nunjucks formatting
local languages = {
  typescript = {prettier, eslint},
  javascript = {prettier, eslint},
  typescriptreact = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  yaml = {prettier},
  json = {prettier},
  html = {prettier},
  scss = {prettier},
  css = {prettier},
  markdown = {prettier},
  pandoc = {prettier},
  bib = {prettier}
}

Nvim_lsp.efm.setup {
  on_attach = on_attach,
  filetypes = vim.tbl_keys(languages),
  init_options = {
    documentFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true
  },
  settings = {
    log_file = '~/.config/efm.log',
    rootMarkers = {
      '.lua-format',
      '.eslintrc.cjs',
      '.eslintrc',
      '.eslintrc.json',
      '.eslintrc.js',
      '.prettierrc',
      '.prettierrc.js',
      '.prettierrc.json',
      '.prettierrc.yml',
      '.prettierrc.yaml',
      '.prettier.config.js',
      '.prettier.config.cjs',
    },
    languages = languages,
  }
}
