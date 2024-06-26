" version 1.2.0
"
" VIM settings {{{1
" Basic settings {{{2
scriptencoding utf-8

" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

if &compatible
  set nocompatible               " Be iMproved
endif
set t_Co=256

if !has('nvim')
  unlet! skip_defaults_vim
  if filereadable("$VIMRUNTIME/defaults.vim")
    source $VIMRUNTIME/defaults.vim
  endif
endif

let mapleader = " "
let localleader = "\\"

set number
set nowrap
set smartindent
set backspace=indent,eol,start
set diffopt=filler,vertical
set ruler
set ignorecase
set smartcase
set complete-=i
set smarttab
set nrformats-=octal
set wildmenu
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
    setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
    set shell=/usr/bin/env\ bash
endif

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
set viewoptions-=options

" Python helping options http://python-guide-pt-br.readthedocs.io/en/latest/dev/env/
" Julia: https://github.com/invenia/BlueStyle
set textwidth=100 " lines longer than 100 columns will be broken
set shiftwidth=4  " operation >> indents  columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line 

set enc=utf-8    " utf-8 по дефолту в файлах
set laststatus=2 " всегда показываем статусбар
set noshowmode   " --INSERT-- is not necessary, the mode is shown at left end of status bar
set incsearch    " инкреминтируемый поиск
set hlsearch     " подсветка результатов поиска
set nu           " показывать номера строк
set scrolloff=1
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline
set hidden
set hls

set showmatch           " highlight matching [{()}]

" Enable mouse
set mouse=a

" Do not create backup files
set nobackup
set nowritebackup
set noswapfile

set showcmd
set nojoinspaces

set title

" List completions
set wildmode=longest:list,full

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz 

set list
set listchars=tab:»\ ,trail:·,extends:>,nbsp:.

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" Status line settings {{{3
" Always show status line
set laststatus=2

" ENABLE SAVING OF TAB TITLES FOR SESSIONS 
set sessionoptions+=tabpages,globals
set encoding=utf-8

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
set lazyredraw          " redraw only when we need to.
set exrc
set secure

set modeline

" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif


