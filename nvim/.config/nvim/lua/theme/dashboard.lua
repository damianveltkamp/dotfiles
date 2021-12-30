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
        description = { '    BitBucket   ' },
        command = 'silent !open -a "Google chrome" "https://bitbucket.com"',
      },
      b = {
        description = { '    BitBucket PR' },
        command = 'silent lua bitbucketOpenNewPullRequest()',
      },
      c = {
        description = { '    Github PR   ' },
        command = 'silent lua githubOpenNewPullRequest()',
      },
      d = {
        description = { '    Gmail       ' },
        command = 'silent !open -a "Google chrome" "https://gmail.com"',
      },
      e = {
        description = { '    Jira        ' },
        command = 'silent !open -a "Google chrome" "https://dept-nl.atlassian.net/jira/your-work"',
      },
      f = {
        description = { '    Spotify     ' },
        command = 'silent !open -a spotify',
      },
    }
}

-- https://bitbucket.org/tamtam-nl/dtnl-total-energie-website/pull-requests/new

vim.g.dashboard_custom_header = opts.custom_header
vim.g.dashboard_custom_section = opts.custom_section
