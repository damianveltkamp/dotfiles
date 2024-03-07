-- Set Nvim_lsp global
Nvim_lsp = require("lspconfig")

-- Load helpers and utilities
require("lsp/diagnostics")
require("lsp/helpers/on-attach")
require("lsp/helpers/treesitter")
require("lsp/helpers/lspkind")
require("lsp/helpers/completion")

-- Servers
require("lsp/servers/tsserver")
require("lsp/servers/eslint")
require("lsp/servers/cssls")
require("lsp/servers/htmlls")
require("lsp/servers/yamlls")
require("lsp/servers/vimls")
require("lsp/servers/luals")

-- Linting
require("lsp/linting")
