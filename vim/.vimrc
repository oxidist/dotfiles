""          _
""   _   __(_)___ ___
""  | | / / / __ `__ \
""  | |/ / / / / / / /
""  |___/_/_/ /_/ /_/

call plug#begin('~/.vim/plugged')
  Plug 'mhinz/vim-startify'
  Plug 'vim-syntastic/syntastic'
  Plug 'tpope/vim-surround'
  Plug 'Raimondi/delimitMate'
  Plug 'alx741/vim-hindent'
  Plug 'lervag/vimtex'
  Plug 'SirVer/UltiSnips'
  Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
  Plug '907th/vim-auto-save'
  Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
  Plug 'ycm-core/YouCompleteMe'
  "Plug 'sheerun/vim-polyglot'
  Plug 'dracula/vim', {'as':'dracula'}
  Plug 'junegunn/goyo.vim'
  Plug 'dylanaraps/wal.vim'
call plug#end()

colorscheme wal
"set termguicolors
set background=dark
syntax on
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256


set number
set cursorline

hi clear CursorLine
hi CursorLineNr cterm=bold

"set noshowmode
set laststatus=0
" for arbtt
set title

let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[1 q"]"]]"

inoremap jk <ESC>
let mapleader = " "

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_error_symbol = "✕"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = "!"
let g:syntastic_style_error_symbol = "✕"

highlight SyntasticErrorSign guifg=#ff5555 ctermfg=202
highlight SyntasticWarningSign guifg=#f1fa8c ctermfg=220

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

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


let g:vim_markdown_folding_disabled = 1

let g:polyglot_disabled = ['latex']

let g:tex_flavor='xelatex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
    \ 'executable': 'latexmk',
    \ 'options' : [
    \   '-shell-escape',
    \   '--xelatex',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
set conceallevel=2
let g:tex_conceal="abdgm"

let g:auto_save_events = ["InsertLeave", "TextChanged"]
autocmd FileType tex let g:auto_save = 1
autocmd FileType tex let g:auto_save_silent = 1

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
