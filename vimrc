" ================================
" .vimrc klen <horneds@gmail.com>
" ================================

" vim: nowrap fdm=marker
scriptencoding utf-8

if !has('nvim')
  unlet! skip_defaults_vim
  source $VIMRUNTIME/defaults.vim
endif

" Julia
:let g:latex_to_unicode_auto = 1

source ~/dotfiles/packages.vim

" Personal preferences not set by sensible.vim
let g:mapleader=','
set history=5000
set showcmd
set nojoinspaces
set complete-=t
" set listchars=tab:▸\ ,eol:¬
set foldlevelstart=99
" set noswapfile
" Swaps and backups
if has("win32") || has("win64")
    set dir=$TMP
    set backupdir=$TMP
else
    set dir=/tmp
    set backupdir=/tmp
endif
if has('mouse')
  set mouse=nv
endif
set diffopt=filler,vertical
set ruler
set ignorecase
set smartcase
set incsearch
set smarttab

" Highlight characters past column 120
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=#c12a0f
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

"NERDTree
map <F1> :NERDTreeToggle<CR>    " browse the list of files in the current directory


" Unite settings
nnoremap <F2> :Unite buffer<CR> " browse a list of the currently opened buffers

" TaskList settings
map <F3> :TaskList<CR> " show pending tasks list

" TagBar settings
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " autofocus on Tagbar open

" ConqueTerm
nnoremap <F5> :ConqueTermSplit ipython<CR> " run python-scripts at <F5>
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR> " and debug-mode for <F6>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0

" Jedi-vim
let g:jedi#show_call_signatures = 1 " Show call signatures
let g:jedi#popup_on_dot = 1         " Enable autocomplete on dot
let g:jedi#popup_select_first = 0   " Disable first select from auto-complete

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height=5
noremap <f7> :w<CR>:SyntasticCheck<CR>
" let g:syntastic_mode_map = {
"       \ 'mode': 'passive',
"       \ 'active_filetypes': [
"       \   'javascript'
"       \ ],
"       \ 'passive_filetypes': [
"       \   'html',
"       \   'ruby'
"       \ ]
"       \ }
" let g:syntastic_ruby_checkers=['bx rubocop', 'mri']
" nnoremap ZS :SyntasticCheck<CR>
nnoremap ZT :SyntasticToggle<CR>

" Better :sign interface symbols
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = 'X'
let g:syntastic_warning_symbol = 'x'
let g:syntastic_style_warning_symbol = 'x'


" Python helping options
" http://python-guide-pt-br.readthedocs.io/en/latest/dev/env/"
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line 
" autocmd BufWritePost *.py call Flake8()
"=====================================================
" Python-mode settings
"=====================================================
" Keys:
" K Show python docs
" <Ctrl-Space> Rope autocomplete
" <Ctrl-c>g Rope goto definition
" <Ctrl-c>d Rope show documentation
" <Ctrl-c>f Rope find occurrences
" <Leader>b Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[ Jump on previous class or function (normal, visual, operator modes)
" ]] Jump on next class or function (normal, visual, operator modes)
" [M Jump on previous class or method (normal, visual, operator modes)
" ]M Jump on next class or method (normal, visual, operator modes)

" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
" let g:pymode_lint_checker = "pylint,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
" let g:pymode_run = 0

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

"=====================================================
" User hotkeys
"=====================================================
" Easier moving of code blocks
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-Z is Undo
" noremap <C-z> u
" inoremap <C-z> <C-O>u

" CTRL-Y is Redo
noremap <C-y> <C-R>
inoremap <C-y> <C-O><C-R>

" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" CTRL-S is Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Settings for buffers
map <C-q> :bd<CR>         " close current buffer
noremap <C-Right> :bn<CR> " move to next buffer
noremap <C-Left> :bp<CR>  " move to previous buffer

" Easier split navigations
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" Easier change size for splitted windows
nnoremap <M-[> :vertical resize +5<cr>
nnoremap <M-]> :vertical resize -5<cr>

