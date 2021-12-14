require('utils/setmapping')

function on_attach(client, bufnr)
  local opts = { noremap=true}

  map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map('n', 'ghi', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map('n', 'gsi', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  map('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  map('n', 'gdw', '<Cmd>Telescope diagnostics<CR>', opts)

  if client.resolved_capabilities.completion then
    vim.cmd 'imap <silent> <C-n> <Plug>(completion_trigger)'
  end

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[
    augroup Format
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, bufnr)
    augroup END
    ]], true)
  elseif client.resolved_capabilities.document_range_formatting then
    -- TODO set range formatting stuff
  end

  if client.resolved_capabilities.code_action then
    vim.cmd [[augroup CodeAction]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd CursorHold * lua require'nvim-lightbulb'.update_lightbulb()]]
    vim.cmd [[augroup END]]

    map('n', '<leader>ga', '<cmd> lua require("telescope.builtin").lsp_code_actions()<CR>')
  end
end

return on_attach
