vim.api.nvim_create_user_command("DVSiliconScreenshot", function()
	local filetype = vim.bo.filetype

	local executionString = "silicon --from-clipboard -l " .. filetype .. " --to-clipboard"
	os.execute(executionString)
end, {})
