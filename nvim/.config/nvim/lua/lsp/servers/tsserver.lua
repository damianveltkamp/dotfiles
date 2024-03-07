-- Nvim_lsp.tsserver.setup({
-- 	root_dir = Nvim_lsp.util.root_pattern(".git"),
-- 	on_attach = function(client)
-- 		client.server_capabilities.document_formatting = false
--
-- 		on_attach(client)
-- 	end,
-- })

require("typescript-tools").setup({
	root_dir = Nvim_lsp.util.root_pattern(".git"),
	on_attach = function(client)
		client.server_capabilities.document_formatting = false

		on_attach(client)
	end,
	handlers = {},
	settings = {},
})
