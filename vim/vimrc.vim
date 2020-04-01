call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'posva/vim-vue'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

call plug#end()

let mapleader=","

" Basic vim setup
syntax on
set mouse=a
set relativenumber
set clipboard=unnamedplus
set smarttab
set autoindent
set cindent
set expandtab
set tabstop=2
set shiftwidth=2
set hidden

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

" Return to the same line you left off at
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \	execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Theme
colorscheme onedark

" Javascript linting
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \}
" Fix files automatically on save
let g:ale_fix_on_save = 1

" Enables cursor line position tracking:
set cursorline
" Removes the underline causes by enabling cursorline:
highlight clear CursorLine
" Sets the line numbering to red background:
highlight CursorLineNR ctermbg=red

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Remove highlighting of previous search
nnorema <Space> :noh<Return>

" Javascript shortkeys
inoremap <leader>csl <esc>Iconsole.log(<esc>A)
inoremap <leader>cst <esc>Iconsole.table(<esc>A)
