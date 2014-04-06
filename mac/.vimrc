if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" VimShell required vimproc
NeoBundle 'Shougo/vimproc', {
 \ 'build' : {
 \     'windows' : 'make -f make_mingw32.mak',
 \     'cygwin' : 'make -f make_cygwin.mak',
 \     'mac' : 'make -f make_mac.mak',
 \     'unix' : 'make -f make_unix.mak',
 \    },
 \ }

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'everzet/phpfolding.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'fholgado/minibufexpl.vim'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'tyru/operator-camelize.vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'vexxor/phpdoc.vim'
NeoBundle 'heavenshell/vim-jsdoc'
NeoBundle 'Shougo/neomru.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
"
" Note: You don't set neobundle setting in .gvimrc!

" ...

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck


set nobackup
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
syntax on
autocmd BufRead,BufNewFile *.ctp set filetype=php
autocmd BufRead,BufNewFile *.inc set filetype=php
autocmd BufRead,BufNewFile *.tpl set filetype=php 
autocmd BufRead,BufNewFile *.inc.tpl set filetype=css

map ¥ <leader>

" taglist
" ctagsのパス
" let Tlist_Ctags_Cmd = '"/opt/local/bin/ctags"'
let Tlist_Ctags_Cmd = '"/usr/local/bin/ctags"'
" 現在編集中のソースのタグしか表示しない
let Tlist_Show_One_File = 1
" taglistのウィンドウが最後のウィンドウだったらVimを閉じる
let Tlist_Exit_OnlyWindow = 1
" 画面右側に表示
let Tlist_Use_Right_Window = 1
" PHPのclass,constant,functionのみをリスト化
let tlist_php_settings = 'php;c:class;d:constant;f:function'
" JavaScriptのclass,method,functionのみをリスト化
let g:tlist_javascript_settings = 'javascript;c:class;m:method;f:function'
" ソート順(order or name)
let Tlist_Sort_Type = "name"
" map to [\tl]
map <silent> <leader>tl :TlistToggle<cr>

" map to [\nt]
map <silent> <leader>nt :NERDTreeToggle<cr>
" map to [\ntf]
map <silent> <leader>ntf :NERDTreeFind<cr>

let &termencoding = &encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2,utf-8

" ビジュアルモードで選択したテキストをクリップボードに入れる
" 非GUI版の設定
" set clipboard=autoselect
" GUI版の設定
set guioptions+=a

" yankしたテキストをクリップボードに入れる
set clipboard+=unnamed

" カーソル行をハイライト
autocmd WinEnter *  setlocal cursorline
autocmd WinLeave *  setlocal nocursorline
set cursorline

" インデント表示
" autoで色付けするのはストップ
let g:indent_guides_auto_colors = 0
" 奇数行の指定
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#121212 ctermbg=233
" 偶数行の指定
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=235
" 起動時に自動的にオフ
let g:indent_guides_enable_on_vim_startup = 0
" インデントの色付け幅
let g:indent_guides_guide_size = 1

let g:unite_enable_start_insert = 1
noremap <C-U><C-B> :Unite buffer<CR>
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
noremap <C-U><C-R> :Unite file_mru<CR>
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

let g:neocomplcache_enable_at_startup = 1

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" vim-ref
" let $PATH = $PATH . ';D:\Program Files (x86)\Lynx for Win32'
" let g:ref_alc_encoding = 'cp932'

" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

" NERDCommenter
" コメントした後に挿入するスペースの数
let NERDSpaceDelims = 1
" キーマップの変更。<Leader>=\+cでコメント化と解除を行う。
" コメントされていれば、コメントを外し、コメントされてなければコメント化する。
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

" map to [\kwbd]
map <silent> <leader>kwbd :Kwbd<cr>

" phpfolding
augroup vimrc
    autocmd FileType phpunit EnableFastPHPFolds
augroup END

"" syntastic
"" let g:syntastic_mode_map = { 'mode': 'active',
"  " \ 'active_filetypes': [],
"  " \ 'passive_filetypes': ['html'] }
"" let g:syntastic_auto_loc_list = 1
"" let g:syntastic_javascript_checker = 'jshint'
"" let g:syntastic_javascript_checker = 'gjslint'

" operator-camelize
map <Leader>cml <Plug>(operator-camelize)
map <Leader>snk <Plug>(operator-decamelize)

" switch.vim
" http://www.vimninjas.com/2012/09/12/switch/
let g:variable_style_switch_definitions = [
\   {
\     'true': {
\       'true': 'false'
\     },
\
\     'false': {
\       'false': 'true'
\     },
\
\     'show': {
\       'show': 'hide'
\     },
\
\     'hide': {
\       'hide': 'show'
\     },
\   }
\ ]
nnoremap + :call switch#Switch(g:variable_style_switch_definitions)<cr>
nnoremap - :Switch<cr>

" PHP doc
" map to [\pd]
noremap <leader>pd :call PhpDoc()<CR>

" JSDoc
" map to [\jd]
map <silent> <leader>jd :JsDoc<cr>
