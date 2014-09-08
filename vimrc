
set nocompatible                " break away from old vi compatibility
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" This is the Vundle package, which can be found on GitHub.
" " For GitHub repos, you specify plugins using the
" " 'user/repository' format
Plugin 'gmarik/vundle'
"
" " We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'

"
" " To get plugins from Vim Scripts, you can reference the plugin
" " by name as it appears on the site
Plugin 'Buffergator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'jlanzarotta/bufexplorer'
"Plugin 'kien/ctrlp' i've installed this manually
Plugin 'tpope/vim-fugitive'
"
" " Now we can turn our filetype functionality back on
" filetype plugin indent on

filetype plugin indent on

set tabstop=4
set laststatus=2
"let g:airline_powerline_fonts = 1
"let g:airline_section_b = '%{strftime("%c)}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'

set incsearch
" Automatically cd into the directory that the file is in
execute pathogen#infect()
set autochdir
" highlight current line
"set cul

" adjust color
hi CursorLine term=none cterm=none ctermbg=3

set showcmd
set showmatch
set ignorecase
set smartcase
set ttyfast
set hlsearch
nore ; :
set nobackup
imap ii <C-[>
set fileformats=unix,dos,mac    " support all three newline formats
set viminfo=                    " don't use or save viminfo files
set noerrorbells
set wildmenu

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

" Formats the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

" get this working!
" Puts in the current git status
"if count(g:pathogen_disabled, 'Fugitive') < 1   
"	set statusline+=%{fugitive#statusline()}
"endif

" Puts in syntastic warnings
"    if count(g:pathogen_disabled, 'Syntastic') < 1  
"        set statusline+=%#warningmsg#
"        set statusline+=%{SyntasticStatuslineFlag()}
"        set statusline+=%*
"    endif

set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

let mapleader=','
set relativenumber
syntax on

" set width of NERDTree side bar
let g:NERDTreeWinSize = 40
set number

"set colorscheme
set background=dark
"colorscheme solarized
colorscheme abra
"ctrl-p install stuff
set runtimepath^=~/.vim/bundle/ctrlp.vim