" Register plugins  {{{2
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
silent! if plug#begin('~/.vim/plugged')

    " Utilities  {{{3
    Plug 'junegunn/vim-easy-align'     " Easy alignment
    Plug 'tpope/vim-repeat'            " Repeat last change
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'vim-syntastic/syntastic'
    Plug 'easymotion/vim-easymotion'   " Fast motions
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'scrooloose/nerdcommenter'    " Comments <leader>cc,...
    Plug 'Xuyuanp/nerdtree-git-plugin' " Git flags in NerdTree pane
    Plug 'vim-voom/voom'               " two-pane text outliner: Voom, Voomhelp, Voomexec, Voomlog

    if executable("ag") || executable("ack")
        Plug 'mileszs/ack.vim'
    endif

    " Git support {{{3
    Plug 'airblade/vim-gitgutter'  " Mark changed lines
    Plug 'tpope/vim-fugitive'      " Git wrapper: Git, Gcommit, Gmove...
    Plug 'junegunn/gv.vim'         " git commit browser, GV, GV! GV?

    " if executable('ruby') && executable('git')
    "  Plug 'junegunn/vim-github-dashboard.git'
    " endif

    " Snippets support {{{3
    " if has('python') || has('python3')
    " Plug 'SirVer/ultisnips' 
    " Plug 'garbas/vim-snipmate'          " Snippets manager
    " Plug 'MarcWeber/vim-addon-mw-utils' " dependencies #1
    " Plug 'tomtom/tlib_vim'              " dependencies #2
    " Plug 'honza/vim-snippets'           " snippets repo
    " endif

    " Youcomplete, (not implemented) {{{3

    " if has("python") || has("python3")
    " function! BuildYCM(info)
        " " info is a dictionary with 3 fields
        " " - name:   name of the plugin
        " " - status: 'installed', 'updated', or 'unchanged'
        " " - force:  set on PlugInstall! or PlugUpdate!
        " if a:info.status == 'installed' || a:info.force
        " !./install.py
        " endif
    " endfunction

    " Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
    " Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
    " endif

    " Fuzzy file search, installes as external application {{{3
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    " Clipboard ring {{{3
    Plug 'svermeulen/vim-easyclip'

    " yank - Highlight copied area  {{{4
    " https://stackoverflow.com/questions/26069278/hightlight-copied-area-on-vim
    Plug 'kana/vim-operator-user'            " Lets user define their own operators.
    Plug 'thinca/vim-operator-sequence'      " Operator to do two or more operators.
    Plug 'osyo-manga/vim-operator-highlight' " the plugin for this.

    " Plugins for either Vim8 or NeoVim {{{3
    if has('nvim')
        Plug 'Shougo/denite.nvim'
        Plug 'machakann/vim-highlightedyank'
        Plug 'kassio/neoterm'
        Plug 'Shougo/neomru.vim'
    else
        Plug 'Shougo/unite.vim' " Navigation between buffers and files
    endif

    " Send code to REPL with C-C,C {{{3
    Plug 'jpalardy/vim-slime', { 'branch': 'main' }

    " Colorschemes  {{{3
    Plug 'lifepillar/vim-solarized8'
    Plug 'morhetz/gruvbox'  " colorscheme gruvbox
    Plug 'rakr/vim-one'
    Plug 'NLKNguyen/papercolor-theme'

    " File list and open
    Plug 'justinmk/vim-dirvish'

    " Fuzzy file, buffer, mru, tag, etc finder. http://kien.github.com/ctrlp.vim
    Plug 'ctrlpvim/ctrlp.vim'

    Plug 'majutsushi/tagbar'            " Class/module browser

    " Visual enhancements{{{3
    Plug 'vim-airline/vim-airline'      " Status line  
    Plug 'vim-airline/vim-airline-themes'
    
    Plug 'ryanoasis/vim-devicons'       " Icons in NerdTree and airline 

    Plug 'fisadev/FixedTaskList.vim'    " Pending tasks list

    " Julia {{{3
    Plug 'JuliaEditorSupport/julia-vim'
    " Check {'for': 'julia'} - so far, with this LaTeXtoUnicode is not loaded causing errors
    " on 'bigfoot', no errors  on 'k56'
    " see https://github.com/JuliaEditorSupport/julia-vim/issues/35
    Plug 'kdheepak/JuliaFormatter.vim', {'for': 'julia'}

    " Misc {{{3
    " to-do.txt
    Plug 'freitass/todo.txt-vim'
    " Plug 'thanthese/Tortoise-Typing')         " touch typing tutor


    " Markdown   {{{3
    
    if v:version >= 704
        Plug 'tpope/vim-markdown'
        Plug 'nelstrom/vim-markdown-folding'
        Plug 'junegunn/vim-emoji'
        Plug 'vim-pandoc/vim-criticmarkup'   " Comments, changes and notes in text and markdown files
        Plug 'vim-pandoc/vim-pandoc'         " Intergrates VIM and Pandoc
        Plug 'vim-pandoc/vim-pandoc-syntax'
        Plug 'vim-pandoc/vim-pandoc-after'   " Integrates Pandoc with thirdparty plugins       
        Plug 'dhruvasagar/vim-table-mode'    " Automates table creation
        Plug 'lervag/vimtex'                 " Latex support
    endif

    " Python  {{{3

    if has("python") || has("python3")
        Plug 'python-mode/python-mode', {'for': 'python' }       " Load for python modules
        Plug 'mitsuhiko/vim-python-combined', {'for': 'python' } " Combined Python 2/3 for Vim
        Plug 'nvie/vim-flake8'                                   " Static syntax and code checker Flake8
        Plug 'rosenfeld/conque-term'                             " Consoles as buffers
        Plug 'davidhalter/jedi-vim'                              " Jedi-vim autocomplete plugin
    endif
    Plug 'mitsuhiko/vim-jinja'                               " Jinja support for vim

    " MCNP  {{{3
    Plug 'g2boojum/vim-mcnp', {'for': 'mcnp'}              " MCNP syntax

    " Autocompletion on Awesome vim plugins {{{3
    Plug 'mbbill/undotree'
    
    " bats syntax {{{3
    Plug 'aliou/bats.vim'
    " requirements syntax
    Plug 'raimon49/requirements.txt.vim' ", {'for': 'requirements'}
    call plug#end()
