function setOption(scope, key, value)
  local scopes = {global = vim.o, buffer = vim.bo, window = vim.wo}
  scopes[scope][key] = value
  if scope ~= 'global' then scopes['global'][key] = value end
end
