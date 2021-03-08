require('utils/setvariable')
require('utils/setoptions')

local nvim_lsp = require('lspconfig')
local configs = require'lspconfig/configs'

local format_options_prettier = {
    tabWidth = 2,
    singleQuote = true,
    trailingComma = "all",
    configPrecedence = "prefer-file"
}

vim.g.format_options_typescript = format_options_prettier
vim.g.format_options_javascript = format_options_prettier
vim.g.format_options_typescriptreact = format_options_prettier
vim.g.format_options_javascriptreact = format_options_prettier
vim.g.format_options_json = format_options_prettier
vim.g.format_options_css = format_options_prettier
vim.g.format_options_scss = format_options_prettier
vim.g.format_options_html = format_options_prettier
vim.g.format_options_yaml = format_options_prettier
vim.g.format_options_markdown = format_options_prettier

_G.formatting = function()
    if not vim.g[string.format("format_disabled_%s", vim.bo.filetype)] then
        vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
    end
end

-- On attach function for lsp's
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Add completion
	require'completion'.on_attach()
  vim.cmd [[ setlocal omnifunc=v:lua.vim.lsp.omnifunc ]]

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>shi', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>sh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>br', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>sld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

  -- TODO check what is code actions
  -- buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

--setOption('global', 'completeopt', 'menuone,noinsert,noselect')
setGlobalVariable('completion_matching_strategy_list', {'exact', 'substring', 'fuzzy', 'all'})
setGlobalVariable('completion_enable_auto_popup', 1)

vim.api.nvim_command([[
  set completeopt=menuone,noinsert,noselect
	autocmd BufEnter * lua require'completion'.on_attach()
]])


-- Use a loop to conveniently both setup defined servers
local servers = { 'jsonls', 'cssls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

local util = require 'lspconfig/util'

-- Tsserver setup
nvim_lsp.tsserver.setup {
  root_dir = nvim_lsp.util.root_pattern('.git'),
  on_attach = function(client, bufnr)
    -- This makes sure tsserver is not used for formatting (I prefer prettier)
    client.resolved_capabilities.document_formatting = false

    on_attach(client, bufnr)
  end,
  settings = {documentFormatting = false}
}

-- Formatting via efm
local eslint = require 'lsp/efm/eslint'
local prettier = require 'lsp/efm/prettier'

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
  markdown = {prettier}
}

nvim_lsp.efm.setup {
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
      ".lua-format",
      ".eslintrc.cjs",
      ".eslintrc",
      ".eslintrc.json",
      ".eslintrc.js",
      ".prettierrc",
      ".prettierrc.js",
      ".prettierrc.json",
      ".prettierrc.yml",
      ".prettierrc.yaml",
      ".prettier.config.js",
      ".prettier.config.cjs",
    },
    languages = languages,
  }
}

