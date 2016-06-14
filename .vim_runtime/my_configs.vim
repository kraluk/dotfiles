set pastetoggle=<F2>

set number

colorscheme base16-oceanicnext
set background=dark

let g:airline_powerline_fonts = 1

"call plug#begin('~/.vim/plugged')
"    Plug 'vim-airline/vim-airline'
"    Plug 'vim-airline/vim-airline-themes'
"call plug#end()

set laststatus=2
set ttimeoutlen=50

let g:airline_theme='papercolor'

" Switching between tabs
map <F5> :w<CR>
map <F7> :tabnext<CR>
map <F8> :tabprevious<CR>
