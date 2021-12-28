local eslint_status_ok, eslint = pcall(require, 'lsp/efm/eslint')
if not eslint_status_ok then
  vim.notify('Not able to load in eslint config', 'error')
  return
end

local prettier_status_ok, prettier = pcall(require, 'lsp/efm/prettier')
if not prettier_status_ok then
  vim.notify('Not able to load in prettier config', 'error')
  return
end

-- TODO add back prettier for html when i find a way to implement nunjucks formatting
local languages = {
  typescript = {prettier, eslint},
  javascript = {prettier, eslint},
  typescriptreact = {prettier, eslint},
  javascriptreact = {prettier, eslint},
  yaml = {prettier},
  json = {prettier},
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
