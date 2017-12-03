" vim:nowrap:tw=80:ts=2:sw=0:ft=vim:norl:et:fen:
" Basic settings {{{
scriptencoding utf-8

if &compatible
  set nocompatible               " Be iMproved
endif

if !has('nvim')
  unlet! skip_defaults_vim
  source $VIMRUNTIME/defaults.vim
endif

let mapleader = " "
let localleader = "\\"

set number
set nowrap
set autoindent
set smartindent
set backspace=indent,eol,start
set diffopt=filler,vertical
set ruler
set ignorecase
set smartcase
set incsearch
set smarttab
" Python helping options
" http://python-guide-pt-br.readthedocs.io/en/latest/dev/env/"
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=0  " operation >> indents  columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line 


set hidden
set hls

set showmatch "brackets

" Enable mouse
set mouse=a

" Do not create backup files
set nobackup
set nowritebackup
set noswapfile

set showcmd
set nojoinspaces
set scrolloff=2

set title

set hlsearch
set incsearch

" List completions
set wildmode=longest:list,full

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,ю.,ё',ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х\{,Ъ\},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\<,Ю\>

set list
set listchars=tab:»\ ,trail:·,extends:>,nbsp:.

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" Status line settings {{{
" Always show status line
set laststatus=2
" }}}

set exrc
set secure
" }}}

