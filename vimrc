" gardart@gmail.com vim configuration
" Plugins {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'                   " shows a git diff in the 'gutter' (sign column)
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'sjl/badwolf'
Plug 'hzchirs/vim-material'
Plug 'editorconfig/editorconfig-vim'
" Plug 'crazy-canux/nagios.vim'
Plug 'SirVer/ultisnips' " | Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'pedrohdz/vim-yaml-folds'
call plug#end()
" }}}
" Colors {{{
syntax enable           " enable syntax processing
if has('termguicolors')
  set termguicolors     " use guifg/guibg instead of ctermfg/ctermbg in terminal
endif
colorscheme base16-monokai
" colorscheme badwolf
if (&term =~ '^xterm' && &t_Co == 256)     " https://github.com/microsoft/terminal/issues/832
  set t_ut= | set ttyscroll=1
endif
" }}}
" Misc {{{
scriptencoding utf-8
set encoding=utf-8
set backspace=indent,eol,start
if exists('&belloff')
  set belloff=all                     " never ring the bell for any reason
endif
" }}}
" Spaces & Tabs {{{
set tabstop=2           " 2 space tab
set expandtab           " use spaces for tabs
set softtabstop=2       " 2 space tab
set shiftwidth=2
set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}
" UI Layout {{{
set number              " show line numbers
set highlight+=N:DiffText             " make current line number stand out a little
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
" Automation for numbering modes
" Automatically switch to absolute line numbers when in insert mode
" and relative numbers when in normal mode
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
autocmd FocusLost * :set norelativenumber
autocmd FocusGained * :set relativenumber

"set fillchars+=vert:┃
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Splitting {{{
if has('windows')
  set splitbelow                      " open horizontal splits below current window
endif
if has('vertsplit')
  set splitright                      " open vertical splits to the right of the current window
endif
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1
" set foldlevelstart=99   " start unfolded
" }}}
" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
" }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <Leader>o :only<CR>
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>         " Edit vimrc
nnoremap <leader>ez :vsp ~/.zshrc<CR>         " Edit zshrc
nnoremap <leader>sv :source $MYVIMRC<CR>         " Source vimrc
nnoremap <leader><space> :noh<CR>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>l :call ToggleNumber()<CR>
nnoremap <leader>1 :set number!<CR>
vnoremap <leader>y "+y
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
" surround word
nnoremap <leader>" ciw"<C-r>""<esc>
nnoremap <leader>' ciw'<C-r>"'<esc>
nnoremap <leader>{ ciw{<C-r>"}<esc>
nnoremap <leader>( ciw(<C-r>")<esc>
nnoremap <leader>[ ciw[<C-r>"]<esc>
nnoremap <leader>< ciw<<C-r>"><esc>
" surround selection
vnoremap <leader>" c"<C-r>""<esc>
vnoremap <leader>' c'<C-r>"'<esc>
vnoremap <leader>{ c{<C-r>"}<esc>
vnoremap <leader>( c(<C-r>")<esc>
vnoremap <leader>[ c[<C-r>"]<esc>
vnoremap <leader>< c<<C-r>"><esc>
nnoremap <Leader><Leader> <C-^>         " <Leader><Leader> -- Open last buffer.
set pastetoggle=<leader>p
" }}}
" Normal mode mappings {{{
nmap <S-tab> :bNext<cr>         " For fast moving through buffers
" Faster switching between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-o> <C-w>o
" }}}
" Visual mode mappings {{{
" move selected block up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" }}}
" Snippets {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}
" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|target/|\.(o|swp|pyc|egg|git)$'
if has('wildignore')
  set wildignore+=*.o,*.rej           " patterns to ignore during file-navigation (like fuzzy find ctrl-p plugin)
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
endif
" }}}
" Syntastic {{{
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']
let g:syntastic_python_python_exec = 'python3'
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal ft=markdown
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END
" }}}
" Testing {{{
let test#strategy = 'basic'
let test#python#runner = 'nose'
" }}}
" ALE {{{
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" airline {{{
set laststatus=2
" let g:airline_theme = 'badwolf'
let g:airline_theme = 'solarized'
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1    " Automatically displays all buffers when theres only one tab open
" }}}
" Custom Functions {{{
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! <SID>CleanFile()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %!git stripspace
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
"
" vim:foldmethod=marker:foldlevel=0
