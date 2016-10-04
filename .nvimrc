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
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'mhinz/vim-grepper'
Plug 'tomtom/tcomment_vim'

" Colorschemes
Plug 'whatyouhide/vim-gotham'
Plug 'flazz/vim-colorschemes'

" Syntax Checking
Plug 'scrooloose/syntastic'
Plug 'neomake/neomake', { 'on': 'Neomake' }

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
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'samuelsimoes/vim-jsx-utils'
Plug 'mlaursen/vim-react-snippets'
Plug 'alampros/vim-react-keywords'
Plug 'mxw/vim-jsx'
Plug 'carlitux/deoplete-ternjs'

"PHP
Plug 'shawncplus/phpcomplete.vim'
Plug 'tanarurkerem/drupal-snippets'

" Python Plugins
Plug 'zchee/deoplete-jedi'
"Stupid Coffee Script Because dummies
Plug 'kchmck/vim-coffee-script'

"Git plugin
Plug 'tpope/vim-fugitive'

" Lua
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'

"Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

" Donnie says this is important
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

call plug#end()
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#neomake#enabled = 0

autocmd! BufWritePost * Neomake

syntax on
colorscheme gotham
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
set termguicolors

let g:airline_theme="gotham" 
"add .p8 as lua for pico-8
au BufNewFile,BufRead *.p8 set filetype=lua

"deoplete stuff
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#omni#input_patterns.java = [
    \'[^. \t0-9]\.\w*',
    \'[^. \t0-9]\->\w*',
    \'[^. \t0-9]\::\w*',
    \]
let g:deoplete#omni#input_patterns.jsp = ['[^. \t0-9]\.\w*']
let g:deoplete#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.java = ['omni']
call deoplete#custom#set('javacomplete2', 'mark', '')
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

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