" Activate autocomplete at <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" Generate and insert UUID4 into code by <F12> key
nnoremap <F12> :call InsertUUID4()<CR>

" Python code check on PEP8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

"=====================================================
" Languages support
"=====================================================
" --- C/C++/C# ---
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cs setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType c setlocal commentstring=/*\ %s\ */
autocmd FileType cpp,cs setlocal commentstring=//\ %s
let c_no_curly_error=1
let g:syntastic_cpp_include_dirs = ['include', '../include']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_c_include_dirs = ['include', '../include']
let g:syntastic_c_compiler = 'clang'

" --- Clojure ---
autocmd FileType clj setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType css setlocal commentstring=/*\ %s\ */

" --- Erlang ---
autocmd Filetype erlang setlocal omnifunc=erlang_complete#Complete

" --- JavaScript ---
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript let b:javascript_fold = 0
let javascript_enable_domhtmlcss=1
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_javascript_jshint_args='--config ~/.vim/extern-cfg/jshint.json'

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html setlocal commentstring=<!--\ %s\ -->

" --- Python ---
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
\ --max-line-length=80'

" --- Rust ---
set hidden
let g:racer_cmd = "/Users/savicvalera/racer/target/release/racer"
let $RUST_SRC_PATH = "/Users/savicvalera/rust/src"
autocmd BufRead,BufNewFile *.rs set filetype=rust
autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4
autocmd FileType rust setlocal commentstring=//\ %s

" --- Vim ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" --- template language support (SGML / XML too) ---
autocmd FileType xml,html,htmljinja,htmldjango setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-e> <Plug>SparkupExecute
autocmd FileType html,htmljinja,htmldjango imap <buffer> <c-l> <Plug>SparkupNext
autocmd FileType htmljinja setlocal commentstring={#\ %s\ #}
let html_no_rendering=1
let g:syntastic_html_checkers = []

"=====================================================
" User functions
"=====================================================
" Small helper that inserts a random uuid4
" ----------------------------------------
function! InsertUUID4()
python << endpython
if 1:
    import uuid, vim
    s = str(uuid.uuid4())
    cpos = vim.current.window.cursor
    cline = vim.current.line
    vim.current.line = cline[:cpos[1] + 1] + s + cline[cpos[1] + 1:]
    vim.current.window.cursor = (cpos[0], cpos[1] + len(s))
endpython
endfunction

if has('nvim')
  set inccommand=nosplit
endif

" Define a group for autocommands
augroup vimrc
  autocmd!
augroup END

function! FormatprgLocal(filter)
  if !empty(v:char)
    return 1
  else
    let l:command = v:lnum.','.(v:lnum+v:count-1).'!'.a:filter
    echo l:command
    execute l:command
  endif
endfunction

if has('autocmd')
  augroup ragtag_filetypes
    autocmd!
    autocmd FileType markdown    call RagtagInit()
  augroup END
  let g:pandoc_pipeline  = 'pandoc --from=html --to=markdown'
  let g:pandoc_pipeline .= ' | pandoc --from=markdown --to=html'
  autocmd vimrc FileType html setlocal formatexpr=FormatprgLocal(pandoc_pipeline)
endif

" Colorscheme
set termguicolors
set background=dark
silent! colorscheme solarized8_dark

set hidden
set hls

" Plugin configuration {{{1
" netrw.vim {{{2
let g:netrw_banner=0
" Don't show undo files in the explorer
let g:netrw_list_hide='\.un\~$'
" neomake {{{2

let g:neomake_javascript_enabled_makers = ['eslint']
if exists(':Neomake')
  autocmd! vimrc BufWritePost * Neomake
endif

" if emoji#available()
"   let g:neomake_warning_sign = { 'text': emoji#for('exclamation') }
"   let g:neomake_error_sign   = { 'text': emoji#for('x') }
"   let g:neomake_info_sign    = { 'text': emoji#for('8ball') }
"   let g:neomake_message_sign = { 'text': emoji#for('pencil2') }
" endif


" Vim-ruby {{{2
" let ruby_fold=1
" Vim-rspec {{{2
" map <Leader>t :w<bar>:call RunCurrentSpecFile()<CR>
" map <Leader>s :w<bar>:call RunNearestSpec()<CR>
" map <Leader>l :w<bar>:call RunLastSpec()<CR>
" map <Leader>a :w<bar>:call RunAllSpecs()<CR>
" let g:rspec_command = 'Dispatch rspec {spec}'
" Markdown {{{2
" let g:markdown_fenced_languages = ['ruby', 'javascript']
" FIXME:
" Markdown files have foldmethod=syntax when both of these options are set:
" let ruby_fold=1
" let g:markdown_fenced_languages = ['ruby', 'javascript']
" to debug, run :verbose set foldmethod?
"

" Solarized8
nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
      \ ? substitute(g:colors_name, 'dark', 'light', '')
      \ : substitute(g:colors_name, 'light', 'dark', '')
      \ )<cr>

