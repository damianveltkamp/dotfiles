local db = require("dashboard")

local opts = {
	custom_header = {
		"                                                      ",
		"                                                      ",
		"                                                      ",
		" █████╗  █████╗ ██████╗ ██╗███╗  ██╗ ██████╗          ",
		"██╔══██╗██╔══██╗██╔══██╗██║████╗ ██║██╔════╝          ",
		"██║  ╚═╝██║  ██║██║  ██║██║██╔██╗██║██║  ██╗          ",
		"██║  ██╗██║  ██║██║  ██║██║██║╚████║██║  ╚██╗         ",
		"╚█████╔╝╚█████╔╝██████╔╝██║██║ ╚███║╚██████╔╝██╗██╗██╗",
		" ╚════╝  ╚════╝ ╚═════╝ ╚═╝╚═╝  ╚══╝ ╚═════╝ ╚═╝╚═╝╚═╝",
		"                                                      ",
		"                                                      ",
		"                                                      ",
	},
	custom_section = {
		{
			desc = "    New PR   ",
			action = "silent lua OpenNewPullRequest()",
		},
		{
			desc = "    BitBucket",
			action = 'silent !open -a "Google chrome" "https://bitbucket.com"',
		},
		{
			desc = "    Github   ",
			action = 'silent !open -a "Google chrome" "https://github.com/"',
		},
		{
			desc = "    Gmail    ",
			action = 'silent !open -a "Google chrome" "https://gmail.com"',
		},
		{
			desc = "    Jira     ",
			action = 'silent !open -a "Google chrome" "https://dept-nl.atlassian.net/jira/your-work"',
		},
		{
			desc = "    Spotify  ",
			action = "silent !open -a spotify",
		},
		{
			desc = "",
		},
	},
}

db.custom_header = opts.custom_header
db.custom_center = opts.custom_section
