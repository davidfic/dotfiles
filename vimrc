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
set path+=**
" tell it to use an undo file
set undofile
" " set a directory to store the undo history
set undodir=/Users/davidfic/.vimundo/
let mapleader=','
syntax enable
" set width of NERDTree side bar
let g:NERDTreeWinSize = 40
let g:airline_powerline_fonts = 1
"set colorscheme
"colorscheme solarized
"colorscheme brown
colorscheme base16-railscasts
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
" higlights for railscast scheme
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1
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
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive','readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

			function! LightLineModified()
				if &filetype == "help"
					return ""
				elseif &modified
					return "+"
				elseif &modifiable
					return ""
				else
					return ""
				endif
			endfunction

			function! LightLineReadonly()
				if &filetype == "help"
					return ""
				elseif &readonly
					return "⭤"
				else
					return ""
				endif
			endfunction

			function! LightLineFugitive()
				if exists("*fugitive#head")
					let _ = fugitive#head()
					return strlen(_) ? '⭠ '._ : ''
				endif
				return ''
			endfunction

      function! LightLineFilename()
          return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                 \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                 \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
        endfunction
" }}}