endif

" VIM setup {{{2
if ! &diff
  tab sball
  set switchbuf=useopen
  :set diffopt=filler,context:3,iwhite
endif

" Julia setup {{{3
" Block-wise movements and selection.
" See :help julia-vim and  https://github.com/JuliaEditorSupport/julia-vim
" The default mappings use ]], ][, [[, [], ]j, ]J, [j, and [J for the movements
" and aj, ij for the selections.
runtime macros/matchit.vim
let g:latex_to_unicode_auto = 1
" Formatting
noremap <Leader>fb :call julia#toggle_function_blockassign()<CR>
" normal mode mapping
nnoremap <localleader>jf :JuliaFormatterFormat<CR>
" visual mode mapping
vnoremap <localleader>jf :JuliaFormatterFormat<CR>
let g:JuliaFormatter_options = {
        \ 'style' : 'blue',
        \ }

" Filetype configuration {{{3
filetype on
filetype plugin on
if has('autocmd')
    filetype plugin indent on
endif

" Don't freeze terminal on C-s, when in VIM
silent !stty -ixon                                                             
autocmd VimLeave * silent !stty ixon   

" Generic settings {{{4
augroup vimrc_autocmds
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
    autocmd BufRead,BufNewFile *.hpp,*.h++,*.hxx,*.cpp,*.c++,*.cxx set filetype=cpp.doxygen
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=#c12a0f
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp,julia set nowrap
augroup end

" C file settings {{{4
augroup filetype_c
    autocmd!
    autocmd FileType c,cpp setlocal cindent
augroup end

" Python file settings {{{4
if has("python") || has("python3")
  augroup filetype_python
      autocmd!
      if has('nvim')
          autocmd FileType python nnoremap <buffer> <F5> :vsplit \| ./%<CR>
          autocmd FileType python nnoremap <buffer> <F4> :vsplit \| ./% 
      else
          autocmd FileType python nnoremap <buffer> <F5> :!./%<CR>
          autocmd FileType python nnoremap <buffer> <F4> :!./% 
      endif
  augroup end
endif

"=====================================================
" Languages support
"=====================================================
" --- Python ---
autocmd FileType python set completeopt-=preview " раскомментируйте, в случае, если не надо, чтобы jedi-vim показывал документацию по методу/классу
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
            \ formatoptions+=croq softtabstop=4 smartindent
            \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" --- JavaScript ---
let javascript_enable_domhtmlcss=1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" --- template language support (SGML / XML too) ---
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd bufnewfile,bufread *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
autocmd BufRead,BufNewFile *.jl :set filetype=julia
let html_no_rendering=1
let g:closetag_default_xml=1
let g:sparkupNextMapping='<c-l>'
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" Vimscript file settings {{{4
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal nolinebreak
    " Insert <leader> and <Esc>
    autocmd FileType vim inoremap <buffer> <C-l>      <lt>leader>
    autocmd FileType vim inoremap <buffer> <C-V><Esc> <lt>Esc>
    autocmd FileType vim inoremap <buffer> <C-V><CR>  <lt>CR>
    autocmd FileType vim nnoremap <buffer> <F5> :source %<CR>
    autocmd FileType vim setlocal keywordprg=:help
augroup end

