
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
        description = { '    BitBucket' },
        command = 'silent !open -a "Google chrome" "https://bitbucket.com"',
      },
      b = {
        description = { '    Gmail    ' },
        command = 'silent !open -a "Google chrome" "https://gmail.com"',
      },
      c = {
        description = { '    Jira     ' },
        command = 'silent !open -a "Google chrome" "https://dept-nl.atlassian.net/jira/your-work"',
      },
      d = {
        description = { '    Spotify  ' },
        command = 'silent !open -a spotify',
      },
    }
}

vim.g.dashboard_custom_header = opts.custom_header
vim.g.dashboard_custom_section = opts.custom_section