function! Solarized8Contrast(delta)
  let l:schemes = map(['_low', '_flat', '', '_high'], '"solarized8_".(&background).v:val')
  exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
endfunction

nmap <leader>- :<c-u>call Solarized8Contrast(-v:count1)<cr>
nmap <leader>+ :<c-u>call Solarized8Contrast(+v:count1)<cr>
" Ctlr-P {{{2
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'find %s -type f'

" Denite {{{2
" vim/after/plugin/denite.vim
" Ragel {{{2
augroup ragel
  autocmd!
  autocmd BufNewFile,BufRead *.rl setfiletype ragel
augroup END
let g:ragel_default_subtype='ruby'

" Mappings and commands {{{1
" Override defaults {{{2
nnoremap Q <Nop>
command! -nargs=0 -bang Qa qall!
command! -nargs=0 -bang QA qall!
" File opening {{{2
cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Prompt to open file with same name, different extension
map <leader>er :e <C-R>=expand("%:r")."."<CR>


" Fix the & command in normal+visual modes {{{2
nnoremap & :&&<Enter>
xnoremap & :&&<Enter>

" Strip trailing whitespace {{{2
function! Preserve(command)
  let l:save = winsaveview()
  execute a:command
  call winrestview(l:save)
endfunction

command! TrimWhitespace call Preserve("%s/\\s\\+$//e")
nmap _$ :TrimWhitespace<CR>

" Visual line repeat {{{2
xnoremap . :normal .<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()

  echo '@'.getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Experimental mappings {{{2
nnoremap g" /\v<<C-r>"><CR>

command! Path :call EchoPath()
function! EchoPath()
  echo join(split(&path, ','), "\n")
endfunction

command! TagFiles :call EchoTags()
function! EchoTags()
  echo join(split(&tags, ','), "\n")
endfunction

nmap cp <Plug>TransposeCharacters
nnoremap  <Plug>TransposeCharacters xp
\:call repeat#set("\<Plug>TransposeCharacters")<CR>

" ember-cli {{{2
command! -nargs=* Ember :echo system('ember <args>')

if exists('*smartinput#define_rule')
  call smartinput#clear_rules()
  call smartinput#define_rule({
        \'at': '{\%#',
        \'char': '{',
        \'input': '{}}<Left><Left>',
        \'filetype': ['html.handlebars']
        \ })
  call smartinput#define_rule({
        \'at': '\%#}}',
        \'char': '}',
        \'input': '<Right><Right>',
        \'filetype': ['html.handlebars']
        \ })
  call smartinput#define_rule({
        \'at': '}}\%#',
        \'char': '}',
        \'input': '',
        \'filetype': ['html.handlebars']
        \ })
  call smartinput#define_rule({
        \'at': '{{\%#}}',
        \'char': '<BS>',
        \'input': '<BS><BS><Del><Del>',
        \'filetype': ['html.handlebars']
        \ })
  call smartinput#define_rule({
        \'at': '{{}}\%#',
        \'char': '<BS>',
        \'input': '<BS><BS><BS><BS>',
        \'filetype': ['html.handlebars']
        \ })
