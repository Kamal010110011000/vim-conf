set tabstop=4 softtabstop=4
set smartindent
set exrc
set relativenumber
set nu
set hidden
set nohlsearch
set noerrorbells
set nowrap
set smartindent
set expandtab
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set colorcolumn=80
set signcolumn=yes

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'gruvbox-community/gruvbox'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
  set termguicolors
endif

colorscheme material
"let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'

highlight Normal guibg=none
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'material'

if !has('nvim')
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
endif
"mode lhs rhs
let mapleader = " "
noremap <leader>ps : lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
noremap <leader>n :NERDTreeFocus<CR>
noremap <C-n> :NERDTree<CR>
noremap <C-t> :NREDTreeToggle<CR>
noremap <C-f> :NERDTreeFind<CR>
noremap <leader>[ :bprevious<CR>
noremap <leader>] :bnext<CR>

fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
endfun

augroup The_PRIMEAGEN
        autocmd!
        autocmd BufWritePre * :call TrimWhitespace()
        autocmd VimEnter * NERDTree
augroup END
