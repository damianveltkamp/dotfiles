return {
  formatCommand = 'prettier --config-precedence prefer-file --stdin-filepath ${INPUT}',
  formatStdin = true
}

  -- formatCommand = os.getenv('HOME') .. '/.nvm/versions/node/v14.17.0/bin/prettier ${--config-precedence:configPrecedence} ${--tab-width:tabWidth} ${--single-quote:singleQuote} ${--trailing-comma:trailingComma} --stdin-filepath ${INPUT}',