endif

augroup javascript
  autocmd!
  autocmd FileType javascript setlocal suffixesadd+=.debug.js,.js
augroup END

let g:mustache_operators=0

augroup emoji_complete
  autocmd!
  autocmd FileType markdown setlocal completefunc=emoji#complete
augroup END

" if exists(':terminal')
"   noremap <expr> <C-\><C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"   autocmd vimrc TermOpen * nnoremap <buffer> I I<C-a>
"   autocmd vimrc TermOpen * nnoremap <buffer> A A<C-e>
"   autocmd vimrc TermOpen * nnoremap <buffer> C i<C-k>
"   autocmd vimrc TermOpen * nnoremap <buffer> D i<C-k><C-\><C-n>
"   autocmd vimrc TermOpen * nnoremap <buffer> cc i<C-e><C-u>
"   autocmd vimrc TermOpen * nnoremap <buffer> dd i<C-e><C-u><C-\><C-n>
" endif

" https://github.com/neovim/neovim/pull/2076#issuecomment-76998265
nnoremap <a-h> <c-w>h
nnoremap <a-j> <c-w>j
nnoremap <a-k> <c-w>k
nnoremap <a-l> <c-w>l
vnoremap <a-h> <c-\><c-n><c-w>h
vnoremap <a-j> <c-\><c-n><c-w>j
vnoremap <a-k> <c-\><c-n><c-w>k
vnoremap <a-l> <c-\><c-n><c-w>l
inoremap <a-h> <c-\><c-n><c-w>h
inoremap <a-j> <c-\><c-n><c-w>j
inoremap <a-k> <c-\><c-n><c-w>k
inoremap <a-l> <c-\><c-n><c-w>l
cnoremap <a-h> <c-\><c-n><c-w>h
cnoremap <a-j> <c-\><c-n><c-w>j
cnoremap <a-k> <c-\><c-n><c-w>k
cnoremap <a-l> <c-\><c-n><c-w>l
if has('nvim')
  tnoremap <a-h> <c-\><c-n><c-w>h
  tnoremap <a-j> <c-\><c-n><c-w>j
  tnoremap <a-k> <c-\><c-n><c-w>k
  tnoremap <a-l> <c-\><c-n><c-w>l
  tnoremap <Esc> <C-\><C-n>
endif

" Status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Vim-Airline status line
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Easyclip 
set clipboard=unnamed
let g:EasyClipAutoFormat=1
let g:EasyClipCopyExplicitRegisterToDefault=1
let g:EasyClipShareYanks=0
" let g:EasyClipUseSubstituteDefaults=1
let g:EasyClipAlwaysMoveCursorToEndOfPaste=1 " to have the cursor positioned at the end
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
" xmap gs p
xmap gs <plug>XEasyClipPaste
nnoremap gm m
" let g:EasyClipUseCutDefaults = 0
" nmap x <Plug>MoveMotionPlug
" xmap x <Plug>MoveMotionXPlug
" nmap xx <Plug>MoveMotionLinePlug
 
" From vim../doc/russian.txt: enables standar keys in Russian keyboard
:set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Yank and highlight, see
" https://stackoverflow.com/questions/26069278/hightlight-copied-area-on-vim
noremap <expr> <Plug>(yank-highlight) operator#sequence#map("y", "\<Plug>(operator-highlight)")
nmap <Leader>y <Plug>(yank-highlight)
vmap <Leader>y <Plug>(yank-highlight)
let g:operator#highlight#clear_time=2.0

if filereadable(".init.vim")
  source ".init.vim"  " Load local vim settings
endif
