require('utils/setvariable')
require('utils/setoptions')
require('lsp/diagnostics')
require('lsp/helpers/on-attach')
require('lsp/helpers/completion')
require('lsp/helpers/lspkind')

-- Set Nvim_lsp global
Nvim_lsp = require('lspconfig')

-- Servers
require('lsp/servers/tsserver')
require('lsp/servers/cssls')
require('lsp/servers/html')
require('lsp/servers/yamlls')
require('lsp/servers/vimls')
require('lsp/servers/jsonls')
require('lsp/servers/luals')
require('lsp/servers/efmls')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true;
