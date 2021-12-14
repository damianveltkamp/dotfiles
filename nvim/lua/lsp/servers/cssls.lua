local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

Nvim_lsp.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
