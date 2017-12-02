let mapleader=','
let maplocalleader=','

" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0rp/ale'

Plug 'majutsushi/tagbar'

Plug 'jiangmiao/auto-pairs'

Plug 'airblade/vim-rooter'

"Plug 'neomake/neomake'
"	nnoremap <silent> <leader>m :Neomake<cr>
Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-sleuth'

Plug 'kassio/neoterm'
	nnoremap <silent> <leader>tc :call neoterm#close()<cr>
	command! -nargs=+ Tg :T git <args>

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

"Plug 'rliang/nvim-pygtk3', {'do': 'make install'}
"
" javascript
Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm install -g tern' }
	autocmd FileType javascript nnoremap <silent> <buffer> <leader>gd :TernDef<CR>
Plug 'nikvdp/ejs-syntax'
Plug 'pangloss/vim-javascript'

" nginx
Plug 'chr4/nginx.vim'

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
" To color code
syntax on 
" Enable line number
set nu
set encoding=utf-8
" Show vi command while typing 
set showcmd
" Ignore case for research
set ignorecase
" Enable mouse in normal mode
set mouse=a
" To save the changes in files automatically
set autowrite
set shiftwidth=4
set tabstop=4

inoremap <c-u> <esc> viwgUi
inoremap <c-y> <esc> ddi
inoremap <c-d> <esc> yypi
inoremap aa <esc> A
