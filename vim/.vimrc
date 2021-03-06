set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ************ Plugins Start ************************

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Identify and close brackets
Plugin 'tpope/vim-surround'

" Easy code comments
Plugin 'preservim/nerdcommenter'

" File explorer
Plugin 'preservim/nerdtree'

" Tag files
Plugin 'preservim/tagbar'

" Auto-Complete
Plugin 'Valloric/YouCompleteMe'

" Set nord color theme
Plugin 'arcticicestudio/nord-vim'

" Sytax check
Plugin 'vim-syntastic/syntastic'

" Black 
Plugin 'psf/black'

" Auto Indent
Plugin 'Vimjas/vim-python-pep8-indent'

" vimtex
Plugin 'lervag/vimtex'

" markdown toggle
Plugin 'JamshedVesuna/vim-markdown-preview'
" ************ Plugins End ************************
call vundle#end()            " required
filetype plugin indent on    " required

" Non-Plugin realated config

" Set line numbers by default
set number

" Set syntax on by default
syntax on

" Smart case searching
set smartcase

" Highlight search results
set hlsearch

" Search things as i type
set incsearch

" Set regex magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Colors and font config
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" No backup --> got to live on the edge
set nobackup
set nowb
set noswapfile

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Set color theme
colorscheme nord

" ycm window close after
let g:ycm_autoclose_preview_window_after_completion=1

" indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" latex 
let g:vimtex_view_method = 'zathura'
" latex autocomplete with YCM
if !exists('g:ycm_semantic_triggers')
let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

"makrdown github
let vim_markdown_preview_github=1

let g:syntastic_python_checkers = ['pycodestyle']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checker_args='--ignore=E501'