" dein Scripts  {{{
" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  if has('nvim')
    "  Dark powered shell: Deol, DeolCd, DeolEdit
    call dein#add('Shougo/deol.nvim')
  endif

  if executable("make")
    " vimproc is a great asynchronous execution library for Vim.
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  endif

  call dein#add('Valloric/YouCompleteMe')
  " call dein#add('Valloric/YouCompleteMe', {
  " \    'build' : {
  " \        'linux' : 'git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang',
  " \    },
  " \ })

  " Generic enhancement     {{{
  call dein#add('SirVer/ultisnips')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('pbrisbin/vim-mkdir') " Creates directories, in not exist
  call dein#add('pbrisbin/vim-syntax-shakespeare')  " text macros interpolation using shakespeare
  call dein#add('easymotion/vim-easymotion')  " Fast motions
  call dein#add('jceb/vim-orgmode')      " .org files
  call dein#add('aklt/plantuml-syntax')  " for .uml .planuml files
  " call dein#add('godlygeek/tabular')
  " call dein#add('kana/vim-smartinput')
  if executable("ag") || executable("ack")
    call dein#add('mileszs/ack.vim')
  endif
  " call dein#add('nelstrom/vim-visual-star-search')
  " call dein#add('neomake/neomake')
  " call dein#add('szw/vim-g')
  " call dein#add('tommcdo/vim-exchange')
  call dein#add('tpope/vim-abolish') " automatic typos correctin and  :Subvert
  call dein#add('tpope/vim-characterize') " press ga on character
  call dein#add('tpope/vim-commentary')
  " call dein#add('tpope/vim-dispatch')
  " call dein#add('tpope/vim-eunuch')     " Unix shell commands: :Delete, :Move etc
  call dein#add('tpope/vim-fugitive')     " Git commands: Git, Gcommit, Gmove...
  " call dein#add('tpope/vim-projectionist')
  " call dein#add('tpope/vim-ragtag')
  call dein#add('tpope/vim-repeat')
  " call dein#add('tpope/vim-scriptease') " VIM plugin to make VIM plugins
  " call dein#add('tpope/vim-sleuth') " automatically adjusts 'shiftwidth' and 'expandtab' 
  call dein#add('tpope/vim-speeddating') " <c-a>,<c-x> on dates
  call dein#add('tpope/vim-surround')
  " call dein#add('tpope/vim-tbone')     " tmux support: Tmux, Tyank, Twrite
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-vinegar')     " Enhances netrw: project drawer, use '-', '.'
  call dein#add('vim-syntastic/syntastic')
  " }}}

  " Custom textobjects {{{
  call dein#add('kana/vim-textobj-user') " create your own text objects without pain
  call dein#add('kana/vim-textobj-entire') " select entire buffer: ae/ie
  call dein#add('kana/vim-textobj-indent')
  call dein#add('kana/vim-textobj-syntax')
  call dein#add('kana/vim-textobj-line')
  " call dein#add('nelstrom/vim-textobj-rubyblock')
  call dein#add('Julian/vim-textobj-variable-segment')
  call dein#add('bkad/CamelCaseMotion')
  call dein#add('b4winckler/vim-angry')  " select function arguments: aa, aA
  call dein#add('saihoooooooo/vim-textobj-space')
  "  }}}

  " For Vimscript  {{{
  " call dein#add('tweekmonster/helpful.vim')
  " call dein#add('nelstrom/vim-docopen')
  "  }}}
  "
  " Markdown   {{{
  call dein#add('tpope/vim-markdown')
  call dein#add('nelstrom/vim-markdown-folding')
  call dein#add('junegunn/vim-emoji')
  call dein#add('vim-pandoc/vim-criticmarkup')   " Comments, changes and notes in text and markdown files
  call dein#add('vim-pandoc/vim-pandoc')         " Intergrates VIM and Pandoc
  call dein#add('vim-pandoc/vim-pandoc-syntax') 
  call dein#add('vim-pandoc/vim-pandoc-after')   " Integrates Pandoc with thirdparty plugins
  call dein#add('dhruvasagar/vim-table-mode')    " Automates table creation
  " }}}

  " Snippets support {{{
  call dein#add('garbas/vim-snipmate')          " Snippets manager
  call dein#add('MarcWeber/vim-addon-mw-utils') " dependencies #1
  call dein#add('tomtom/tlib_vim')              " dependencies #2
  call dein#add('honza/vim-snippets')           " snippets repo
  " }}}

  " Python  {{{
  call dein#add('python-mode/python-mode')
  call dein#add('davidhalter/jedi-vim')                 " Jedi-vim autocomplete plugin
  call dein#add('mitsuhiko/vim-jinja')          " Jinja support for vim
  call dein#add('mitsuhiko/vim-python-combined')  " Combined Python 2/3 for Vim
  call dein#add('nvie/vim-flake8')  " Static syntax and code checker Flake8 
  " call dein#add('ervandew/supertab ')  " use <Tab> for all your insert completion needs (:h ins-completion). 
  call dein#add('rosenfeld/conque-term')  " Consoles as buffers
  "  }}}
  "
  "
  " MCNP  {{{
  call dein#add('g2boojum/vim-mcnp')              " MCNP syntax
  "  }}}

  " yank - Highlight copied area  {{{
  " https://stackoverflow.com/questions/26069278/hightlight-copied-area-on-vim
  call dein#add('kana/vim-operator-user')            " Lets user define their own operators.
  call dein#add('thinca/vim-operator-sequence')      " Operator to do two or more operators.
  call dein#add('osyo-manga/vim-operator-highlight') " the plugin for this.
  "  }}}
  

  " " JavaScript {{{
  " call dein#add('pangloss/vim-javascript')
  " call dein#add('elzr/vim-json')
  " }}}

  " Ruby {{{
  " call dein#add('tpope/vim-bundler')
  " call dein#add('tpope/vim-endwise')
  " call dein#add('tpope/vim-rails')
  " call dein#add('tpope/vim-rake')
  " call dein#add('vim-ruby/vim-ruby')
  "  }}}
    
  " Support for rare and exotic languages {{{
  " call dein#add('nelstrom/vim-pml')
  " call dein#add('nelstrom/vim-subrip')
  " }}}

  " Colorschemes  {{{
  call dein#add('lifepillar/vim-solarized8')
  call dein#add('morhetz/gruvbox')  " colorscheme gruvbox
  call dein#add('tomasr/molokai', {'merged': 0})
  call dein#add('rakr/vim-one')
  call dein#add('NLKNguyen/papercolor-theme')
  call dein#add('reedes/vim-colors-pencil')
  " }}}

  " Plugins for either Vim8 or NeoVim {{{
  if has('nvim')
    call dein#add('Shougo/denite.nvim')
    call dein#add('machakann/vim-highlightedyank')
    call dein#add('kassio/neoterm')
    call dein#add('Shougo/neomru.vim')
  else
    call dein#add('Shougo/unite.vim') " Navigation between buffers and files
  endif
  " }}}

  " Clipboard ring
  call dein#add('svermeulen/vim-easyclip')

  " File list and open
  call dein#add('justinmk/vim-dirvish')

  " Fuzzy file, buffer, mru, tag, etc finder. http://kien.github.com/ctrlp.vim
  call dein#add('ctrlpvim/ctrlp.vim')

  call dein#add('majutsushi/tagbar')            " Class/module browser

  " Status line  {{{
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  " }}}
  "
  call dein#add('fisadev/FixedTaskList.vim')    " Pending tasks list

  " Julia {{{
  " call dein#add('JuliaEditorSupport/julia-vim')
  " }}}

  " Misc {{{
  " to-do.txt
  call dein#add('freitass/todo.txt-vim')
  " call dein#add('thanthese/Tortoise-Typing')         " touch typing tutor
  " }}}

  " git window, :Agit
  " call dein#add('cohama/agit.vim')
    
  
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
"   }}}

" Plugin configuration {{{

" Edit .vimrc and commands {{{
" local .vimrc
if has('nvim')
    nnoremap <leader>ev :vsplit .nvimrc<CR>
else
    nnoremap <leader>ev :vsplit .vimrc<CR>
endif
nnoremap <leader>gv :vsplit $MYVIMRC<CR>

" Insert <leader> and <Esc>
cnoremap <C-l> <lt>leader>
cnoremap <C-E> <lt>Esc>
" }}}

" netrw.vim {{{
" let g:netrw_banner=0
" Don't show undo files in the explorer
" let g:netrw_list_hide='\.un\~$'
" }}}
"
" Navigation {{{
" Start and end of line
nnoremap H ^
nnoremap L $
vnoremap L g_
" }}}

" Window manipulation {{{
" Resize window {{{
nnoremap + <C-W>+
nnoremap _ <C-W>-
" the next one conflicts with ==
" nnoremap = <C-W>>
nnoremap - <C-W><
" }}}

" Manipulate windows {{{
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

inoremap <C-h> <C-o><C-w>h
inoremap <C-j> <C-o><C-w>j
inoremap <C-k> <C-o><C-w>k
inoremap <C-l> <C-o><C-w>l
" }}}

" Remove search highlight
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Use jk to exit insert-mode
" This increases productivity
inoremap jk <Esc>

nnoremap <silent> <leader>, :cprevious<CR>
nnoremap <silent> <leader>. :cnext<CR>

" Convert word to uppercase
inoremap <C-U> <Esc>viwUea

" Hard way (restrict use of some features) {{{
nnoremap o<Esc> :echoerr "Use <lt>leader>o instead"<cr>
nnoremap O<Esc> :echoerr "Use <lt>leader>O instead"<cr>
" }}}

" Highlight characters past column 120
augroup vimrc_autocmds
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
    autocmd BufRead,BufNewFile *.hpp,*.h++,*.hxx,*.cpp,*.c++,*.cxx set filetype=cpp.doxygen
    autocmd FileType ruby,python,javascript,c,cpp,julia highlight Excess ctermbg=DarkGrey guibg=#c12a0f
    autocmd FileType ruby,python,javascript,c,cpp,julia match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp,julia set nowrap
augroup END

augroup filetype_c
    autocmd!
    autocmd FileType c,cpp setlocal cindent
augroup end

" Python file settings {{{
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
" }}}

" Vimscript file settings {{{
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
" }}}

" Haskell file settings {{{
function! GHCI()
    if !bufexists('ghci')
        split
        exec "normal \<C-w>J"
        term cabal exec ghci %
        file ghci
        set bufhidden=hide
        tnoremap <buffer> <C-r> :r<cr>
    else
        let win = bufwinnr('ghci')
        if win != -1
            exec "normal " . win . "\<C-w>w"
            startinsert
        end
    end
endfunction

augroup filetype_haskell
    autocmd!
    autocmd FileType haskell,cabal setlocal expandtab
    autocmd FileType haskell compiler ghc
    if has('nvim')
        autocmd FileType haskell nnoremap <buffer> <F5> :call GHCI()<cr>
    else
        autocmd FileType haskell nnoremap <buffer> <F5> :!cabal exec ghci %<cr>
    endif
augroup end
" }}}

" Markdown file settings {{{
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal linebreak
    autocmd FileType markdown nnoremap <buffer> j gj
    autocmd FileType markdown nnoremap <buffer> k gk
augroup end
" }}}


" YCM settings {{{
let g:clang_library_path = "/usr/lib64/"
let g:clang_complete_copen = 0
let g:clang_hl_errors = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = "ultisnips"
let g:clang_close_preview = 1
let g:clang_complete_macros = 1

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

let g:ycm_global_ycm_extra_conf = "~/dotfiles/vim/.ycm_extra_conf.py"
" }}}

" Easymotion {{{
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
" }}}

let g:load_doxygen_syntax = 1

"  Ctrl-P {{{
let g:ctrlp_map = '<c-u>'
" }}}

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

" nnoremap <M-h> :tabp<cr>
" nnoremap <M-l> :tabn<cr>

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
" set textwidth=79  " lines longer than 79 columns will be broken
" set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
" set tabstop=4     " a hard TAB displays as 4 columns
" set expandtab     " insert spaces when hitting TABs
" set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
" set shiftround    " round indent to multiple of 'shiftwidth'
" set autoindent    " align the new line indent with the previous line 
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
let g:pymode_lint_checker = "pylint,pep8"
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

"  ack and ag {{{
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  set grepprg=ag\ --nogroup\ --nocolor
  " cnoreabbrev Ack Ack!
  nnoremap <Leader>a :Ack!<Space>
endif
" }}}


" Status line {{{
if has('vim_starting')
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%{fugitive#statusline()}
  set statusline+=%*
endif
" }}}

" Colorscheme {{{
set termguicolors
set background=dark
silent!  colorscheme solarized8_dark_high
" }}}

" Vim-Airline status line  {{{
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
" }}}

" Solarized8 {{{
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
" }}} (Solarized)

" Easyclip 
set clipboard=unnamed,unnamedplus
let g:EasyClipAutoFormat=1
let g:EasyClipCopyExplicitRegisterToDefault=1
let g:EasyClipShareYanks=0
" let g:EasyClipShareYanksFile='.easyclip'
" let g:EasyClipUseSubstituteDefaults=1
let g:EasyClipAlwaysMoveCursorToEndOfPaste=1 " to have the cursor positioned at the end
nmap <silent> gs <plug>SubstituteOverMotionMap
nmap gss <plug>SubstituteLine
" xmap gs p
xmap gs <plug>XEasyClipPaste
nnoremap gm m

" Yank and highlight   {{{
" see  https://stackoverflow.com/questions/26069278/hightlight-copied-area-on-vim
noremap <expr> <Plug>(yank-highlight) operator#sequence#map("y", "\<Plug>(operator-highlight)")
nmap <Leader>y <Plug>(yank-highlight)
vmap <Leader>y <Plug>(yank-highlight)
let g:operator#highlight#clear_time=2.0
"  }}}
"
source ~/dotfiles/vim/SwitchColor.vim  " Toggle colorsheme with F8, Shift-F8

" }}} (Plugin Configuration)
