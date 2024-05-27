" Plugs
call plug#begin('~/.vim/plugged')
" TEMA
Plug 'terroo/vim-simple-emoji'
Plug 'ryanoasis/vim-devicons'
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERDTree
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Python
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale', { 'do': 'pip install flake8 isort yapf' }
Plug 'maralla/completor.vim', { 'do': 'pip install jedi' }
Plug 'davidhalter/jedi-vim'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'

" Outros
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'vimsence/vimsence'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" Tema do VIM
set termguicolors

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

" Sets principais
set nu!
set tabstop=2
set shiftwidth=2
set expandtab
syntax on 
set autoindent
set mouse=a
set title
set cursorline
set encoding=UTF-8

" Mapeamentos basicos
map q :quit<CR>
map <C-s> :write<CR> "echo 'stty -ixon' >> ~/.bashrc && exec $SHELL'

" Python
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'python': [
\       'isort',
\       'yapf',
\       'remove_trailing_lines',
\       'trim_whitespace'
\   ]
\}

" Jedi
let g:jedi#completions_enabled = 0

" vim-test
let test#python#runner = 'pytest'

" Airlane
let g:airline_theme = 'tokyonight'

" NerdTREE
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
