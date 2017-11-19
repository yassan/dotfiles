"dein Scripts-----------------------------
"complete.vim
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " ファイルツリー表示
  call dein#add('scrooloose/nerdtree')

  " 入力補完 
  call dein#add('Shougo/neocomplete.vim')

  " GitのVim-wrapper
  call dein#add('tpope/vim-fugitive')
  
  " 多機能セレクタ https://github.com/ctrlpvim/ctrlp.vim
  "call dein#add('ctrlpvim/ctrlp.vim'
  
  " 色付け
  call dein#add('flazz/vim-colorschemes')
  call dein#add('altercation/vim-colors-solarized')
  
  " 文法チェック
  call dein#add('scrooloose/syntastic.git')
  
  " vimdiffの比較アルゴリズムの変更
  call dein#add('lambdalisue/vim-unified-diff')
  
  " ヘルプの日本語
  call dein#add('vim-jp/vimdoc-ja')
  
  " インデントの可視化
  call dein#add('nathanaelkane/vim-indent-guides')
  
  " モジュール名で Shift+k でPODが開く
  call dein#add('hotchpotch/perldoc-vim')

  " Perlのシンタックス
  call dein#add('vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' })  

  " シンタックスチェック
  call dein#add('scrooloose/syntastic')

  " perlの入力補完
  call dein#add('c9s/perlomni.vim')

  " ctagの作成
  call dein#add('soramugi/auto-ctags.vim')

  " color scheme
  call dein#add('vim-scripts/Zenburn')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
"
if executable('jvgrep')
  set grepprg=jvgrep
endif

set background=dark
colorscheme zenburn
" colorscheme solarized

" 表示設定 ###############################
" East_Asian_Width 特性の Ambiguous（曖昧)（文脈によって文字幅が異なる文字）
" については文字幅を2倍にする
" →日本語の場合に文字幅を2倍にして表示してつぶれるのを防ぐ
set ambiwidth=double
" タブ入力を複数の空白入力に置き換える
set expandtab
" 自動的に挿入されるときの幅('sw')
set shiftwidth=4
" タブを表示するときの幅('ts')
set tabstop=4
"キーボードで<Tab>キーを押した時に挿入される空白の量。
"'softtabstop'が0以外の時には、例え'ts'を4に設定していても、<Tab>を1度押しても's
"ofttabstop'分だけ空白を挿入。
"逆に'softtabstop'が0の場合には挿入されるのは'ts'で指定した量になります。
set softtabstop=4
" タブを挿入するときの幅('st')
" set shiftwidth=4

" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent

" カレント行に横線を表示
set cursorline
set cursorcolumn
" ステータスバー##########################
" ステータスバーを常時表示
set laststatus=2
"ファイルナンバー表示
set statusline=[%n]
"ホスト名表示
set statusline+=%{matchstr(hostname(),'\\w\\+')}@
"ファイル名表示
set statusline+=%<%F
"変更のチェック表示
set statusline+=%m
"読み込み専用かどうか表示
set statusline+=%r
"ヘルプページなら[HELP]と表示
set statusline+=%h
"プレビューウインドウなら[Prevew]と表示
set statusline+=%w
"ファイルフォーマット表示
set statusline+=[%{&fileformat}]
"文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
"ファイルタイプ表示
set statusline+=%y
"ここからツールバー右側
set statusline+=%=
"文字バイト数/カラム番号
set statusline+=[ASCII=%B]
"現在文字列/全体列表示
set statusline+=[C=%c/%{col('$')-1}]
"現在文字行/全体行表示
set statusline+=[L=%l/%L]
"現在行が全体行の何%目か表示
set statusline+=[%p%%]
" Gitのbranch名を表示
set statusline+=[%{fugitive#statusline()}]

" for Syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ########################################

" For neosnippet {{
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
" 個人用スニペット置き場
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='$HOME/.vim/bundle/vim-snippets'
" }}

" テンプレート設定
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl-script.txt
autocmd BufNewFile *.t  0r $HOME/.vim/template/perl-test.txt
autocmd BufNewFile *.sh 0r $HOME/.vim/template/bash.txt

" ########################################
" For noecomplete {{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" メニューの一番目を自動選択
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType perl setlocal omnifunc=perlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}

" その他の設定 #############################################

" *.t *.psgi *.tt -> perl syntaxhighlight {{
augroup filetypedetect
autocmd! BufNewFile,BufRead *.t setf perl
autocmd! BufNewFile,BufRead *.psgi setf perl
autocmd! BufNewFile,BufRead *.tt setf tt2html
augroup END
" }}

"" MarkDown {{
" md as markdown, instead of modula2 {{
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"" }}
" Disable highlight italic in Markdown {{
autocmd FileType markdown hi! def link markdownItalic LineNr
"" }}

"" }}

" fold by indent in yml
autocmd BufNewFile,BufReadPost *{yml,.yml.liquid} setl foldmethod=indent nofoldenable

" .yml is ansible
autocmd BufNewFile,BufRead *.yml set filetype=yaml
" .yml.liquid (Embulk)
autocmd BufNewFile,BufRead *.liquid set filetype=yaml

"ctag {{
" 拡張子で読み込みタグを変更
au BufNewFile,BufRead *.pl,*.pm,*.t set tags+=.git/perl.tags,${HOME}/perl.ctags

