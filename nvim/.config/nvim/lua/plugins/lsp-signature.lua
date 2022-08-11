local lsp_signature_status_ok, lsp_signature = pcall(require, "lsp_signature")
if not lsp_signature_status_ok then
	vim.notify("Not able to load in lsp_signature", "error")
	return
end

-- lsp_signature.setup({
--   bind = true,
--   use_lspsaga = true,
--   timer_interval = 100,
-- })
