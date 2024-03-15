return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if not cmp_status_ok then
				vim.notify("Not able to load in cmp", "error")
				return
			end

			local lspkind_status_ok, lspkind = pcall(require, "lspkind")
			if not lspkind_status_ok then
				vim.notify("Not able to load in lspkind", "error")
				return
			end

			local source_mapping = {
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				path = "[Path]",
			}

			local has_words_before = function()
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			-- Set completion menu options
			vim.opt.completeopt = "menuone,noselect"

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
					-- expand = function(args)
					-- 	vim.fn["vsnip#anonymous"](args.body)
					-- end,
				},
				mapping = {
					["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
					["<C-e>"] = cmp.mapping({
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					}),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif has_words_before() then
							cmp.complete()
						else
							fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_prev_item()
						end
					end, { "i", "s" }),
				},
				formatting = {
					format = function(entry, vim_item)
						vim_item.kind = lspkind.presets.default[vim_item.kind]
						local menu = source_mapping[entry.source.name]
						vim_item.menu = menu
						return vim_item
					end,
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
	{ "hrsh7th/cmp-cmdline", event = "CmdlineEnter" },
	{ "hrsh7th/cmp-path", event = "InsertEnter" },
	{ "hrsh7th/cmp-buffer", event = "InsertEnter" },
	-- { "mattn/emmet-vim" },
	{ "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
}
