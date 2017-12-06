let mapleader=','
let maplocalleader=','

" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.local/share/nvim/plugged')

" behavior
" Plug 'critiqjo/lldb.nvim'

Plug 'w0rp/ale'

Plug 'majutsushi/tagbar'

Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-rooter'
Plug 'mhinz/vim-grepper'
	nnoremap <leader>s :Grepper -tool ag<cr>
	nnoremap <leader># :Grepper -tool ag -cword -noprompt<cr>
	autocmd VimEnter * noremap <silent> <C-u> :lne<CR>
	autocmd VimEnter * noremap <silent> <C-i> :lpr<CR>
	autocmd VimEnter * noremap <silent> <C-j> :cn<CR>
	autocmd VimEnter * noremap <silent> <C-k> :cp<CR>
"Plug 'neomake/neomake'
"	nnoremap <silent> <leader>m :Neomake<cr>
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'kassio/neoterm'
	nnoremap <silent> <leader>tc :call neoterm#close()<cr>
	command! -nargs=+ Tg :T git <args>
Plug 'janko-m/vim-test'
	nmap <silent> <leader>t :TestNearest<CR>
	nmap <silent> <leader>T :TestFile<CR>
	nmap <silent> <leader>a :TestSuite<CR>
	nmap <silent> <leader>l :TestLast<CR>
	nmap <silent> <leader>g :TestVisit<CR>
	let test#strategy = 'neovim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	let g:fzf_action = {
				\ 'ctrl-t': 'tab split',
				\ 'ctrl-x': 'split',
				\ 'ctrl-v': 'vsplit' }
	nnoremap <silent> <c-x> :FZF<cr>
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	let g:deoplete#enable_at_startup = 1
	let g:deoplete#omni#input_patterns = {}
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
	inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	nnoremap <silent> <leader>f :NERDTreeToggle<cr>
	let NERDTreeMinimalUI=1
Plug 'Xuyuanp/nerdtree-git-plugin'

" appearance
Plug 'vim-airline/vim-airline'
	let g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'
	nnoremap <silent> <leader>d :GitGutterLineHighlightsToggle<cr>

Plug 'rliang/nvim-pygtk3', {'do': 'make install'}

" javascript
Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }
	autocmd FileType javascript nnoremap <silent> <buffer> <leader>gd :TernDef<CR>
Plug 'nikvdp/ejs-syntax'
Plug 'pangloss/vim-javascript'

" python
Plug 'zchee/deoplete-jedi'

" vala
Plug 'arrufat/vala.vim'

" CSS
autocmd FileType css,scss,less set iskeyword+=-

" Rust
Plug 'rust-lang/rust.vim'

" typescript
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript'

" tex
Plug 'reedes/vim-pencil'

augroup tex
	autocmd!
	autocmd BufRead *.tex setlocal spell spelllang=en_us
	autocmd BufRead *.tex set linebreak
	autocmd BufRead *.tex call pencil#init({'wrap': 'soft'})
augroup END

" c
Plug 'tweekmonster/deoplete-clang2'
" Plug 'zchee/deoplete-clang'
" let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'

" colorschemes
Plug 'mhartington/oceanic-next'
	autocmd ColorScheme OceanicNext let g:airline_theme='oceanicnext'
Plug 'freeo/vim-kalisi'
	autocmd ColorScheme kalisi let g:airline_theme='kalisi'
Plug 'mhinz/vim-janah'
	autocmd ColorScheme janah highlight Normal ctermbg=235
	autocmd ColorScheme janah let g:airline_theme='bubblegum'
" nginx
Plug 'chr4/nginx.vim'

" TOML syntax
Plug 'cespare/vim-toml'

" gitignore
Plug 'gisphm/vim-gitignore'

" markdown
"Plug 'plasticboy/vim-markdown'

Plug 'rakr/vim-one'
	autocmd ColorScheme one let g:airline_theme='one'

call plug#end()

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

colorscheme one
set background=dark

filetype plugin indent on
syntax on
set nofoldenable
set nu
set laststatus=2
set noshowmode
set encoding=utf-8
set hlsearch
set autowrite
set termencoding=utf-8
set mouse=a
set shiftwidth=4
set tabstop=4
set ignorecase
set smartcase
set scrolloff=10
set fileformats=unix,dos,mac
set completeopt-=preview
set backspace=indent,eol,start
set wildmenu
set incsearch
set shortmess+=I
set showcmd

inoremap <c-u> <esc> viwgUi
inoremap <c-y> <esc> ddi
inoremap <c-d> <esc> yypi
inoremap aa <esc> A

" Reopen at last position if possible
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
