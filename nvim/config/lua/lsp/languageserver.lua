-- Set Nvim_lsp global
Nvim_lsp = require('lspconfig')

-- Load helpers and utilities
require('utils/setvariable')
require('utils/setoptions')
require('lsp/diagnostics')
require('lsp/helpers/on-attach')
require('lsp/helpers/completion')
require('lsp/helpers/lspkind')
require('lsp/helpers/formatting')

-- Servers
require('lsp/servers/tsserver')
require('lsp/servers/cssls')
require('lsp/servers/htmlls')
require('lsp/servers/yamlls')
require('lsp/servers/vimls')
require('lsp/servers/jsonls')
require('lsp/servers/luals')
require('lsp/servers/efmls')