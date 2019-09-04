"           _         
""   _   __(_)___ ___ 
""  | | / / / __ `__ \
""  | |/ / / / / / / /
""  |___/_/_/ /_/ /_/ 

call plug#begin('~/.vim/plugged')
  Plug 'dracula/vim', {'as': 'dracula'}
  Plug 'mhinz/vim-startify'
  Plug 'ryanoasis/vim-devicons'
  Plug 'vim-syntastic/syntastic'
  Plug 'Raimondi/delimitMate'
  Plug 'alx741/vim-hindent'
  Plug 'SirVer/UltiSnips'
  Plug 'lervag/vimtex'
  Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
  Plug '907th/vim-auto-save'
  Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
""  Plug 'dag/vim2hs', {'for': 'haskell'}
  Plug 'Twinside/vim-HaskellConceal', {'for': 'haskell'}
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'morhetz/gruvbox'
  Plug 'ycm-core/YouCompleteMe'
call plug#end()


syntax on
set termguicolors
colorscheme dracula
set number
set cursorline
set background=dark

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol = "✕"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = "!"
let g:syntastic_style_error_symbol = "✕"

highlight SyntasticErrorSign guifg=#ff5555
highlight SyntasticWarningSign guifg=#f1fa8c

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_highlighting = 1

let g:syntastic_haskell_checkers=['hlint']

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on
    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=2      " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=2    " Indents will have a width of 4.
set softtabstop=2   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
filetype plugin indent on

nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>


let g:vim_markdown_folding_disabled = 1

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal="abdmg"

let g:auto_save_events = ["InsertLeave", "TextChanged"]
autocmd FileType tex let g:auto_save = 1
autocmd FileType tex let g:auto_save_silent = 1
