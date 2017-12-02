" vim: nowrap fdm=marker
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
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line 

filetype plugin on
syntax on

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

"dein Scripts-----------------------------
" Required:
set runtimepath+=~/dotfiles/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/dotfiles/.vim/bundles')
  call dein#begin('~/dotfiles/.vim/bundles')

  " Let dein manage dein
  " Required:
  call dein#add('~/dotfiles/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  if !(has("win32") || has("win64"))
    " vimproc is a great asynchronous execution library for Vim.
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  endif

  call dein#add('tpope/vim-abolish')
  call dein#add('tpope/vim-characterize')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-dispatch')
  call dein#add('tpope/vim-eunuch')     " Unix shell commands: :Delete, :Move etc
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-ragtag')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-sleuth')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-tbone')
  call dein#add('tpope/vim-unimpaired')
  call dein#add('tpope/vim-projectionist')
  call dein#add('tpope/vim-vinegar')
  
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
