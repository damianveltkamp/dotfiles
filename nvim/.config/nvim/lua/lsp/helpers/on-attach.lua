function on_attach(client, bufnr)
	local opts = { noremap = true }

	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	-- vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	vim.keymap.set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
	vim.keymap.set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
	vim.keymap.set("n", "gdw", "<cmd>Telescope diagnostics<CR>")

	vim.keymap.set("n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	vim.keymap.set("i", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc <CR>")
	vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")

	if client.resolved_capabilities.completion then
		vim.cmd("imap <silent> <C-n> <Plug>(completion_trigger)")
	end

	if client.resolved_capabilities.code_action then
		vim.cmd([[augroup CodeAction]])
		vim.cmd([[autocmd! * <buffer>]])
		vim.cmd([[autocmd CursorHold * lua require'nvim-lightbulb'.update_lightbulb()]])
		vim.cmd([[augroup END]])

		vim.keymap.set("n", "ga", "<cmd> Lspsaga code_action <CR>")
	end
end

return on_attach
