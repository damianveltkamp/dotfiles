function on_attach(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")

	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts, { desc = "[G]o to [I]mplementation" })
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts, { desc = "Go to previous [D]iagnostic message" })
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts, { desc = "Go to next [D]iagnostic message" })

	vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "[G]o to [D]efinition" })
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]o to [R]eference" })
	vim.keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, { desc = "[G]o to [I]mplementation" })
	vim.keymap.set("n", "gh", "<cmd>Lspsaga hover_doc <CR>", { desc = "[G]et [H]over documentation" })
	vim.keymap.set("n", "rn", "<cmd>Lspsaga rename<CR>", { desc = "[R]e[N]ame" })
	vim.keymap.set("n", "<leader>ca", "<cmd> Lspsaga code_action <CR>", { desc = "[C]ode [A]ction" })

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
