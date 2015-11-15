" .vimrc
" Last modification: 08.06.2013

" Syntax
syntax enable

" Basic options
set nocompatible
set showmode
set showcmd
set wildmenu
set ruler
set autoindent
set smartindent
set showmatch
set ignorecase
set smartcase
set number
set hlsearch

" Extra options
set mouse=a
set enc=utf8
set fileencodings=utf8
set smarttab autoindent
set tabstop=8
set shiftwidth=4
set shiftround
set pastetoggle=<F2>
set incsearch
set history=50

"set cursorline
set numberwidth=4
set wrap
set title
set ttyfast

" Cuda enabled
"au BufNewFile,BufRead *.cu set ft=cu
"au BufNewFile,BufRead *.cuh set ft=cu

"set background=dark
colorscheme 256-blueosx         "256-blueosx slate delek

" Filetype configuration
filetype on
filetype plugin on
filetype indent on

runtime ftplugin/man.vim

set statusline=%<%f\ %h%m%r%=[%{&fenc},%{&ff},%{strlen(&ft)?&ft:'none'}]\ %-14.(%l,%c%V%)\ %P

" Switching between tabs
map <F5> :w<CR>
map <F7> :tabnext<CR>
map <F8> :tabprevious<CR>

" CTRL + Space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Functions

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
