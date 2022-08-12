setlocal spell!
set spelllang=en_us
set colorcolumn=100
set tw=100
highlight colorColumn ctermbg=0 guibg=#2c323c

nnoremap <leader>bn :!buildNote -f %<CR>
nnoremap <leader>on :!openNote -f %<CR>
