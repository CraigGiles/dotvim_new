colorscheme gilesc

"
"      --- Plugins ---
" -------------------------------------------------

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'

Plug 'skywind3000/asyncrun.vim'
" Plug 'derekwyatt/vim-fswitch'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/BufOnly.vim'
Plug 'udalov/kotlin-vim'
Plug 'jansedivy/jai.vim'

call plug#end()

let $MYGVIMRC="~/.vim/gvimrc"
"
"      --- Auto Groups ---
" -------------------------------------------------
augroup vimrc_group
    autocmd! vimrc_group
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if exists('g:GuiLoaded') | so $MYGVIMRC | endif
augroup END

augroup quickfix_group
  autocmd! quickfix_group
  au FileType qf map <buffer> q <C-^>
augroup END

augroup help_group
  autocmd! help_group
  au FileType help map <buffer> q :q<cr>
augroup END

augroup auto_make_directory
    autocmd! auto_make_directory
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END

augroup ags_mode
    autocmd! ags_mode
    autocmd Filetype agsv nmap <buffer> <D-n> :AgsNextResult<CR>
    autocmd Filetype agsv nmap <buffer> <D-N> :AgsPrevResult<CR>
augroup end

if exists('g:GuiLoaded')
  " NOTE: font size 11 means on my monitor i can run it 'fullscreen' and not have extra pixels
  set guifont=Liberation\ Mono:h11
  nnoremap <D-F10> :RunFullScreen<CR>

  " Don't have scroll bars
  set guioptions=
endif


"
"      --- Key Bindings ---
" -------------------------------------------------
nnoremap <Space>es :source ~/.vim/vimrc<CR>

" Exit the Ex menu without executing the command
cnoremap <C-g><C-g> <c-c>
vnoremap <C-g><C-g> <c-c>

" Escape to normal mode from insert mode with jj / jk
inoremap jj <ESC>
inoremap Jj <ESC>
inoremap JJ <ESC>
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>

" Turn off that stupid highlight search
nnoremap <silent> <Space>n :noh<CR>

" When selecting text in visual mode,
" Delete or Backspace removes it
vmap <BS> x

" Take into consideration the wrapping when moving down or up a line
nnoremap j gj
nnoremap k gk

" Move to next / previous blank line
nnoremap <C-j> :call SetCursorToNextBlankLine()<CR>
nnoremap <C-k> :call SetCursorToPreviousBlankLine()<CR>

" Change split orientation from | to -
nnoremap <Space>sp :RotateSplits<CR>
nnoremap <Space>vs :RotateSplits<CR>

" Tab toggles folds
nnoremap <Tab> za

" Change the directory to the current file
command! CD cd %:p:h

" cmd f opens up the file list
if exists('g:GuiLoaded')
    " Search the codebase for the word under cursor
    nnoremap <C-f> :call SearchCodebase(expand('<cword>'))<CR>

    " nnoremap <D-j> :TagbarOpenAutoClose<CR>
    nnoremap <D-j> :CtrlPFunky<CR>
    nnoremap <D-f> :CtrlP<CR>
    nnoremap <D-b> :CtrlPBuffer<CR>
    nnoremap <D-p> :CtrlP<CR>

    " FZF key bindings
    "nnoremap <D-f> :Files<CR>
    "nnoremap <D-b> :Buffers<CR>
    "nnoremap <D-p> :Files<CR>

    nnoremap <D-m> :MakeWithoutAsking<CR>
    nnoremap <D-n> :cnext<CR>
    nnoremap <D-N> :cprev<CR>
    nnoremap <D-6> :OtherWindowVertical<CR><C-^>:OtherWindowVertical<CR>

    " Testing these for folding methods
    " set foldmethod=syntax
    " nnoremap <D-=> :set foldlevel=10<CR>
    " nnoremap <D--> :set foldlevel=0<CR>
endif

"
"      --- Settings ---
" -------------------------------------------------
set splitright             " Puts new v-split to the right of the current
set splitbelow             " Puts new split windows to the bottom
set ignorecase             " Case insensitive searches
set incsearch              " Incremental searches
set smartcase              " Case sensitive when wanted
set hlsearch               " Highlight all the search results
highlight       Search    ctermfg=Red ctermbg=Yellow guifg=Red guibg=Yellow

set tabstop=4              " Tab Stop at 4 unless plugin overwrites it
set shiftwidth=4
set expandtab              " Always use spaces instead of tabs
set autoread               " Read a file that has changed on disk
set autowrite              " Auto write to disk when buffer is changed
set autowriteall
set hidden                 " Allow modified buffers in the background
set ruler
set modeline               " Allow modeline ( :help modeline )
set mouse=a                " Use the mouse for things like resizing windows
set noshowmode             " Doesn't show what mode you're in
set cursorline             " Show the horizontal bar where the cursor is
set scrolloff=8            " Keep cursor 8 lines from top and bottom while scrolling

set nobackup               " don't use backup files
set nowb                   " don't use backup files
set noswapfile             " don't use swap files
set foldlevel=10           " Start out without a lot of folds

" undo all the things
if has('persistent_undo')
    set undolevels=5000
    set undodir=$HOME/.vim/.VIM_UNDO_FILES
    set undofile
endif

" I don't want to pull up these folders/files when calling my fuzzy finder
set wildignore+=*/vendor/**
set wildignore+=*/target/**
set wildignore+=*/cli/**
set wildignore+=*/logs/**
set wildignore+=*/sql/**
set wildignore+=*/tools/**
set wildignore+=*/docroot/res/out/**
set wildignore+=*.swp
set wildignore+=*.bak

" Re-add these since i want my fuzzy finder to find them
set wildignore-=*.thrift
set wildignore-=*.sql

" NOTE: don't get rid of this
:noh

if has("gui_running")
  " use the terminal colors
  set t_Co=0
endif

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
