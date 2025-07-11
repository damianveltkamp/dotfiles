--- checkRemoteHost returns you the git remote host sanitized string.
--- This function performs git config --get remote.origin.url to get
--- the url to your remote repository.
local checkRemoteHost = function()
  local remoteHost = {}
  local handle = io.popen 'git config --get remote.origin.url'

  if handle ~= nil then
    local gitRemoteUrl = handle:read '*a'
    handle:close()

    local normalizedGitRemoteUrl = string.gsub(gitRemoteUrl, '%s+', '')

    if string.find(normalizedGitRemoteUrl, 'github') then
      local sanitizedRemoteString = string.gsub(normalizedGitRemoteUrl, '%.git', '')
      remoteHost['name'] = 'github'
      if string.find(normalizedGitRemoteUrl, 'git@') then
        remoteHost['remoteUrl'] = string.gsub(sanitizedRemoteString, '%git@github.com:', 'https://github.com/')
        return remoteHost
      end

      remoteHost['remoteUrl'] = sanitizedRemoteString
      return remoteHost
    end

    if string.find(normalizedGitRemoteUrl, 'bitbucket') then
      local urlRemovedPrefix = string.gsub(normalizedGitRemoteUrl, '.*@', '')
      local urlColonReplace = string.gsub(urlRemovedPrefix, '%:', '/')
      local url = 'https://' .. urlColonReplace

      remoteHost['name'] = 'bitbucket'
      remoteHost['remoteUrl'] = string.gsub(url, '%.git', '')

      return remoteHost
    end

    if string.find(normalizedGitRemoteUrl, 'azure') then
      remoteHost['name'] = 'azure'
      remoteHost['remoteUrl'] = 'https://' .. string.gsub(normalizedGitRemoteUrl, '.*@', '')

      return remoteHost
    end
  end
end

--- getSourceRef returns you the name of the git branch you are currently on.
local getSourceRef = function()
  local handle = io.popen 'git branch --show-current'
  if handle ~= nil then
    local sourceRef = handle:read '*a'
    handle:close()

    return sourceRef
  end
end

--- getTicketNumber gets the current branch you are on and checks if there are numbers present inside the branch name.
--- We asume that when numbers are present inside your branch name that those numbers represent a ticket number.
--- The number will be returned from this function.
local getTicketNumber = function()
  local handle = io.popen 'git branch --show-current'

  if handle ~= nil then
    local sourceRef = handle:read '*a'
    handle:close()

    local number = string.match(sourceRef, '%d+')

    return number
  end
end

vim.api.nvim_create_user_command('DVGetTicketNumber', function()
  local number = getTicketNumber()
  os.execute('echo ' .. number .. "| tr -d '\n' | pbcopy")
end, {})

--- bitbucketNewPullRequest executes a terminal command that opens up Google chrome
--- and points you towards the path in which you can create a new pull request on bitbucket.
local bitbucketNewPullRequest = function(remoteHost)
  local executionString = 'open -a "Google chrome" ' .. remoteHost['remoteUrl'] .. '/pull-requests/new'

  os.execute(executionString)
end

--- azureNewPullRequest executes a terminal command that opens up Google chrome
--- and points you towards the path in which you can create a new pull request on azure.
local azureNewPullRequest = function(remoteHost, sourceRef)
  local pullRequestString = '"' .. remoteHost['remoteUrl'] .. '/pullrequestcreate?sourceRef=' .. sourceRef .. '&targetRef=develop' .. '"'
  local executionString = 'open -a "Google chrome" ' .. pullRequestString

  os.execute(executionString)
end

--- githubNewPullRequest executes a terminal command that opens up Google chrome
--- and points you towards the path in which you can create a new pull request on github.
local githubNewPullRequest = function(remoteHost)
  local executionString = 'open -a "Google chrome" ' .. remoteHost['remoteUrl'] .. '/compare'

  os.execute(executionString)
end

vim.api.nvim_create_user_command('DVOpenNewPullRequest', function()
  local remoteHost = checkRemoteHost()
  local sourceRef = getSourceRef()
  local normalizedSourceRef = string.gsub(sourceRef, '%s+', '')

  if remoteHost['name'] == 'bitbucket' then
    bitbucketNewPullRequest(remoteHost)
  end

  if remoteHost['name'] == 'github' then
    githubNewPullRequest(remoteHost)
  end

  if remoteHost['name'] == 'azure' then
    azureNewPullRequest(remoteHost, normalizedSourceRef)
  end
end, {})

vim.api.nvim_create_user_command('DVOpenCurrentRepo', function()
  local remoteHost = checkRemoteHost()
  local executionString = 'open -a "Google chrome" ' .. remoteHost['remoteUrl']
  os.execute(executionString)
end, {})
