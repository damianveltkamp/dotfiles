local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting

require("null-ls").setup({
	sources = {
		formatting.prettier,
		require("null-ls").builtins.diagnostics.eslint_d,
		require("null-ls").builtins.diagnostics.jsonlint,
		require("null-ls").builtins.formatting.stylua,
	},
	on_attach = function(client)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})
