" vim:nowrap:tw=80:ts=2:ft=vim:norl:et:fen:
scriptencoding utf-8
" Basic settings {{{

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
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line 


set hidden
set hls
filetype plugin on

set showmatch "brackets

" Enable mouse
set mouse=a

" Do not create backup files
set nobackup
set nowritebackup
set noswapfile

set showcmd

set scrolloff=2

set title

set hlsearch
nohlsearch
set incsearch

" List completions
set wildmode=longest:list,full

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,ю.,ё',ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х\{,Ъ\},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б\<,Ю\>

set list
set listchars=tab:»\ ,trail:·,extends:>,nbsp:.

set exrc
set secure
" }}}

" set colorcolumn=110
" highlight ColorColumn ctermbg=darkgray

" Highlight characters past column 120
augroup vimrc_autocmds
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
  autocmd FileType ruby,python,javascript,c,cpp,julia highlight Excess ctermbg=DarkGrey guibg=#c12a0f
  autocmd FileType ruby,python,javascript,c,cpp,julia match Excess /\%80v.*/
  autocmd FileType ruby,python,javascript,c,cpp,julia set nowrap
augroup END


"" Status line settings {{{
" Always show status line
set laststatus=2
"" }}}

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

  " Generic enhancement     {{{
  " call dein#add('SirVer/ultisnips')
  " call dein#add('airblade/vim-gitgutter')
  " call dein#add('godlygeek/tabular')
  " call dein#add('kana/vim-smartinput')
  " call dein#add('mileszs/ack.vim')
  " call dein#add('nelstrom/vim-visual-star-search')
  " call dein#add('neomake/neomake')
  " call dein#add('szw/vim-g')
  " call dein#add('tommcdo/vim-exchange')
  " call dein#add('tpope/vim-abolish')
  " call dein#add('tpope/vim-characterize')
  call dein#add('tpope/vim-commentary')
  " call dein#add('tpope/vim-dispatch')
  " call dein#add('tpope/vim-eunuch')     " Unix shell commands: :Delete, :Move etc
  call dein#add('tpope/vim-fugitive')     " Git commands: Git, Gcommit, Gmove...
  " call dein#add('tpope/vim-projectionist')
  " call dein#add('tpope/vim-ragtag')
  " call dein#add('tpope/vim-repeat')
  " call dein#add('tpope/vim-scriptease') " VIM plugin to make VIM plugins
  " call dein#add('tpope/vim-sleuth') " automatically adjusts 'shiftwidth' and 'expandtab' 
  call dein#add('tpope/vim-surround')
  " call dein#add('tpope/vim-tbone')     " tmux support: Tmux, Tyank, Twrite
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-vinegar')     " Enhances netrw: project drawer, use '-', '.'
  call dein#add('vim-syntastic/syntastic')
  " }}}

  " Custom textobjects
  " call dein#add('kana/vim-textobj-user')
  " call dein#add('kana/vim-textobj-entire')
  " call dein#add('kana/vim-textobj-indent')
  " call dein#add('kana/vim-textobj-syntax')
  " call dein#add('kana/vim-textobj-line')
  " call dein#add('nelstrom/vim-textobj-rubyblock')
  " call dein#add('Julian/vim-textobj-variable-segment')
  " call dein#add('bkad/CamelCaseMotion')
  " call dein#add('b4winckler/vim-angry')
  " call dein#add('saihoooooooo/vim-textobj-space')

  " For Vimscript
  " call dein#add('tweekmonster/helpful.vim')
  " call dein#add('nelstrom/vim-docopen')

  " Markdown
  " call dein#add('tpope/vim-markdown')
  " call dein#add('nelstrom/vim-markdown-folding')
  " call dein#add('junegunn/vim-emoji', {'type': 'opt'})
  " call dein#add('vim-pandoc/vim-criticmarkup')   " Comments, changes and notes in text and markdown files
  " call dein#add('vim-pandoc/vim-pandoc')         " Intergrates VIM and Pandoc
  " call dein#add('vim-pandoc/vim-pandoc-syntax') 
  " call dein#add('vim-pandoc/vim-pandoc-after')   " Integrates Pandoc with thirdparty plugins
  " call dein#add('dhruvasagar/vim-table-mode')    " Automates table creation

  "--------------=== Snippets support ===--------------
  " call dein#add('garbas/vim-snipmate')          " Snippets manager
  " call dein#add('MarcWeber/vim-addon-mw-utils') " dependencies #1
  " call dein#add('tomtom/tlib_vim')              " dependencies #2
  " call dein#add('honza/vim-snippets')           " snippets repo

  " Python
  " call dein#add('python-mode/python-mode', {'type': 'opt'})
  " call dein#add('davidhalter/jedi-vim')                 " Jedi-vim autocomplete plugin
  " call dein#add('mitsuhiko/vim-jinja')          " Jinja support for vim
  " call dein#add('mitsuhiko/vim-python-combined')  " Combined Python 2/3 for Vim
  " call dein#add('nvie/vim-flake8')  " Static syntax and code checker Flake8 
  " call dein#add('ervandew/supertab ')  " use <Tab> for all your insert completion needs (:h ins-completion). 
  " call dein#add('rosenfeld/conque-term')  " Consoles as buffers

  " MCNP
  " call dein#add('g2boojum/vim-mcnp')              " MCNP syntax


  " yank - Highlight copied area
  " https://stackoverflow.com/questions/26069278/hightlight-copied-area-on-vim
  " call dein#add('kana/vim-operator-user')            " Lets user define their own operators.
  " call dein#add('thinca/vim-operator-sequence')      " Operator to do two or more operators.
  " call dein#add('osyo-manga/vim-operator-highlight') " the plugin for this.

  " call dein#add('thanthese/Tortoise-Typing')         " touch typing tutor

  " " JavaScript
  " call dein#add('pangloss/vim-javascript')
  " call dein#add('elzr/vim-json')

  " " Ruby
  " call dein#add('tpope/vim-bundler')
  " call dein#add('tpope/vim-endwise')
  " call dein#add('tpope/vim-rails')
  " call dein#add('tpope/vim-rake')
  " call dein#add('vim-ruby/vim-ruby')

  " " Support for rare and exotic languages
  " call dein#add('nelstrom/vim-pml')
  " call dein#add('nelstrom/vim-subrip')

  " Colorschemes  {{{
  call dein#add('lifepillar/vim-solarized8')
  call dein#add('morhetz/gruvbox')  " colorscheme gruvbox
  call dein#add('tomasr/molokai', {'merged': 0})
  " call dein#add('rakr/vim-one', {'type': 'opt'})
  " call dein#add('NLKNguyen/papercolor-theme', {'type': 'opt'})
  " call dein#add('reedes/vim-colors-pencil', {'type': 'opt'})
  " }}}

  " Plugins for either Vim8 or NeoVim
  " if has('nvim')
  "   call dein#add('Shougo/denite.nvim', {})
  "   call dein#add('machakann/vim-highlightedyank', {})
  "   call dein#add('kassio/neoterm', {'type': 'opt'})
  "   call dein#add('Shougo/neomru.vim', {'type': 'opt'})
  " else
  "   call dein#add('Shougo/unite.vim', {'type': 'opt'}) " Navigation between buffers and files
  " endif

  " Clipboard ring
  " call dein#add('svermeulen/vim-easyclip')

  " File list and open
  call dein#add('justinmk/vim-dirvish')

  " Fuzzy file, buffer, mru, tag, etc finder. http://kien.github.com/ctrlp.vim
  " call dein#add('ctrlpvim/ctrlp.vim')

  " call dein#add('majutsushi/tagbar')            " Class/module browser

  " Status line
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " call dein#add('fisadev/FixedTaskList.vim')    " Pending tasks list

  " Julia
  " call dein#add('JuliaEditorSupport/julia-vim')

  " to-do.txt
  " call dein#add('freitass/todo.txt-vim')

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

" Status line {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" }}} 

" Colorscheme {{{
set termguicolors
set background=dark
silent!  colorscheme solarized8_dark_high
" }}}
"
" Vim-Airline status line  {{{
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

source ~/dotfiles/vim/SwitchColor.vim  " Toggle colorsheme with F8, Shift-F8

" }}} (Plugin Configuration)
