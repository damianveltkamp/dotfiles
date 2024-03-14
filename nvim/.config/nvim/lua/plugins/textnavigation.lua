return {
	{ "unblevable/quick-scope", event = "BufReadPost" },
	{
		"phaazon/hop.nvim",
		event = "BufReadPost",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
}