" Markdown file settings {{{4
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd filetype markdown setlocal linebreak
    autocmd filetype markdown nnoremap <buffer> j gj
    autocmd FileType markdown nnoremap <buffer> k gk
augroup end

" Latex {{{4
let g:tex_flavor = 'latex' "Уточняем какой Тех
"Отключаем автоматическое открытие окна Quickfix
let g:vimtex_quickfix_mode = 0

" Pandoc file settings {{{4
augroup filetype_pandoc
    autocmd!
    autocmd FileType pandoc setlocal wrap
    autocmd filetype pandoc setlocal linebreak
    autocmd filetype pandoc nnoremap <buffer> j gj
    autocmd FileType pandoc nnoremap <buffer> k gk
augroup end


" Generic key mappings {{{2
" Edit .vimrc and commands {{{3
" local .vimrc
if has('nvim')
    nnoremap <leader>ev :vsplit ~/.nvimrc<CR>
else
    nnoremap <leader>ev :vsplit ~/.vimrc<CR>
endif
" nnoremap <leader>gv :vsplit $MYVIMRC<CR>

" Insert <leader> and <Esc>
" cnoremap <C-l> <lt>leader>
" cnoremap <C-E> <lt>Esc>

" netrw.vim {{{3
" let g:netrw_banner=0
" Don't show undo files in the explorer
" let g:netrw_list_hide='\.un\~$'
" }}}

