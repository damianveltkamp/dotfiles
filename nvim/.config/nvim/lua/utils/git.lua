local checkRemoteHost = function()
  local remoteHost = {}
  local handle = io.popen('git config --get remote.origin.url')
  local gitRemoteUrl = handle:read('*a')
  handle:close()

  local normalizedGitRemoteUrl = string.gsub(gitRemoteUrl, "%s+", "")

  if string.find(normalizedGitRemoteUrl, 'github') then
    remoteHost['name'] = 'github'
    remoteHost['remoteUrl'] = string.gsub(normalizedGitRemoteUrl, "%.git", "")
    return remoteHost
  end

  if string.find(normalizedGitRemoteUrl, 'bitbucket') then
    local urlRemovedPrefix = string.gsub(normalizedGitRemoteUrl, ".*@", "")
    local urlColonReplace = string.gsub(urlRemovedPrefix, '%:', '/')
    local url = 'https://' .. urlColonReplace

    remoteHost['name'] = 'bitbucket'
    remoteHost['remoteUrl'] = url

    return remoteHost
  end

  if string.find(normalizedGitRemoteUrl, 'azure') then
    remoteHost['name'] = 'azure'
    remoteHost['remoteUrl'] = 'https://' .. string.gsub(normalizedGitRemoteUrl, ".*@", "")

    return remoteHost
  end
end

local getSourceRef = function()
  local handle = io.popen('git branch --show-current')
  local sourceRef = handle:read('*a')
  handle:close()

  return sourceRef
end

local bitbucketNewPullRequest = function(remoteHost)
  local executionString = 'open -a "Google chrome" ' .. remoteHost['remoteUrl'] .. '/pull-requests/new'

  os.execute(executionString)
end

local azureNewPullRequest = function(remoteHost, sourceRef)
  local pullRequestString = '"' .. remoteHost['remoteUrl'] .. '/pullrequestcreate?sourceRef=' .. sourceRef .. '&targetRef=develop' .. '"'
  local executionString = 'open -a "Google chrome" ' .. pullRequestString

  os.execute(executionString)
end

local githubNewPullRequest = function(remoteHost)
  local executionString = 'open -a "Google chrome" ' .. remoteHost['remoteUrl'] .. '/compare'

  os.execute(executionString)
end

function OpenNewPullRequest()
  local remoteHost = checkRemoteHost()
  local sourceRef = getSourceRef()
  local normalizedSourceRef = string.gsub(sourceRef, "%s+", "")

  if remoteHost['name'] == 'bitbucket' then
    bitbucketNewPullRequest(remoteHost)
  end

  if remoteHost['name'] == 'github' then
    githubNewPullRequest(remoteHost)
  end

  if remoteHost['name'] == 'azure' then
    azureNewPullRequest(remoteHost, normalizedSourceRef)
  end
end
