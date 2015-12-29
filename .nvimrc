" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
" Plugins
Plug 'blueshirts/darcula'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

"HTML & CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'digitaltoad/vim-jade'

"Javascript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'

"PHP
Plug 'StanAngeloff/php.vim'
Plug 'tanarurkerem/drupal-snippets'

call plug#end()
let g:airline#extensions#tabline#enabled = 1

syntax on
colorscheme darcula
set tabstop=2
set expandtab
set shiftwidth=2
set smartcase
set hlsearch
set number
set autoindent
set incsearch
set clipboard+=unnamed
set noswapfile
set t_Co=256

"Nertree Toggle
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" enable all Python syntax highlighting features
let python_highlight_all = 1

"Ctrl + Left and Right switch buffers
nnoremap <silent> <C-Right> :bnext<CR>
nnoremap <silent> <C-Left> :bprevious<CR>
nnoremap <silent> <C-Del> :bd
