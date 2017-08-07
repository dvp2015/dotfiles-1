command! PackUpdate packadd minpac | source $MYVIMRC | redraw | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()

if !exists('*minpac#init')
  finish
endif

call minpac#init({'verbose': 1})

" minpac must have {'type': 'opt'} so that it can be loaded with
" `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('dsawardekar/riml.vim', {'type': 'opt'})

" General enhancements
call minpac#add('tpope/vim-abolish')
call minpac#add('tpope/vim-characterize')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-ragtag')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-sleuth')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-tbone')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-projectionist')
call minpac#add('nelstrom/vim-visual-star-search')
call minpac#add('SirVer/ultisnips')
call minpac#add('godlygeek/tabular')
call minpac#add('neomake/neomake')
call minpac#add('tommcdo/vim-exchange')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('szw/vim-g')
call minpac#add('kana/vim-smartinput')
call minpac#add('vim-syntastic/syntastic')

" Custom textobjects
call minpac#add('kana/vim-textobj-user')
call minpac#add('kana/vim-textobj-entire')
call minpac#add('kana/vim-textobj-indent')
call minpac#add('kana/vim-textobj-syntax')
call minpac#add('kana/vim-textobj-line')
call minpac#add('nelstrom/vim-textobj-rubyblock')
call minpac#add('Julian/vim-textobj-variable-segment')
call minpac#add('bkad/CamelCaseMotion')
call minpac#add('b4winckler/vim-angry')
call minpac#add('saihoooooooo/vim-textobj-space')

" For Vimscript
call minpac#add('tpope/vim-scriptease')
call minpac#add('tweekmonster/helpful.vim')
call minpac#add('nelstrom/vim-docopen')

" Markdown
call minpac#add('tpope/vim-markdown')
call minpac#add('nelstrom/vim-markdown-folding')
call minpac#add('junegunn/vim-emoji', {'type': 'opt'})

" Python
call minpac#add('python-mode/python-mode', {'type': 'opt'})
call minpac#add('davidhalter/jedi-vim') 		" Jedi-vim autocomplete plugin
call minpac#add('mitsuhiko/vim-jinja')		" Jinja support for vim
call minpac#add('mitsuhiko/vim-python-combined')  " Combined Python 2/3 for Vim
call minpac#add('nvie/vim-flake8')  " Static syntax and code checker Flake8 
" call minpac#add('ervandew/supertab ')  " use <Tab> for all your insert completion needs (:h ins-completion). 
call minpac#add('rosenfeld/conque-term')  " Consoles as buffers

" MCNP
call minpac#add('g2boojum/vim-mcnp')              " MCNP syntax


" yank - Highlight copied area
" https://stackoverflow.com/questions/26069278/hightlight-copied-area-on-vim

call minpac#add('kana/vim-operator-user')            " Lets user define their own operators.
call minpac#add('thinca/vim-operator-sequence')      " Operator to do two or more operators.
call minpac#add('osyo-manga/vim-operator-highlight') " the plugin for this.

call minpac#add('thanthese/Tortoise-Typing')         " touch typing tutor

" " JavaScript
" call minpac#add('pangloss/vim-javascript')
" call minpac#add('elzr/vim-json')

" " Ruby
" call minpac#add('tpope/vim-bundler')
" call minpac#add('tpope/vim-endwise')
" call minpac#add('tpope/vim-rails')
" call minpac#add('tpope/vim-rake')
" call minpac#add('vim-ruby/vim-ruby')

" " Support for rare and exotic languages
" call minpac#add('nelstrom/vim-pml')
" call minpac#add('nelstrom/vim-subrip')

" Colorschemes
call minpac#add('lifepillar/vim-solarized8', {'type': 'opt'})
call minpac#add('morhetz/gruvbox', {'type': 'opt'})
call minpac#add('rakr/vim-one', {'type': 'opt'})
call minpac#add('NLKNguyen/papercolor-theme', {'type': 'opt'})
call minpac#add('reedes/vim-colors-pencil', {'type': 'opt'})

" Plugins for either Vim8 or NeoVim
if has('nvim')
   call minpac#add('Shougo/denite.nvim', {})
   call minpac#add('machakann/vim-highlightedyank', {})
   call minpac#add('kassio/neoterm', {'type': 'opt'})
   call minpac#add('Shougo/neomru.vim', {'type': 'opt'})
else
  call minpac#add('Shougo/unite.vim', {'type': 'opt'}) " Navigation between buffers and files
endif

" Clipboard ring
call minpac#add('svermeulen/vim-easyclip')

" File list and open
call minpac#add('jeetsukumaran/vim-filebeagle')

" Fuzzy file, buffer, mru, tag, etc finder. http://kien.github.com/ctrlp.vim
call minpac#add('ctrlpvim/ctrlp.vim')

" code/project navigation ===-------------
call minpac#add('scrooloose/nerdtree') 	    	" Project and file navigation
call minpac#add('majutsushi/tagbar')          	" Class/module browser

" Status line
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

