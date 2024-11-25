" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
call plug#begin()

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'nordtheme/vim'

Plug 'tpope/vim-fugitive'

Plug 'preservim/nerdtree'

Plug 'ryanoasis/vim-devicons'

Plug 'vim-airline/vim-airline'

Plug 'phpactor/phpactor'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'squizlabs/php_codesniffer'

Plug 'praem90/nvim-phpcsf'

Plug 'adalessa/laravel.nvim'

Plug 'mikehaertl/yii-api-vim'

Plug 'dense-analysis/ale'

Plug 'ludovicchabant/vim-gutentags'

Plug 'tpope/vim-abolish'

Plug 'StanAngeloff/php.vim'

Plug 'stephpy/vim-php-cs-fixer'

Plug 'ncm2/ncm2'

Plug 'phpactor/ncm2-phpactor'

let g:airline_powerline_fonts = 1

let g:nvim_phpcs_config_phpcs_path = 'phpcs'

let g:nvim_phpcs_config_phpcbf_path = 'phpcbf'

let g:nvim_phpcs_config_phpcs_standard = 'PSR12' " or path to your ruleset phpcs.xml

let NERDTreeShowHidden = 1

call plug#end()

" Auto close brackets and other stuff
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap {<?} <?= =><ESC><left>

" NerdTree shortcuts

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :call NERDTreeToggleAndRefresh()<CR>

function NERDTreeToggleAndRefresh()
  :NERDTreeToggle
  if g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

nnoremap <C-f> :NERDTreeFind<CR>

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround


" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
" set t_Co=256
" set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
colorscheme nord
