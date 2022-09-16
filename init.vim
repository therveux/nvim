let mapleader=','
let maplocalleader=','

" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.local/share/nvim/plugged')

" Dependencies

Plug 'Shougo/neocomplcache' 	" Depenency for Shougo/neosnippet
Plug 'godlygeek/tabular' 	" This must come before plasticboy/vim-markdown
Plug 'tpope/vim-rhubarb'        " Depenency for tpope/fugitive

" General plugins

Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 		" Completion list
	let g:deoplete#enable_at_startup = 1
	" let g:deoplete#omni#input_patterns = {}
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
	inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'vim-airline/vim-airline'						" Vim status bar at IDE's bottom
	let g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'					" Navigation between Vim pane TODO: Section shortcuts
Plug 'ctrlpvim/ctrlp.vim'          					" CtrlP is installed to support tag finding in vim-go
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }	" Command line finder
	let g:fzf_action = {
				\ 'ctrl-t': 'tab split',
				\ 'ctrl-x': 'split',
				\ 'ctrl-v': 'vsplit' }
	nnoremap <silent> <c-x> :FZF<cr>
Plug 'majutsushi/tagbar'						" Overview tags sidebar
Plug 'mhinz/vim-signify'						" Vim diff using sign in side column
Plug 'sbdchd/neoformat'							" Formatting code
Plug 'scrooloose/nerdcommenter'						" Comment line
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }			" Display project structure
	nnoremap <silent> <leader>f :NERDTreeToggle<cr>
	let NERDTreeMinimalUI=1
Plug 'Xuyuanp/nerdtree-git-plugin'					" Show file git status
Plug 'jiangmiao/auto-pairs'						" Auto pair () {} []
Plug 'tpope/vim-surround'						" Surround text with brackets, tags whatever
Plug 'sebdah/vim-delve'							" Debugging Go application
Plug 'tpope/vim-fugitive'						" Git wrapper
Plug 'w0rp/ale'
let g:ale_linters = {
\   'javascript': ['standard'],
\   'typescript': ['standard']
\ }
"Plug 'sheerun/vim-polyglot'
"  let g:polyglot_disabled = ['go']
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-sleuth'							" Automatically adjusts 'shiftwidth' and 'expandtab'
Plug 'alvan/vim-closetag' 						" Close corresponding tag
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.mdx'

" Language support

Plug 'fatih/vim-go'                       " Go support
Plug 'zchee/deoplete-go', { 'do': 'make'} " Go auto completion
Plug 'fishbullet/deoplete-ruby'           " Ruby auto completion
Plug 'chr4/nginx.vim'                     " nginx syntax highlighting
Plug 'cespare/vim-toml'                   " toml syntax highlighting
Plug 'gisphm/vim-gitignore'               " gitignore syntax highlighting
Plug 'mxw/vim-jsx'                        " JSX syntax highlighting
Plug 'plasticboy/vim-markdown'            " Markdown syntax highlighting
Plug 'zimbatm/haproxy.vim'                " HAProxy syntax highlighting
Plug 'mattn/emmet-vim'                    " html syntax highlighting
Plug 'zchee/deoplete-jedi'                " Python syntax highlighting

"----------------------------------------------
" Javascript
"----------------------------------------------
Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }
	autocmd FileType javascript nnoremap <silent> <buffer> <leader>gd :TernDef<CR>
Plug 'nikvdp/ejs-syntax'
Plug 'pangloss/vim-javascript'
  au FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab


" CSS
autocmd FileType css,scss,less set iskeyword+=-


Plug 'rliang/nvim-pygtk3', {'do': 'make install'}

"----------------------------------------------
" Colorschemes
"----------------------------------------------
Plug 'mhartington/oceanic-next'
	autocmd ColorScheme OceanicNext let g:airline_theme='oceanicnext'
Plug 'freeo/vim-kalisi'
	autocmd ColorScheme kalisi let g:airline_theme='kalisi'
Plug 'mhinz/vim-janah'
	autocmd ColorScheme janah highlight Normal ctermbg=235
	autocmd ColorScheme janah let g:airline_theme='bubblegum'
Plug 'rakr/vim-one'
	autocmd ColorScheme one let g:airline_theme='one'

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------

filetype plugin indent on
set nofoldenable
set nu
set laststatus=2
set noshowmode
set encoding=utf-8
set mouse=a
set shiftwidth=4
set tabstop=4
set ignorecase
set smartcase
set shortmess+=I
set showcmd
set noerrorbells " No bells!
set novisualbell " I said, no bells!
set expandtab    " expands tabs to spaces
set noswapfile   " disable swapfile usage
set list         " show trailing whitespace
set cursorline   " highlight the current line for the cursor
set autowriteall " write on :quit
set autoindent   " take indent for new line from previous line
set smartindent  " enable smart indentation

" Allow vim to set a custom font or color for a word
syntax enable

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

inoremap <c-u> <esc> viwgUi
inoremap <c-y> <esc> ddi
inoremap <c-d> <esc> yypi
inoremap aa <esc> A
" Rebind 'p' keystroke to pasting under current line
nnoremap <c-p> :pu<CR>

" Reopen at last position if possible
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif

augroup docker
  autocmd!
  autocmd BufNewFile,BufRead Dockerfile.* set filetype=dockerfile
  autocmd BufNewFile,BufRead Dockerfile.* set syntax=dockerfile
augroup END

"----------------------------------------------
" Colors
"----------------------------------------------

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set background=dark

" One colorscheme settings
let g:one_allow_italics = 1

colorscheme one

"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4


" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

