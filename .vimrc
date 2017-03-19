" .vimrc by kraluk
" Modification date: 2017-03-19

" {{{ Plugins

call plug#begin('~/.vim/plugged')
    
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
    Plug 'sheerun/vim-polyglot'

    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'

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

" {{{ True color support

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" }}}

" {{{ Appearance

set number
"set background=dark
set t_Co=256

let g:onedark_termcolors=256
let g:onedark_terminal_italics=1

let base16colorspace=256

syntax on
colorscheme onedark

" }}}

" {{{ Lightline Powerline configuration

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

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
