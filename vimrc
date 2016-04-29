set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'crookedneighbor/bufexplorer'
Plugin 'itchyny/lightline.vim'
"Plugin 'bling/vim-airline'
Plugin 'ctrlp.vim'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
"Plugin 'ryanoasis/vim-devicons'
call vundle#end()            " required
filetype plugin indent on    " required

set guifont=Menlo\ Regular:h18
" Setting basic variables {{{
set softtabstop=2
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set number
set laststatus=2
set incsearch
" Automatically cd into the directory that the file is in
set autochdir
set showcmd
set showmatch
set ignorecase
set smartcase
set ttyfast
set hlsearch
set nobackup
set encoding=utf8
set fileformats=unix,dos,mac    " support all three newline formats
set viminfo=                    " don't use or save viminfo files
set noerrorbells
set wildmenu
let mapleader=','
syntax on
" set width of NERDTree side bar
let g:NERDTreeWinSize = 40
let g:airline_powerline_fonts = 1
"set colorscheme
"colorscheme solarized
colorscheme brown
"colorscheme sunny-day
"ctrl-p install stuff
set background=dark
set runtimepath^=~/.vim/bundle/ctrlp.vim
"turn off ctrlp from setting it's pwd 
let g:ctrlp_working_path_mode = 0
"set shortcut for nerd tree
nmap <leader>ne :NERDTree<cr>
map <silent> <C-n> :NERDTreeFocus<CR>
map <silent> <C-n> :NERDTreeToggle<CR>
"nmap ; :<CR>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" function for color status line {{{

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction
"}}}

" configuration for easy motion {{{
" <Leader>f{char} to move to {char}
 map  <Leader>f <Plug>(easymotion-bd-f)
 nmap <Leader>f <Plug>(easymotion-overwin-f)
"
" " s{char}{char} to move to {char}{char}
 nmap s <Plug>(easymotion-overwin-f2)
"
" " Move to line
 map <Leader>L <Plug>(easymotion-bd-jk)
 nmap <Leader>L <Plug>(easymotion-overwin-line)
"
" " Move to word
 map  <Leader>w <Plug>(easymotion-bd-w)
 nmap <Leader>w <Plug>(easymotion-overwin-w)
" }}}

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15


" setting our variables for statuslines {{{
" Formatts the statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor
set foldmethod=marker
set foldlevel=0
set modelines=1
" }}}
hi CursorLine term=none cterm=none ctermbg=3

" settings for syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

" vim:foldmethod=marker:foldlevel=0
" configuration for linghtline {{{
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

      function! LightLineModified()
          return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
      endfunction

      function! LightLineReadonly()
          return &ft !~? 'help' && &readonly ? 'RO' : ''
      endfunction

			function! LightLineFilename()
  			let fname = expand('%:t')
 				return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
	        \ fname == '__Tagbar__' ? g:lightline.fname :
 	       \ fname =~ '__Gundo\|NERD_tree' ? '' :
 	       \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
 	       \ &ft == 'unite' ? unite#get_status_string() :
 	       \ &ft == 'vimshell' ? vimshell#get_status_string() :
 	       \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
 	       \ ('' != fname ? fname : '[No Name]') .
 	       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
			endfunction

      function! LightLineFugitive()
          if exists("*fugitive#head")
                let _ = fugitive#head()
                    return strlen(_) ? ''._ : ''
                      endif
                        return ''
                      endfunction

"			function! LightLineFugitive()
"			  try
"			    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
"     			 let mark = ''  " edit here for cool mark
"		       let _ = fugitive#head()
"		       return strlen(_) ? mark._ : ''
"			    endif
"			  catch
"  			endtry
"  			return ''
"			endfunction

		 function! LightLineFileformat()
		  return winwidth(0) > 70 ? &fileformat : ''
		 endfunction

		 function! LightLineFiletype()
				return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
		endfunction

		function! LightLineFileencoding()
				return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
		endfunction

			function! LightLineMode()
		let fname = expand('%:t')
		return fname == '__Tagbar__' ? 'Tagbar' :
					\ fname == 'ControlP' ? 'CtrlP' :
					\ fname == '__Gundo__' ? 'Gundo' :
					\ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
					\ fname =~ 'NERD_tree' ? 'NERDTree' :
					\ &ft == 'unite' ? 'Unite' :
					\ &ft == 'vimfiler' ? 'VimFiler' :
					\ &ft == 'vimshell' ? 'VimShell' :
					\ winwidth(0) > 60 ? lightline#mode() : ''
	endfunction

	function! CtrlPMark()
		if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
			call lightline#link('iR'[g:lightline.ctrlp_regex])
			return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
						\ , g:lightline.ctrlp_next], 0)
		else
			return ''
		endif
	endfunction

	let g:ctrlp_status_func = {
		\ 'main': 'CtrlPStatusFunc_1',
		\ 'prog': 'CtrlPStatusFunc_2',
		\ }

	function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
		let g:lightline.ctrlp_regex = a:regex
		let g:lightline.ctrlp_prev = a:prev
		let g:lightline.ctrlp_item = a:item
		let g:lightline.ctrlp_next = a:next
		return lightline#statusline(0)
	endfunction

	function! CtrlPStatusFunc_2(str)
		return lightline#statusline(0)
	endfunction

	let g:tagbar_status_func = 'TagbarStatusFunc'

	function! TagbarStatusFunc(current, sort, fname, ...) abort
			let g:lightline.fname = a:fname
		return lightline#statusline(0)
	endfunction

	augroup AutoSyntastic
		autocmd!
		autocmd BufWritePost *.c,*.cpp call s:syntastic()
	augroup END

	function! s:syntastic()
		SyntasticCheck
		call lightline#update()
	endfunction

	let g:unite_force_overwrite_statusline = 0
	let g:vimfiler_force_overwrite_statusline = 0
	let g:vimshell_force_overwrite_statusline = 0




" }}}
