" VIM settings {{{1
" vim:nowrap:tw=80:ts=2:sw=0:ft=vim:norl:et:fen:
" Basic settings {{{2
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

" Status line settings {{{3
" Always show status line
set laststatus=2


set exrc
set secure


" Register plugins  {{{2
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


Plug 'airblade/vim-gitgutter'  " Mark changed lines
Plug 'tpope/vim-fugitive'      " Git wrapper: Git, Gcommit, Gmove...
Plug 'junegunn/vim-easy-align' " Easy alignment
Plug 'tpope/vim-repeat'        " Repeat last change
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-syntastic/syntastic'
if executable("ag") || executable("ack")
  Plug 'mileszs/ack.vim'
endif

" if executable('ruby') && executable('git')
"  Plug 'junegunn/vim-github-dashboard.git'
" endif

" Snippets support {{{3
Plug 'SirVer/ultisnips' 
Plug 'garbas/vim-snipmate'          " Snippets manager
Plug 'MarcWeber/vim-addon-mw-utils' " dependencies #1
Plug 'tomtom/tlib_vim'              " dependencies #2
Plug 'honza/vim-snippets'           " snippets repo


Plug 'easymotion/vim-easymotion'  " Fast motions
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle' }

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Clipboard ring
Plug 'svermeulen/vim-easyclip'

" yank - Highlight copied area  {{{3
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

" Colorschemes  {{{3
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'  " colorscheme gruvbox
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
Plug 'reedes/vim-colors-pencil'


" File list and open
Plug 'justinmk/vim-dirvish'

" Fuzzy file, buffer, mru, tag, etc finder. http://kien.github.com/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

Plug 'majutsushi/tagbar'            " Class/module browser

" Status line  {{{3
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'fisadev/FixedTaskList.vim'    " Pending tasks list

" Julia {{{3
" Plug 'JuliaEditorSupport/julia-vim'

" Misc {{{3
" to-do.txt
Plug 'freitass/todo.txt-vim'
" Plug 'thanthese/Tortoise-Typing')         " touch typing tutor

" Markdown   {{{3
Plug 'tpope/vim-markdown'
Plug 'nelstrom/vim-markdown-folding'
Plug 'junegunn/vim-emoji'
Plug 'vim-pandoc/vim-criticmarkup'   " Comments, changes and notes in text and markdown files
Plug 'vim-pandoc/vim-pandoc'         " Intergrates VIM and Pandoc
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'   " Integrates Pandoc with thirdparty plugins
Plug 'dhruvasagar/vim-table-mode'    " Automates table creation

" Python  {{{3
Plug 'python-mode/python-mode'
Plug 'davidhalter/jedi-vim'           " Jedi-vim autocomplete plugin
Plug 'mitsuhiko/vim-jinja'            " Jinja support for vim
Plug 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plug 'nvie/vim-flake8'  " Static syntax and code checker Flake8 
" Plug :h ins-completion.
Plug 'rosenfeld/conque-term'  " Consoles as buffers

" MCNP  {{{3
Plug 'g2boojum/vim-mcnp', {'for': 'mcnp'}              " MCNP syntax



" Initialize plugin system
call plug#end()



" Generic key mappings {{{2
" Edit .vimrc and commands {{{3
" local .vimrc
if has('nvim')
    nnoremap <leader>ev :vsplit .nvimrc<CR>
else
    nnoremap <leader>ev :vsplit .vimrc<CR>
endif
nnoremap <leader>gv :vsplit $MYVIMRC<CR>

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

" Window manipulation {{{3
" Resize window {{{4
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

" Remove search highlight
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Use jk to exit insert-mode
" This increases productivity
inoremap jk <Esc>

nnoremap <silent> <leader>, :cprevious<CR>
nnoremap <silent> <leader>. :cnext<CR>

" Convert word to uppercase
inoremap <C-U> <Esc>viwUea

" Hard way (restrict use of some features) {{{3
nnoremap o<Esc> :echoerr "Use <lt>leader>o instead"<cr>
nnoremap O<Esc> :echoerr "Use <lt>leader>O instead"<cr>

" Easier moving of code blocks {{{4
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-Z is Undo {{{4
noremap <C-z> u
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
noremap <C-Right> :bn<CR> " move to next buffer
noremap <C-Left> :bp<CR>  " move to previous buffer


" Filetype configuration {{{2

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

" Python file settings {{{3
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


" Vimscript file settings {{{3
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


" Markdown file settings {{{3
augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd filetype markdown setlocal linebreak
    autocmd filetype markdown nnoremap <buffer> j gj
    autocmd FileType markdown nnoremap <buffer> k gk
augroup end


" Pandoc file settings {{{3
augroup filetype_pandoc
    autocmd!
    autocmd FileType pandoc setlocal wrap
    autocmd filetype pandoc setlocal linebreak
    autocmd filetype pandoc nnoremap <buffer> j gj
    autocmd FileType pandoc nnoremap <buffer> k gk
augroup end


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

" ConqueTerm {{{3
nnoremap <F5> :ConqueTermSplit ipython<CR> " run python-scripts at <F5>
nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR> " and debug-mode for <F6>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0

" Jedi-vim {{{3
let g:jedi#show_call_signatures = 1 " Show call signatures
let g:jedi#popup_on_dot = 1         " Enable autocomplete on dot
let g:jedi#popup_select_first = 0   " Disable first select from auto-complete

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


" Python helping options {{{3
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

" Colorscheme {{{3
set termguicolors
set background=dark
silent!  colorscheme solarized8_dark_high


" Vim-Airline status line  {{{3
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'


" Solarized8 {{{3
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


" Easyclip {{{3
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

" Yank and highlight   {{{3
" see  https://stackoverflow.com/questions/26069278/hightlight-copied-area-on-vim
noremap <expr> <Plug>(yank-highlight) operator#sequence#map("y", "\<Plug>(operator-highlight)")
nmap <Leader>y <Plug>(yank-highlight)
vmap <Leader>y <Plug>(yank-highlight)
let g:operator#highlight#clear_time=2.0

source ~/dotfiles/vim/SwitchColor.vim  " Toggle colorsheme with F8, Shift-F8


