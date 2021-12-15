-- TODO check why eslint_d is not getting correct eslint version
return {
  lintCommand = "eslint_d -f unix --ext .js,.jsx,.ts,.tsx --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true
}
