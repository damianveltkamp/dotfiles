return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  cmd = { 'ConformInfo' },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd', 'prettier' },
      typescript = { 'prettierd', 'prettier' },
      typescriptreact = { 'prettierd', 'prettier' },
    },
    format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
  },
}
