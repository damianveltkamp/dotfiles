  call plug#begin('~/.vim/plugged')

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

	call plug#end()

  " Basic vim setup
	syntax on
	set relativenumber
	set smarttab
	set autoindent
	set cindent
	set tabstop=4
	set shiftwidth=4
	set hidden

	" Extreme movementkeys
	nnoremap H 0
	nnoremap L $
	nnoremap J G
	nnoremap K gg

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
