require("utils/setmapping")

function on_attach(client, bufnr)
  local opts = { noremap = true }

  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  map("n", "gdw", "<cmd>Telescope diagnostics<CR>", opts)

  map("n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  map("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  map("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opts)
  map("n", "gh", "<cmd>Lspsaga hover_doc <CR>", opts)
  map("n", "gr", "<cmd>Lspsaga rename<CR>", opts)

  if client.resolved_capabilities.completion then
    vim.cmd("imap <silent> <C-n> <Plug>(completion_trigger)")
  end

  -- if client.resolved_capabilities.document_formatting then
  --   vim.api.nvim_exec([[
  --   augroup Format
  --   autocmd! * <buffer>
  --   autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
  --   augroup END
  --   ]], true)
  -- elseif client.resolved_capabilities.document_range_formatting then
  --   -- TODO set range formatting stuff
  -- end

  if client.resolved_capabilities.code_action then
    vim.cmd([[augroup CodeAction]])
    vim.cmd([[autocmd! * <buffer>]])
    vim.cmd([[autocmd CursorHold * lua require'nvim-lightbulb'.update_lightbulb()]])
    vim.cmd([[augroup END]])

    -- map('n', '<leader>ga', '<cmd> lua require("lspsaga.codeaction").code_action() <CR>')
    map("n", "ga", "<cmd> Lspsaga code_action <CR>")
  end
end

return on_attach
