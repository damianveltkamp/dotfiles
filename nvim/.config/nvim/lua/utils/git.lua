function OpenNewPullRequest()
  local remoteHost = CheckRemoteHost()

  if remoteHost['name'] == 'bitbucket' then
    BitbucketNewPullRequest(remoteHost)
  end

  if remoteHost['name'] == 'github' then
    GithubNewPullRequest(remoteHost)
  end

  if remoteHost['name'] == 'azure' then
    AzureNewPullRequest(remoteHost)
  end
end

function BitbucketNewPullRequest(remoteHost)
  local executionString = 'open -a "Google chrome" ' .. remoteHost['remoteUrl'] .. '/pull-requests/new'

  os.execute(executionString)
end

function AzureNewPullRequest(remoteHost)
  local executionString = 'open -a "Google chrome" ' .. remoteHost['remoteUrl'] .. '/pullrequestcreate'

  os.execute(executionString)
end

function GithubNewPullRequest(remoteHost)
  local executionString = 'open -a "Google chrome" ' .. remoteHost['remoteUrl'] .. '/compare'

  os.execute(executionString)
end

function CheckRemoteHost()
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
