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
Plugin 'rosenfield/conque-term'
" the newest version of bufexplorer breaks switching buffers
" using a fork so we can have the old version
"Bundle 'jlanzarotta/bufexplorer'
Plugin 'crookedneighbor/bufexplorer'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'ctrlp.vim'
Plugin 'bling/vim-bufferline'
"Plugin 'jeetsukumaran/vim-buffergator'



call vundle#end()            " required
filetype plugin indent on    " required

set guifont=Menlo\ Regular:h18
" Setting basic variables {{{
set tabstop=4
set expandtab
set shiftwidth=4
set relativenumber
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


function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction



au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15


" setting our variables for statuslines {{{
" Formatts the statusline
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

