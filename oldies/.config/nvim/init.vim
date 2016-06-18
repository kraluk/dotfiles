" UTF-8 NWA style
set encoding=utf-8
scriptencoding utf-8

" --- Mappings

" Pasting
set pastetoggle=<F2>

" Toggle the state of search highlighting locally.
nnoremap <silent> <leader>h :setlocal hlsearch!<cr>

" --- Timing options
inoremap <silent> <leader>pt <C-R>=strftime("%Y-%m-%d")<CR>

" --- vim-airline options
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#trailing_format = 's:[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'i:[%s]'
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_theme = 'oceanicnext'
let g:airline_detected_modified = 1
let g:airline_powerline_fonts = 1
let g:airline_detect_iminsert = 0
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'v'  : 'V',
      \ 'V'  : 'B'
      \ }

" --- Plugins by vim-plug

call plug#begin('~/.config/nvim/plugged')

Plug 'gregsexton/gitv'
Plug 'guns/xterm-color-table.vim'
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'mhartington/oceanic-next'
Plug 'koron/minimap-vim'
Plug 'reedes/vim-textobj-quote', { 'for': 'markdown,notes' }
Plug 'reedes/vim-wordy'
Plug 'tfnico/vim-gradle'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-publish'
Plug 'xolox/vim-shell'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" --- Final tweaks

filetype plugin indent on
syntax enable

" Theme
syntax enable
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark

" Numbers
set number
