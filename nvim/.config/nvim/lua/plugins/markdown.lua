return {
	{ "jxnblk/vim-mdx-js", event = "BufReadPost" },
	{
		"iamcco/markdown-preview.nvim",
		event = "VeryLazy",
		build = "cd app && npm install",
		config = function()
			vim.g.mkdp_filetypes = { "markdown", "markdown.mdx", "pandoc" }
		end,
		ft = { "markdown" },
	},
}
