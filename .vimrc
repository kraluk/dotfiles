" .vimrc by kraluk
" Modification date: 2017-01-06

" {{{ Plugins

call plug#begin('~/.vim/plugged')
    
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'xolox/vim-easytags'
	Plug 'xolox/vim-misc'
	Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
	Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/syntastic'

    Plug 'tpope/vim-markdown'
	Plug 'othree/html5.vim'
	Plug 'derekwyatt/vim-scala'
	Plug 'nono/jquery.vim'
	Plug 'leshill/vim-json'
	Plug 'vim-latex/vim-latex'
	Plug 'juleswang/css.vim'
	Plug 'docker/docker'
    Plug 'Chiel92/vim-autoformat'

    Plug 'mhartington/oceanic-next'
    Plug 'chriskempson/base16-vim'

call plug#end()

" }}}

" {{{ Common configuration

" Encoding
set encoding=utf-8      " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

filetype plugin indent on
set nocp
    
" Search
set hls
set ic
set is
set scs

set mouse=a

" Default indentation
set sw=4
set sts=0
set ts=4
set expandtab

" }}}

" {{{ Appearance

set number
set background=dark
set t_Co=256

let base16colorspace=256

syntax on
colorscheme base16-ocean

" base-16 stuff
"if filereadable(expand("~/.vimrc_background"))
"    let base16colorspace=256
"    source ~/.vimrc_background
"endif

" }}}

" {{{ Airline Powerline configuration

let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

" }}}

" {{{ Key bindings

set pastetoggle=<F2>

" Switching between tabs
map <F5> :w<CR>
map <F7> :tabnext<CR>
map <F8> :tabprevious<CR>

" Autoformat
map <F3> :Autoformat<CR>

" }}}

" {{{ Cutom directories

" Set backups dir
set bdir=~/.vim/backup
set dir=~/.vim/swap

" }}}

" {{{ Syntastic configuration

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}}

" {{{ Other

set laststatus=2
set ttimeoutlen=50

" }}}
