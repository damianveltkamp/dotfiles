local function getGitProjectName ()
  local pathSubstrings = {}

  local handle = io.popen("git rev-parse --show-toplevel")
  local gitProjectRoot = handle:read("*a")
  handle:close()

  for token in string.gmatch(gitProjectRoot, "[^/]+") do
    table.insert(pathSubstrings, token)
  end

  local tableLength = table.getn(pathSubstrings)
  local projectName = string.gsub(pathSubstrings[tableLength], "%s+", "")

  return projectName
end

local function getRemoteGithubUrl()
  local handle = io.popen("git config --get remote.origin.url")
  local githubRemoteUrl = handle:read("*a")
  handle:close()

  local normalizedGithubRemoteUrl = string.gsub(githubRemoteUrl, "%s+", "")

  return normalizedGithubRemoteUrl
end

function bitbucketOpenNewPullRequest()
  local projectName = getGitProjectName()
  local executionString = 'open -a "Google chrome" ' .. 'https://bitbucket.org/tamtam-nl/' .. projectName .. '/pull-requests/new'

  os.execute(executionString)
end

function githubOpenNewPullRequest()
  local remoteUrl = getRemoteGithubUrl()
  local executionString = 'open -a "Google chrome" ' .. remoteUrl .. '/compare'

  os.execute(executionString)
end