" キーカーソル上の単語の定義元を新たなウィンドウで垂直に分割してジャンプ
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" キーカーソル上の単語の定義元を新たなウィンドウで水平に分割してジャンプ
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

if has("cscope")
    " cscopetagコマンド ':tags'、CTRL-]、そして 'vim -t' はデフォルトの:tagの代わりに、常に ':cstag'
    " を使うようになる。事実上、tagファイル と同じようにcscopeデータベースを検索することができるようになるだろう。省略した場合はオフ
    set nocst
    "'csto' の値は|:cstag|が検索を実行する順序を決定する。'csto'が0に設定されているならば、
    "先にcscopeデータベースが検索され、cscopeでは見つからなかった時にだけtagファイルが検索される。
    "'csto'が1ならば、cscopeデータベースの前にtagsファイルが検索される。省略値は0
    "set csto=1
endif
" }}

" For auto-ctags {{
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_args = '--tag-relative -R --fields=+KS --extra=+q'
let g:auto_ctags_filetype_mode = 1
" }}

" For Syntastic ###################################
" {{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']

let g:syntastic_yaml_yamlxs_exec = 1
"}}


" 配色関連 ##############################################
" vimdiffの配色変更 {{
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

" highlight DiffAdd    ctermfg=10 ctermbg=22
" highlight DiffDelete ctermfg=10 ctermbg=52
" highlight DiffChange ctermfg=10 ctermbg=17
" highlight DiffText   ctermfg=10 ctermbg=21
" }}

" インデントの可視化用の配色設定 {{
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
" }}

" キーバインド #########################################
" For perltidy - Perlのコード整形 {{
call system('which perltidy')
if ! v:shell_error
    " 実行コマンドTidyの定義
    command -range=% -nargs=* Tidy <line1>,<line2>!perltidy -q

    " Tidy実行前のカール位置を覚えておいて、Tidy実行後、そのカーソル位置に移動
    fun DoTidy()
        echo "Do Tidy"
        let l = line(".")
        let c = col(".")
        :Tidy
        call cursor(l, c)
    endfun

    " ビジュアルモードで選択して ,ptv と入力すると選択範囲だけ整形
    map ,ptv <Esc>:'<,'>! perltidy<CR>
    " ビジュアルモードで選択して ,pt と入力するとファイル全体に対してコード整形を実施
    map ,pt <Esc>:call DoTidy()<CR>

    " ファイル読み込み時及び保存時に実行
    autocmd BufWritePost,FileReadPost *.p[lm],*.t :silent call DoTidy()

endif
" }}
"

" For neosnippet {{
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
" 個人用スニペット置き場
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippets'
" }}

" テンプレート設定
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl-script.txt
autocmd BufNewFile *.t  0r $HOME/.vim/template/perl-test.txt
autocmd BufNewFile *.sh 0r $HOME/.vim/template/bash.txt

" ########################################
" For noecomplete {{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" メニューの一番目を自動選択
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType perl setlocal omnifunc=perlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}}

" その他の設定 #############################################

" *.t *.psgi *.tt -> perl syntaxhighlight {{
augroup filetypedetect
autocmd! BufNewFile,BufRead *.t setf perl
autocmd! BufNewFile,BufRead *.psgi setf perl
autocmd! BufNewFile,BufRead *.tt setf tt2html
augroup END
" }}

"" MarkDown {{
" md as markdown, instead of modula2 {{
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"" }}
" Disable highlight italic in Markdown {{
autocmd FileType markdown hi! def link markdownItalic LineNr
"" }}

"" }}

" fold by indent in yml
autocmd BufNewFile,BufReadPost *{yml,.yml.liquid} setl foldmethod=indent nofoldenable

" .yml is ansible
autocmd BufNewFile,BufRead *.yml set filetype=yaml
" .yml.liquid (Embulk)
autocmd BufNewFile,BufRead *.liquid set filetype=yaml

"ctag {{
" 拡張子で読み込みタグを変更
au BufNewFile,BufRead *.pl,*.pm,*.t set tags+=.git/perl.tags,${HOME}/perl.ctags

" キーカーソル上の単語の定義元を新たなウィンドウで垂直に分割してジャンプ
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" キーカーソル上の単語の定義元を新たなウィンドウで水平に分割してジャンプ
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

if has("cscope")
    " cscopetagコマンド ':tags'、CTRL-]、そして 'vim -t' はデフォルトの:tagの代わりに、常に ':cstag'
    " を使うようになる。事実上、tagファイル と同じようにcscopeデータベースを検索することができるようになるだろう。省略した場合はオフ
    set nocst
    "'csto' の値は|:cstag|が検索を実行する順序を決定する。'csto'が0に設定されているならば、
    "先にcscopeデータベースが検索され、cscopeでは見つからなかった時にだけtagファイルが検索される。
    "'csto'が1ならば、cscopeデータベースの前にtagsファイルが検索される。省略値は0
    "set csto=1
endif
" }}

" For auto-ctags {{
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_args = '--tag-relative -R --fields=+KS --extra=+q'
let g:auto_ctags_filetype_mode = 1
" }}

" For Syntastic ###################################
" {{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']

let g:syntastic_yaml_yamlxs_exec = 1
"}}

