Nvim_lsp.tsserver.setup {
  root_dir = Nvim_lsp.util.root_pattern('.git'),

  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
}
