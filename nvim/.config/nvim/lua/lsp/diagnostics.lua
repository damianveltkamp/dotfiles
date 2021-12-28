vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    prefix = "~",
    spacing = 4,
  },
  signs = true,
  update_in_insert = false,
})

vim.fn.sign_define(
"DiagnosticSignError",
{ text = "", texthl = "DiagnosticError" }
)
vim.fn.sign_define(
"DiagnosticSignWarn",
{ text = "", texthl = "DiagnosticWarning" }
)
vim.fn.sign_define(
"DiagnosticSignInfo",
{ text = "", texthl = "DiagnosticInformation" }
)
vim.fn.sign_define(
"DiagnosticSignHint",
{ text = "", texthl = "DiagnosticHint" }
)