" Navigation {{{3
" Start and end of line
nnoremap H ^
nnoremap L $
vnoremap L g_

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Window manipulation {{{3

" Resize window
nnoremap + <C-W>+
nnoremap _ <C-W>-
" the next one conflicts with ==
" nnoremap = <C-W>>
nnoremap - <C-W><

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

inoremap <C-h> <C-o><C-w>h
inoremap <C-j> <C-o><C-w>j
inoremap <C-k> <C-o><C-w>k
inoremap <C-l> <C-o><C-w>l
inoremap <c-h> <c-o><c-w>h
inoremap <c-j> <c-o><c-w>j
inoremap <c-k> <c-o><c-w>k
inoremap <c-l> <c-o><c-w>l

" highlight last inserted text
nnoremap <leader>gv `[v`]

" Remove search highlight
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Use jk to exit insert-mode
" This increases productivity
inoremap jk <Esc>

nnoremap <silent> <leader>, :cprevious<CR>
nnoremap <silent> <leader>. :cnext<CR>

" Convert word to uppercase
inoremap <C-U> <Esc>viwUea

" Fast saving and closing
nnoremap <leader><leader> :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>w :wq<cr>

" Opening splits
nnoremap <leader>v <C-w><C-v><C-w>l
nnoremap <leader>s <C-w>s

" Insert newline and stay in normal mode
nnoremap <silent> <leader>o o<Esc>
nnoremap <silent> <leader>O O<Esc>

" Работа буфферами
" CTRL+Q - закрыть текущий буффер
map <c-q> :bd<cr>

" Hard way (restrict use of some features) {{{3
nnoremap o<Esc> :echoerr "Use <lt>leader>o instead"<cr>
nnoremap O<Esc> :echoerr "Use <lt>leader>O instead"<cr>

" Easier moving of code blocks {{{4
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-Z is Undo {{{4
" noremap <C-z> u   "  conflicts with default <C-Z> - switch to console
inoremap <C-z> <C-O>u

" CTRL-Y is Redo {{{4
noremap <C-y> <C-R>
inoremap <C-y> <C-O><C-R>

" CTRL-A is Select all {{{4
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG

" CTRL-S is Quicksave command {{{4
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Settings for buffers {{{4
map <C-q> :bd<CR>         " close current buffer
" Ctrl-Left or Ctrl-Right to go to the previous or next tabs
noremap <C-Right> :bn<CR> " move to next buffer
noremap <C-Left> :bp<CR>  " move to previous buffer
" press Alt-Left or Alt-Right to move the current tab to the left or right
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" Plugin configuration {{{2
" vim-easy-align  {{{3
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Easymotion {{{3
let g:EasyMotion_do_mapping = -1
let g:EasyMotion_startofline = 0
nmap <M-f> <Plug>(easymotion-f)
nmap <M-F> <Plug>(easymotion-F)
nmap <M-t> <Plug>(easymotion-t)
nmap <M-T> <Plug>(easymotion-T)

nmap <M-w> <Plug>(easymotion-w)
nmap <M-W> <Plug>(easymotion-W)
nmap <M-b> <Plug>(easymotion-b)
nmap <M-B> <Plug>(easymotion-B)
nmap <M-e> <Plug>(easymotion-e)
nmap <M-E> <Plug>(easymotion-E)

nmap <M-/> <Plug>(easymotion-sn)
nmap <M-n> <Plug>(easymotion-next)
nmap <M-N> <Plug>(easymotion-prev)
" JK motions: Line motions
nmap <M-j> <Plug>(easymotion-j)
nmap <M-k> <Plug>(easymotion-k)

" set nohlsearch " easymotion does it


let g:load_doxygen_syntax = 1

"  Ctrl-P {{{3
let g:ctrlp_map = '<c-u>'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" nnoremap <M-h> :tabp<cr>
" nnoremap <M-l> :tabn<cr>

" NerdTree настройки
" показать NERDTree на F1
map <F1> :NERDTreeToggle<CR>
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  

" Unite settings
nnoremap <F2> :Unite buffer<CR> " browse a list of the currently opened buffers

" TaskList settings
map <F3> :TaskList<CR> " show pending tasks list

" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/plugged/vim-snippets/snippets"

" TagBar settings
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " autofocus on Tagbar open

" Syntastic {{{3
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

" Better :sign interface symbols {{{4
let g:syntastic_error_symbol = 'X'
let g:syntastic_style_error_symbol = 'X'
let g:syntastic_warning_symbol = 'x'
let g:syntastic_style_warning_symbol = 'x'

" Code to REPL, see https://habr.com/ru/post/468265/
" Для tmux
" let g:slime_target = "tmux"

" Для обычного Вима
" let g:slime_target = "vimterminal"

" Для Вима избранных
" let g:slime_target = "neovim"

" Python-mode settings  {{{3

if has("python") || has("python3")
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
  let g:pymode_lint = 0  " TODO make lint working
  let g:pymode_lint_checker = "flake8"
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
  let g:pymode_run = 0

  " Disable choose first function/method at autocomplete
  let g:jedi#popup_select_first = 0

  " ConqueTerm {{{4

  " run python-scripts at <F5>
  nnoremap <F5> :ConqueTermSplit ipython<CR>
  " and debug-mode for <F6>
  nnoremap <F6> :exe 'ConqueTermSplit ipython '.expand('%')<CR>
  let g:ConqueTerm_StartMessages = 0
  let g:ConqueTerm_CloseOnEnd = 0

  " проверка кода в соответствии с PEP8 через <leader>8
  autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

  " Jedi-vim {{{4

  let g:jedi#show_call_signatures = 1 " Show call signatures
  let g:jedi#popup_on_dot = 1         " Enable autocomplete on dot
  let g:jedi#popup_select_first = 0   " Disable first select from auto-complete

  " автокомплит через <Ctrl+Space>
  inoremap <C-space> <C-x><C-o>

  " переключение между синтаксисами
  nnoremap <leader>Th :set ft=htmljinja<CR>
  nnoremap <leader>Tp :set ft=python<CR>
  nnoremap <leader>Tj :set ft=javascript<CR>
  nnoremap <leader>Tc :set ft=css<CR>
  nnoremap <leader>Td :set ft=django<CR>

endif

"  ack and ag {{{3
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  set grepprg=ag\ --nogroup\ --nocolor
  " cnoreabbrev Ack Ack!
  nnoremap <Leader>a :Ack!<Space>
endif

" Status line {{{3
if has('vim_starting')
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%{fugitive#statusline()}
  set statusline+=%*
endif

" Font {{{3
set guifont=NerdFonts/Fura\ Code\ Light\ Nerd\ Font\ Complete:h16 "Это light версия

" Colorscheme {{{3
if has('termguicolors')
  set termguicolors
endif
" set background=light
set background=dark
" silent!  colorscheme solarized8_high
silent!  colorscheme PaperColor

" set airline theme
" Vim-Airline status line  {{{3
let g:airline_powerline_fonts = 1    "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline_theme='solarized'
" let g:airline_solarized_bg='light'
let g:airline_solarized_bg='dark'
if ! &diff
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail'
endif

" Solarized8 {{{3
nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
      \ ? substitute(g:colors_name, 'dark', 'light', '')
      \ : substitute(g:colors_name, 'light', 'dark', '')
      \ )<cr>

function! Solarized8Contrast(delta)
  let l:schemes = map(['_low', '_flat', '', '_high'], '"solarized8".v:val')
  exe 'colors' l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
endfunction

nmap <leader>- :<c-u>call Solarized8Contrast(-v:count1)<cr>
nmap <leader>+ :<c-u>call Solarized8Contrast(+v:count1)<cr>


" Easyclip {{{3
set clipboard=unnamed,unnamedplus
let g:EasyClipAutoFormat=1
let g:EasyClipCopyExplicitRegisterToDefault=1
let g:EasyClipShareYanks=1
let g:EasyClipUseSubstituteDefaults=1
let g:EasyClipAlwaysMoveCursorToEndOfPaste=1 " to have the cursor positioned at the end of paste
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
xmap gs <plug>XEasyClipPaste

" Move area from cursor to end of line
nmap M <Plug>MoveMotionEndOfLinePlug   

" to toggle between the formatted paste and unformatted paste.
nmap <leader>cf <plug>EasyClipToggleFormattedPaste

" insert mode paste
imap <c-v> <plug>EasyClipInsertModePaste
" command mode paste
cmap <c-v> <plug>EasyClipCommandModePaste


" m is assigned to 'move', set markers with 'gm' command
noremap gm m

" Yank and highlight   {{{3
" see  https://stackoverflow.com/questions/26069278/hightlight-copied-area-on-vim
noremap <expr> <Plug>(yank-highlight) operator#sequence#map("y", "\<Plug>(operator-highlight)")
nmap <Leader>y <Plug>(yank-highlight)
vmap <Leader>y <Plug>(yank-highlight)
let g:operator#highlight#clear_time=2.0

source ~/.vim/SwitchColor.vim  " Toggle colorsheme with F8, Shift-F8

" Pandoc {{{3
" let g:pandoc#filetypes#handled = ["pandoc", "markdown", "rst", "textfile"]
" let g:pandoc#filetypes#pandoc_markdown = 0
" let g:pandoc#formatting#smart_autoformat_on_cursormoved = 1

" NerdCommenter {{{3
let g:NERDSpaceDelims=1


" UndtoTeee  {{{3
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif
nnoremap <leader>ut :UndotreeToggle<cr>

" modelin magic
" http://vim.wikia.com/wiki/Modeline_magic
"
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.

function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d ss=%d %set %sai :",
        \ &tabstop, &shiftwidth, &textwidth, &sidescroll,
        \ &expandtab ? '' : 'no',
        \ &autoindent ? '' : 'no'
        \ )
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction

nnoremap <silent> <Leader>ml :call AppendModeline()

" VS Code plugin recommendation: jonsmithers.open-in-vim
:command! OpenInVSCode exe "silent !code --goto '" . expand("%") . ":" . line(".") . ":" . col(".") . "'" | redraw!

" fzf
nnoremap <localleader>lt :call vimtex#fzf#run()

" vim: set ts=2 sw=4 tw=132 ss=4 ft=vim norl fen et noai :

