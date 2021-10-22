" mac or ibis
let server = "obcx"
" 最低限のvimrc??
" https://qiita.com/takuyanin/items/b904519bd56033de3062
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8
"set bomb
set backspace=indent,eol,start
set expandtab
set tabstop=2
set shiftwidth=2
set splitright
set splitbelow
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set nobackup
set noswapfile
set fileformats=unix,dos,mac
set ruler
set number
set cursorline
set scrolloff=20
set laststatus=2
set modeline
set modelines=10
set statusline=%F         " ファイル名表示
set statusline+=%m        " 変更のチェック表示
set statusline+=%r        " 読み込み専用かどうか表示 
set statusline+=%h        " ヘルプページなら[HELP]と表示
set statusline+=%w\       " プレビューウインドウなら[Prevew]と表示 
set autoread
set noerrorbells visualbell t_vb=
set clipboard+=unnamed
set mouse=a

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" usefull?
" https://itchyny.hatenablog.com/entry/2014/12/25/090000
noremap Y y$
set display=lastline
set wrap
set pumheight=10
set showmatch
set matchtime=1
" READ ONLY when open swap file 
augroup swapchoice-readonly
  autocmd!
  autocmd SwapExists * let v:swapchoice = 'o'
augroup END

" commnd line ver.bash
" https://qiita.com/lighttiger2505/items/2f6e4686b8db051378c0
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" brackets complement
" https://qiita.com/shingargle/items/dd1b5510a0685837504a
" inoremap { {}<Left>
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap ( ()<ESC>i
" inoremap (<Enter> ()<Left><CR><ESC><S-o>

" make undo file
" https://qiita.com/tamanobi/items/8f013cce36881af8cee3
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" vim bigener 
" https://qiita.com/ysuzuki19/items/17988627d85adb87a322
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent
" コマンドモードの補完
set wildmenu
" 自動コメントアウト無効
"augroup auto_comment_off
"  autocmd!
"  autocmd BufEnter * setlocal formatoptions-=r
"  autocmd BufEnter * setlocal formatoptions-=o
" ファイルタイプ
if has("autocmd")
  " ファイルタイプの検索を有効にする
  filetype plugin on
  " ファイルタイプに合わせたインデントを利用
  filetype indent on
  " sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
  autocmd FileType c           setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
endif

" 勝手なindentをさせない
" https://kekaku.addisteria.com/wp/20170621231629
"挿入モードを抜けるとき、set nopaste を実行する。
autocmd InsertLeave * set nopaste
"cpと打つと ペーストモードになる
nnoremap cp :set paste<CR>

" original
set showcmd
set background=dark
set wildmenu
set t_Co=256
syntax on
"colorscheme monokai
if "mac" == server
    "echo server
    "set autoindent
endif
autocmd FileType * setlocal formatoptions-=ro


" map
nnoremap j gj
nnoremap k gk
nnoremap J 5j
nnoremap K 5k
