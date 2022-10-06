let g:polyglot_disabled = ['latex.plugin', 'markdown.plugin', 'haskell']
""          _
""   _   __(_)___ ___
""  | | / / / __ `__ \
""  | |/ / / / / / / /
""  |___/_/_/ /_/ /_/

call plug#begin('~/.vim/plugged')
  Plug 'mhinz/vim-startify'
  Plug 'tpope/vim-surround'
  "Plug 'Raimondi/delimitMate'
  "Plug 'alx741/vim-hindent'
  Plug 'lervag/vimtex'
  Plug 'SirVer/UltiSnips'
  Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
  Plug '907th/vim-auto-save'
  Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
  Plug 'sheerun/vim-polyglot'
  Plug 'OfficialOxide/wal.vim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
  Plug 'dense-analysis/ale'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'BurntSushi/ripgrep'
  Plug 'fiatjaf/neuron.vim'
  Plug 'whonore/Coqtail'
  Plug 'ap/vim-css-color'
  Plug 'lervag/wiki.vim'
  Plug 'samgriesemer/vim-roam'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'skdfj/rein.vim'
	Plug 'jiangmiao/auto-pairs'
call plug#end()


colorscheme rein
"set termguicolors
set background=dark
syntax on
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256

inoremap jk <Esc>
imap <C-BS> <C-W>
let mapleader = " "

" up and down row-wise, not line-wise
"nmap j gj
"nmap k gk


" apply previous command on whatever lines are selected
vnoremap . :norm.<CR>

set nobackup
set nowritebackup
set noswapfile
" get rid of swapfiles everywhere
set dir=/tmp
set number
set relativenumber
set cursorline

set hidden
" unicode ellipsis (…)
"set ambiwidth=double
" for arbtt
set title
"more characters will be sent to the screen for redrawing
set ttyfast
"time waited for key press(es) to complete. It makes for a faster key response
set ttimeout
set ttimeoutlen=10
"make backspace behave properly in insert mode
set backspace=indent,eol,start
"display incomplete commands
set showcmd
"a better menu in command mode
set wildmenu
set wildmode=longest:full,full
"incremental search
set incsearch
"highlight search
set hlsearch
"searches are case insensitive unless they contain at least one capital letter
set ignorecase
set smartcase
" pasting
set pastetoggle=<F2>

set laststatus=2

set statusline = 
set statusline +=%#warningmsg#
set statusline +=%*
set statusline +=[%{winnr()}]
set statusline +=\ %f
" Full path to file
set statusline +=\ %1*%m%0*
" modified flag
set statusline +=\ %h
" [help]
set statusline +=%r
" read only flag
set statusline +=%w
" preview window flag
set statusline +=%=
set statusline +=\ %l,%c
" Line, column-virtual column"
set statusline +=\ \ %{&filetype}

"set statusline=─
set fillchars=stl:─     
" fill active window's statusline with -
set fillchars+=stlnc:─
" better vertical split line 
set fillchars+=vert:│
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on
    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=2
" The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=2
" Indents will have a width of 4.
set softtabstop=2
" Sets the number of columns for a TAB.
set expandtab
" Expand TABs to spaces.
filetype plugin indent on

nnoremap \\ :noh<return>

nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" window management
nnoremap <leader>w <C-w>

" https://stackoverflow.com/a/6404246/
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'
let g:startify_fortune_use_unicode = 1
let g:ale_sign_error = '×'
let g:ale_sign_warning = '!'

highlight ALEErrorSign guifg=#ff5555 ctermfg=202
highlight ALEWarningSign guifg=#f1fa8c ctermfg=220

let g:ale_linters_explicit            = 1
let g:ale_lint_on_text_changed        = 'never'
let g:ale_lint_on_enter               = 1
let g:ale_lint_on_save                = 1
let g:ale_fix_on_save                 = 0

let g:ale_linters = {
\   'markdown':      ['proselint'],
\}


let g:vim_markdown_folding_disabled = 1


"" \   '-synctex=1',

let g:tex_flavor='xelatex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk = {
    \ 'executable': 'latexmk',
    \ 'options' : [
    \   '-shell-escape',
    \   '--xelatex',
    \   '-file-line-error',
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

let g:syntastic_auto_jump = 0
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

set viminfo='100,n$HOME/.vim/files/info/viminfo'


function! ScrollOffToggle()
    if(&scrolloff != 999)
        norm! zz
        set scrolloff=999
    else
        set scrolloff=3
    endif
    echo &scrolloff
endfunc

" Color for out of focus sections with limelight
let g:limelight_conceal_ctermfg = 'gray'

" Regex for limelight to include % demarcations
let g:limelight_bop = '\(^\s*$\n\|^\s*%$\n\)\zs'
let g:limelight_eop = '\ze\(^$\|^\s*%$\)'

" hi pri
let g:limelight_priority = -1

" Goyo 1 + textwidth
let g:goyo_width = 68

"let delimitMate_expand_cr = 2
"let delimitMate_jump_expansion = 1

" Preformatting and window styling for comfy latex typing.
noremap <silent> <F2> <esc><esc>:Goyo<CR>
noremap <silent> <F3> <esc><esc>:call ScrollOffToggle()<CR>:Limelight!!<CR>
noremap <silent> <F5> <esc><esc>gg49O<esc>G49o<esc>50%<cr>

set viminfo='100,n$HOME/.vim/files/info/viminfo'
