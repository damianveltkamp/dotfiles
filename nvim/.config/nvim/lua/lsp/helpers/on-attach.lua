function on_attach(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")

	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "gdw", "<cmd>Telescope diagnostics<CR>")

	vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help)
	vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition)
	vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc <CR>")
	vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")
	vim.keymap.set("n", "ga", "<cmd> Lspsaga code_action <CR>")

	if client.server_capabilities.completion then
		vim.cmd("imap <silent> <C-n> <Plug>(completion_trigger)")
	end

	if client.server_capabilities.code_action then
		vim.cmd([[augroup CodeAction]])
		vim.cmd([[autocmd! * <buffer>]])
		vim.cmd([[autocmd CursorHold * lua require'nvim-lightbulb'.update_lightbulb()]])
		vim.cmd([[augroup END]])
	end
end

return on_attach
