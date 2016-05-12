" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
" Plugins
Plug 'scrooloose/syntastic'
Plug 'blueshirts/darcula'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'mhinz/vim-grepper'
Plug 'tomtom/tcomment_vim'

"HTML & CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'digitaltoad/vim-jade'

"Javascript
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'moll/vim-node'


"PHP
Plug 'shawncplus/phpcomplete.vim'
Plug 'tanarurkerem/drupal-snippets'

"Stupid Coffee Script Because dummies
Plug 'kchmck/vim-coffee-script'

"Git plugin
Plug 'tpope/vim-fugitive'


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
set hidden
set relativenumber
set list listchars=tab:»·,trail:·,nbsp:·


"Nertree Toggle
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" enable all Python syntax highlighting features
let python_highlight_all = 1

"Option + Left and Right switch buffers
"execute "set <M-Right>=\e\eC"
"execute "set <M-Left>=\e\eD"
nnoremap <silent> <C-Right> :bnext<CR>
nnoremap <silent> <C-Left> :bprevious<CR>
nnoremap <silent> <C-Del> :bd<CR>

"sort scss alphabetically
nnoremap <C-a> :g#\({\n\)\@<=#.,/\.*[{}]\@=/-1 sort<CR>
":h i_CTRL-V

"Make TComment work as I expect
noremap <leader>/ :TComment <CR>
vmap <leader>/ :TCommentBlock<CR>
