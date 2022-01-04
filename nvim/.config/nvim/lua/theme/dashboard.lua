local opts = {
    custom_header = {
      " █████╗  █████╗ ██████╗ ██╗███╗  ██╗ ██████╗          ",
      "██╔══██╗██╔══██╗██╔══██╗██║████╗ ██║██╔════╝          ",
      "██║  ╚═╝██║  ██║██║  ██║██║██╔██╗██║██║  ██╗          ",
      "██║  ██╗██║  ██║██║  ██║██║██║╚████║██║  ╚██╗         ",
      "╚█████╔╝╚█████╔╝██████╔╝██║██║ ╚███║╚██████╔╝██╗██╗██╗",
      " ╚════╝  ╚════╝ ╚═════╝ ╚═╝╚═╝  ╚══╝ ╚═════╝ ╚═╝╚═╝╚═╝",
    },
    custom_section = {
      a = {
        description = { '    New PR   ' },
        command = 'silent lua OpenNewPullRequest()',
      },
      b = {
        description = { '    BitBucket' },
        command = 'silent !open -a "Google chrome" "https://bitbucket.com"',
      },
      c = {
        description = { '    Github   ' },
        command = 'silent !open -a "Google chrome" "https://github.com/"',
      },
      d = {
        description = { '    Gmail    ' },
        command = 'silent !open -a "Google chrome" "https://gmail.com"',
      },
      e = {
        description = { '    Jira     ' },
        command = 'silent !open -a "Google chrome" "https://dept-nl.atlassian.net/jira/your-work"',
      },
      f = {
        description = { '    Spotify  ' },
        command = 'silent !open -a spotify',
      },
    }
}

-- https://bitbucket.org/tamtam-nl/dtnl-total-energie-website/pull-requests/new

vim.g.dashboard_custom_header = opts.custom_header
vim.g.dashboard_custom_section = opts.custom_section
