local format_options_prettier = {
  tabWidth = 4,
  singleQuote = true,
  trailingComma = 'all',
  configPrecedence = 'prefer-file'
}

-- Binding format options
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

-- Saves buffer after document format
vim.lsp.handlers['textDocument/formatting'] = function(err, result, ctx, config)
  if err ~= nil or result == nil then
    return
  end
  if not vim.api.nvim_buf_get_option(ctx['bufnr'], 'modified') then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if ctx['bufnr'] == vim.api.nvim_get_current_buf() then
      vim.cmd [[noautocmd :update]]

      -- TODO check why gitgutter is called here
      -- vim.cmd [[GitGutter]]
    end
  end
end
