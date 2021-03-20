" Nunjucks keybinds
inoremap <buffer><leader>nc <esc>I{% <esc>A %}
inoremap <buffer><leader>nfl <esc>I{% for <esc>A %}{% endfor %}<esc>F{i<CR><esc>kA<CR>

" TODO write check if already at top of file call =G only and not jump previous pos
" augroup formatHtml
"   autocmd!
"   autocmd BufWritePre * norm gg =G
"   autocmd BufWritePre * call JumpToPreviousPosition()
" augroup end

" function! JumpToPreviousPosition()
"   let j = 1
"   if j != ''
"     let pattern = '\v\c^\+'
"     if j =~ pattern
"       let j = substitute(j, pattern, '', 'g')
"       execute 'normal ' . j . '\<c-i>'
"     else
"       execute 'normal ' . j . '\<c-o>'
"     endif
"   endif
" endfunction

