"Automagically source .vimrc on save
autocmd! bufwritepost .vimrc source %

" Set up some basics
set nocompatible                " Who needs vi anyways?
set t_Co=256                    " Force 246 colors for the temrinal
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   " Save on buffer switch
set encoding=utf-8              " Encoding to UTF8
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h20
set numberwidth=5               " Sets the gutter width a little larger
set number                      " always show line numbers
set clipboard=unnamed
set secure
set showmatch
set matchpairs=(:),{:},[:]
set cursorline " Show the line the cursor is on
set undolevels=1000
set title

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


"display tabs and trailing spaces
"set list
"set listchars=tab:â–·â‹…,trail:â‹…,nbsp:â‹…

" Mouse stuff
"set mouse=a
"set ttymouse=xterm2

filetype off                    " Required, don't ask questions!
syntax on                       " turn syntax highlighting on

" Mappings for tabs
nnoremap <tab> :bnext<CR>
nnoremap <S-tab> :bprev<CR>

" Use JK instead of ESC
inoremap jk <C-[>
inoremap JK <C-[>

" First charachter of the sentence is the 1 key.
nnoremap 1 ^

" Last charachter of the sentence is the 0 key
nnoremap 0 $

" Shifting of code blocks
vnoremap > >gv
vnoremap < <gv

" Fix semi/colon
map ; :

" Re-Mapping of the splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Vundle!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"Disable swap files
set noswapfile

" Vundle Plugins!
Plugin 'Lokaltog/powerline-fonts'
Plugin 'bling/vim-airline'
Plugin 'mkitt/tabline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'edkolev/promptline.vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/savevers.vim'
Plugin 'rhysd/committia.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bogado/file-line'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
call vundle#end()

filetype plugin indent on       " Required, don't ask questions!

" Working Directory Goodies
cnoremap cwd lcd %%
cnoremap cd. lcd %%

" Git Gutter
nmap R <Plug>GitGutterRevertHunk
let g:gitgutter_sign_column_always = 1

" OmniComplete Settings
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
    \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlP Options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 'r'

" Tmux(Status Bar)
" AirLine(Status Bar)
set laststatus=2
let g:airline_theme='powerlineish'
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1

" Remove arrows in airline
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" Auto-remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Javascript Beautify
"autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin
autocmd BufNewFile,BufRead *.json set ft=javascript

" Re-Write with sudo
cmap w!! w !sudo tee % > /dev/null

" Kolor colorscheme
let g:kolor_italic=1                    " Enable italic. Default: 1
let g:kolor_bold=1                      " Enable bold. Default: 1
let g:kolor_underlined=0                " Enable underline. Default: 0
let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0

" My favorite color schemes
colorscheme molokai

" Go specific stuff
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au BufRead,BufNewFile *.go set filetype=go
autocmd filetype go set nolist
