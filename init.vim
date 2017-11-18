" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

call plug#begin('~/.local/share/nvim/plugged')

Plug 'w0rp/ale', { 'do': 'npm install -g standard' }
Plug 'jiangmiao/auto-pairs'

" History
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Auto-Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " Use deoplete
    let g:deoplete#enable_at_startup = 1
    " Allow tab to manually complete
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Appearance
Plug 'vim-airline/vim-airline'
    let g:airline_powerline_fonts = 1
Plug 'vim-airline/vim-airline-themes'

" Javascript
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'nikvdp/ejs-syntax'
Plug 'pangloss/vim-javascript'
au FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab

" Colorschemes
Plug 'rakr/vim-one'
    autocmd Colorscheme one let g:airline_theme='one'

call plug#end()

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
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
