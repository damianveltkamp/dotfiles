local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	vim.notify("Not able to load in luasnip", "error")
	return
end

local snip = luasnip.snippet
local text = luasnip.text_node
local func = luasnip.function_node
local insert = luasnip.insert_node

luasnip.config.set_config({
	history = true,

	-- This enables dynamic snippets update as you type.
	updateevents = "TextChanged,TextChangedI",

	enable_autosnippets = true,
})

-- Luasnip keymap
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if luasnip.expand_or_jumpable() then
		print("44")
		luasnip.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })

luasnip.snippets = {
	all = {
		luasnip.parser.parse_snippet("Expand", "--testing"),
	},
}

luasnip.add_snippets(nil, {
	typescriptreact = {
		luasnip.parser.parse_snippet(
			"component",
			"export type $1 = { \n $2 \n}\n\nexport const $3 = ({$4}: $5) => { \n};"
		),
		luasnip.parser.parse_snippet("lookuptable", "const $1 = ($2) => ({\n$3\n});"),
	},
	typescript = {
		luasnip.parser.parse_snippet("lookuptable", "const $1 = ($2) => ({\n$3\n});"),
	},
})

-- luasnip.add_snippets(nil, {
-- 	all = {
-- 		snip({
-- 			trig = "date",
-- 			namr = "Date",
-- 			dscr = "Date in the form of YYYY-MM-DD",
-- 		}, {
-- 			func(function()
-- 				return os.date("%Y-%m-%d")
-- 			end, {}),
-- 		}),
-- 	},
-- })
