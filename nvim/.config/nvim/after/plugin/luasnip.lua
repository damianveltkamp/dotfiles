local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	vim.notify("Not able to load in luasnip", "error")
	return
end

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

luasnip.config.set_config({
	history = true,

	-- This enables dynamic snippets update as you type.
	updateevents = "TextChanged,TextChangedI",

	enable_autosnippets = true,
})

-- Luasnip keymap
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })

luasnip.snippets = {
	tsx = {},
}
