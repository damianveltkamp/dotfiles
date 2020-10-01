call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'posva/vim-vue'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'unblevable/quick-scope'
Plug 'lumiliet/vim-twig', { 'for': ['html'] }
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': ['html'] }

call plug#end()

let mapleader=" "
let $RTP=split(&runtimepath, ',')[0]
let $RC="$HOME/.vim/vimrc"

" Basic vim setup
syntax on
set mouse=a
set relativenumber
set clipboard=unnamedplus
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set hidden
set noshowmode
set termguicolors
set updatetime=50
set nowrap

" Indentation
set autoindent
set smarttab
set smartindent

" REMAPPINGS HERE
" Extreme movementkeys
nnoremap H 0
nnoremap L $
nnoremap J G
nnoremap K gg

" Insertmode movement and Commandline movement
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Window hopping
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Paste remapping to blackhole register for better pasting
vnoremap <leader>p "_dP

" Black hole register settings
vnoremap <leader>d "_d
vnoremap <leader>dd "_d

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Spellcheking
map  <F6> :setlocal spell! spelllang=nl<CR>
map  <F7> :set spelllang=en_us<CR>

" Remove highlighting of previous search
nnorema <Space> :noh<Return>

" Launch fzf
nnoremap <leader>f :Files<CR>

" Launch ripgrep
nnoremap <leader>ps :RG<SPACE>

" Git keybinds "
nmap <leader>gs :G<CR>
nmap <leader>gc :Gcommit<CR>
" Accept incomming changes:
nmap <leader>gj: diffget //3<CR>
" Accept current changes:
nmap <leader>gf: diffget //2<CR>

" COC codebase searching
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
nnoremap <leader>rpw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" use <c-space> (control + space) for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Mapping tab to navigate coc suggestions when in insertmode
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Nerdtree and Nerdcommenter mappings
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Creating ctags mapping and setting alocation of the ctags file
set tags=./tags;/
nnoremap <leader>ct :!ctags -R .



" THEME AND LIGHTLINE SETTINGS "
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'gitgutter' , 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'gitgutter': 'Gitchanges'
      \ },
      \ }

" Enables cursor line position tracking:
set cursorline
highlight LineNr guifg=#ffffff

" Removes the underline causes by enabling cursorline:
highlight clear CursorLine

" Sets the line numbering to red background:
highlight CursorLineNR guibg=red


" ALE SETTINGS "
let g:ale_fixers = {
      "\   '*': ['remove_trailing_lines', 'trim_whitespace'],
      "\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1


" Quickscope settings "
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END


" Gitgutter settings "
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction


" Gitgutter integration with lightline "
function! Gitchanges()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let g:gitgutter_sign_removed = '-'
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction


" Rip grep and fzf functionality "
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0) "\   fzf#vim#with_preview(), <bang>0)

" fzf window styling
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }


" Return to the same line you left off at "
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \	execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Highlight yanked text "
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" Trim whitespace on safe functionality "
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Clear vim registers
command! RegisterWipe for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
ugroup END
