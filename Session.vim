let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
map! <D-v> *
nnoremap  h
nnoremap <NL> j
nnoremap  k
nnoremap  l
nnoremap  o
nnoremap <silent>  :CtrlP
nnoremap   za
nmap <silent> ,w,y <Plug>VimwikiMakeYesterdayDiaryNote
nmap <silent> ,w,t <Plug>VimwikiTabMakeDiaryNote
nmap <silent> ,w,w <Plug>VimwikiMakeDiaryNote
nmap <silent> ,w,i <Plug>VimwikiDiaryGenerateLinks
nmap <silent> ,wi <Plug>VimwikiDiaryIndex
nmap <silent> ,ws <Plug>VimwikiUISelect
nmap <silent> ,wt <Plug>VimwikiTabIndex
nmap <silent> ,ww <Plug>VimwikiIndex
nmap ,hp <Plug>GitGutterPreviewHunk
nmap ,hr <Plug>GitGutterUndoHunk:echomsg ',hr is deprecated. Use ,hu'
nmap ,hu <Plug>GitGutterUndoHunk
nmap ,hs <Plug>GitGutterStageHunk
nnoremap ,d :NERDTreeToggle
vnoremap ,y "+y
nnoremap ,r :TestFile
nnoremap ,1 :set number!
nnoremap ,c :SyntasticCheck:Errors
nnoremap ,s :mksession
nnoremap ,  :noh
nnoremap ,l :call ToggleNumber()
nnoremap ,sv :source $MYVIMRC
nnoremap ,ez :vsp ~/.zshrc
nnoremap ,et :exec ":vsp /Users/dblack/notes/vim/" . strftime('%m-%d-%y') . ".md"
nnoremap ,ev :vsp $MYVIMRC
nnoremap ,m :silent make|redraw!|cw
nnoremap ,o :only
vnoremap J :m '>+1gv=gv
vnoremap K :m '<-2gv=gv
nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk
xmap ac <Plug>GitGutterTextObjectOuterVisual
omap ac <Plug>GitGutterTextObjectOuterPending
nmap cgc <Plug>ChangeCommentary
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
nmap gcu <Plug>Commentary<Plug>Commentary
nmap gcc <Plug>CommentaryLine
omap gc <Plug>Commentary
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
nnoremap gV `[v`]
xmap ic <Plug>GitGutterTextObjectInnerVisual
omap ic <Plug>GitGutterTextObjectInnerPending
nnoremap j gj
nnoremap k gk
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
nmap <silent> <Plug>CommentaryUndo <Plug>Commentary<Plug>Commentary
nnoremap <silent> <Plug>GitGutterPreviewHunk :GitGutterPreviewHunk
nnoremap <silent> <Plug>GitGutterUndoHunk :GitGutterUndoHunk
nnoremap <silent> <Plug>GitGutterStageHunk :GitGutterStageHunk
nnoremap <silent> <expr> <Plug>GitGutterPrevHunk &diff ? '[c' : ":\execute v:count1 . 'GitGutterPrevHunk'\"
nnoremap <silent> <expr> <Plug>GitGutterNextHunk &diff ? ']c' : ":\execute v:count1 . 'GitGutterNextHunk'\"
xnoremap <silent> <Plug>GitGutterTextObjectOuterVisual :call gitgutter#hunk#text_object(0)
xnoremap <silent> <Plug>GitGutterTextObjectInnerVisual :call gitgutter#hunk#text_object(1)
onoremap <silent> <Plug>GitGutterTextObjectOuterPending :call gitgutter#hunk#text_object(0)
onoremap <silent> <Plug>GitGutterTextObjectInnerPending :call gitgutter#hunk#text_object(1)
nnoremap <SNR>19_: :=v:count ? v:count : ''
nmap <S-Tab> :bNext         " For fast moving through buffers
vmap <BS> "-d
vmap <D-x> "*d
vmap <D-c> "*y
vmap <D-v> "-d"*P
nmap <D-v> "*P
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set belloff=all
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set encoding=utf-8
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set foldlevelstart=10
set helplang=en
set highlight=8:SpecialKey,~:EndOfBuffer,@:NonText,d:Directory,e:ErrorMsg,i:IncSearch,l:Search,m:MoreMsg,M:ModeMsg,n:LineNr,N:CursorLineNr,r:Question,s:StatusLine,S:StatusLineNC,c:VertSplit,t:Title,v:Visual,V:VisualNOS,w:WarningMsg,W:WildMenu,f:Folded,F:FoldColumn,A:DiffAdd,C:DiffChange,D:DiffDelete,T:DiffText,>:SignColumn,-:Conceal,B:SpellBad,P:SpellCap,R:SpellRare,L:SpellLocal,+:Pmenu,=:PmenuSel,x:PmenuSbar,X:PmenuThumb,*:TabLine,#:TabLineSel,_:TabLineFill,!:CursorColumn,.:CursorLine,o:ColorColumn,q:QuickFixLine,z:StatusLineTerm,Z:StatusLineTermNC,N:DiffText
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set modelines=1
set pastetoggle=,p
set runtimepath=~/.vim,~/.vim/plugged/vim-airline/,~/.vim/plugged/ctrlp.vim/,~/.vim/plugged/vim-test/,~/.vim/plugged/vim-fugitive/,~/.vim/plugged/vim-gitgutter/,~/.vim/plugged/nerdtree/,~/.vim/plugged/syntastic/,~/.vim/plugged/nerdtree-git-plugin/,~/.vim/plugged/vim-commentary/,~/.vim/plugged/vim-airline-themes/,~/.vim/plugged/vimwiki/,~/.vim/plugged/base16-vim/,~/.vim/plugged/vim-colors-solarized/,~/.vim/plugged/badwolf/,~/.vim/plugged/editorconfig-vim/,~/.vim/plugged/nagios.vim/,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim80,/usr/local/share/vim/vimfiles/after,~/.vim/after
set shiftwidth=4
set showcmd
set showmatch
set showtabline=2
set softtabstop=4
set splitbelow
set splitright
set tabline=%!airline#extensions#tabline#get()
set tabstop=4
set termguicolors
set wildignore=*.o,*.rej,*/tmp/*,*.so,*.swp,*.zip,*\\tmp\\*,*.swp,*.zip,*.exe
set wildmenu
set window=36
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/minidot
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 vimrc
argglobal
silent! argdel *
$argadd vimrc
edit vimrc
set splitbelow splitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
vnoremap <buffer> <silent> [" :exe "normal! gv"|call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
nnoremap <buffer> <silent> [" :call search('\%(^\s*".*\n\)\%(^\s*"\)\@!', "bW")
vnoremap <buffer> <silent> [] m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "bW")
nnoremap <buffer> <silent> [] m':call search('^\s*endf*\%[unction]\>', "bW")
vnoremap <buffer> <silent> [[ m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "bW")
nnoremap <buffer> <silent> [[ m':call search('^\s*fu\%[nction]\>', "bW")
vnoremap <buffer> <silent> ]" :exe "normal! gv"|call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
nnoremap <buffer> <silent> ]" :call search('^\(\s*".*\n\)\@<!\(\s*"\)', "W")
vnoremap <buffer> <silent> ][ m':exe "normal! gv"|call search('^\s*endf*\%[unction]\>', "W")
nnoremap <buffer> <silent> ][ m':call search('^\s*endf*\%[unction]\>', "W")
vnoremap <buffer> <silent> ]] m':exe "normal! gv"|call search('^\s*fu\%[nction]\>', "W")
nnoremap <buffer> <silent> ]] m':call search('^\s*fu\%[nction]\>', "W")
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal colorcolumn=
setlocal comments=sO:\"\ -,mO:\"\ \ ,eO:\"\",:\"
setlocal commentstring=\"%s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'vim'
setlocal filetype=vim
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=indent
setlocal foldmethod=marker
setlocal foldminlines=1
set foldnestmax=10
setlocal foldnestmax=10
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetVimIndent()
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\\
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255,#
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal lispwords=
setlocal nolist
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'vim'
setlocal syntax=vim
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tags=
setlocal termkey=
setlocal termsize=
setlocal textwidth=78
setlocal thesaurus=
setlocal noundofile
setlocal undolevels=-123456
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
2
normal! zo
28
normal! zo
35
normal! zo
let s:l = 22 - ((21 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
22
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
