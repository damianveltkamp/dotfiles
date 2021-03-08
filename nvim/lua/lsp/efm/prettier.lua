return {
  formatCommand = os.getenv('HOME') .. '/.nvm/versions/node/v14.15.4/bin/prettier ${--config-precedence:configPrecedence} ${--tab-width:tabWidth} ${--single-quote:singleQuote} ${--trailing-comma:trailingComma} --stdin-filepath ${INPUT}',
  formatStdin = true
}

