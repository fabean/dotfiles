" Install Vim Plug if not installed
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
" Plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'bling/vim-airline'
call plug#end()
let g:airline#extensions#tabline#enabled = 1

syntax on
set tabstop=2
set expandtab
set shiftwidth=2
set smartcase
set hlsearch
set number
set autoindent
set incsearch
set clipboard+=unnamed
