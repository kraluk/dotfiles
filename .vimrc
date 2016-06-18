" .vimrc by kraluk
" Modification date: 2016-06-18

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
colorscheme base16-oceanicnext

" }}}

" {{{ Airline Powerline configuration

let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

" }}}

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

call plug#end()

" }}}

set laststatus=2
set ttimeoutlen=50

" {{{ Key bindings

set pastetoggle=<F2>

" Switching between tabs
map <F5> :w<CR>
map <F7> :tabnext<CR>
map <F8> :tabprevious<CR>

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
