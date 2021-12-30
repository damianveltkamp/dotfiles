function openNewPullRequest()
  local pathSubstrings = {}

  local handle = io.popen("git rev-parse --show-toplevel")
  local gitProjectRoot = handle:read("*a")
  handle:close()

  for token in string.gmatch(gitProjectRoot, "[^/]+") do
    table.insert(pathSubstrings, token)
  end

  local tableLength = table.getn(pathSubstrings)
  local projectName = string.gsub(pathSubstrings[tableLength], "%s+", "")
  local executionString = 'open -a "Google chrome" ' .. 'https://bitbucket.org/tamtam-nl/' .. projectName .. '/pull-requests/new'

  os.execute(executionString)
end

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
        description = { '    BitBucket PR' },
        command = 'silent lua openNewPullRequest() ',
      },
      c = {
        description = { '    Gmail       ' },
        command = 'silent !open -a "Google chrome" "https://gmail.com"',
      },
      d = {
        description = { '    Jira        ' },
        command = 'silent !open -a "Google chrome" "https://dept-nl.atlassian.net/jira/your-work"',
      },
      e = {
        description = { '    Spotify     ' },
        command = 'silent !open -a spotify',
      },
    }
}

-- https://bitbucket.org/tamtam-nl/dtnl-total-energie-website/pull-requests/new

vim.g.dashboard_custom_header = opts.custom_header
vim.g.dashboard_custom_section = opts.custom_section
