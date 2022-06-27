"       _                    
"__   _(_)_ __ ___  _ __ ___ 
"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__ 
"  \_/ |_|_| |_| |_|_|  \___|
"

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let mapleader=" "
autocmd!
scriptencoding utf-8

" --- Plugins {
" {--------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
" Dependencies (libs & headers)
Plug 'nvim-lua/plenary.nvim'    " For telescope
Plug 'kyazdani42/nvim-web-devicons'     " Icons for neotree
Plug 'MunifTanjim/nui.nvim'     " Lsp popup lib
Plug 'zeertzjq/nvim-paste-fix'
" ColorSchemes
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'rakr/vim-one'
Plug 'marko-cerovac/material.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim' 
" Completion Stuff
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'mattn/emmet-vim'          " Expand abbreviations (snippets in html or so)
Plug 'cohama/lexima.vim'        " Brackets auto-completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind.nvim'
" Prettifying
Plug 'folke/lsp-colors.nvim'    " Colorize the syntax messages
Plug 'nanozuki/tabby.nvim'      " Tabs look cool
Plug 'RRethy/vim-illuminate'    " Highlight other uses of the current word under the cursor
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " Better highlighting
Plug 'nvim-lualine/lualine.nvim'    " That info line below
Plug 'nvim-neo-tree/neo-tree.nvim'  " File explorer
" Native LSP
Plug 'neovim/nvim-lspconfig'        " Lsp Server Protocol
Plug 'tami5/lspsaga.nvim', { 'branch': 'main' }     " In vain
Plug 'nvim-lua/completion-nvim' " LSP completion tool they say it's no longer maintained
call plug#end()

lua require('zarathustra/lsp')
lua require('zarathustra/lspsaga')
lua require('zarathustra/lualine')
lua require('zarathustra/tabby')
lua require('zarathustra/neotree')

" --------------------------------------------------}

" --- General Configs
" {--------------------------------------------------

set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set ignorecase
set smarttab
filetype plugin indent on
set autoindent
set smartindent
set nowrap
set backspace=indent,eol,start
set nobackup
set showcmd
set cmdheight=1
set shell=zsh
set nocompatible
set incsearch nohlsearch                                       " Highlighting
set number relativenumber numberwidth=4                        " Numberings
set tabstop=4 softtabstop=4 expandtab smartindent shiftwidth=4 " Tabbings
set splitright splitbelow                                      " New Tabs
set wildmode=longest,list,full
set hidden
set scrolloff=8
set scroll=5
set mouse=a
set lazyredraw
set formatoptions+=r
set cursorline
set completeopt=menu,menuone,noselect
syntax on
let g:neo_tree_remove_legacy_commands = 1
" Neovide
let g:neovide_refresh_rate=100
let g:neovide_transparency=0.75
let g:neovide_floating_blur_amount_x = 2.0
let g:neovide_floating_blur_amount_y = 2.0
let g:neovide_fullscreen=v:true
let g:neovide_remember_window_size = v:true
let g:neovide_cursor_vfx_mode = "pixiedust"
let g:neovide_cursor_vfx_particle_density=30.0
set guifont=PT\ Mono:h10
set guioptions+=a
" Colors
set termguicolors
colorscheme gruvbox-material "duskfox
set t_Co=256
set background=dark
hi! Normal ctermbg=NONE guibg=NONE
let g:gruvbox_material_transparent_background=1
let g:gruvbox_material_better_performance=1

" --------------------------------------------------}

" --- Key Mappings
" {--------------------------------------------------

" General
nnoremap <C-s> :w<CR>:so ~/.config/nvim/init.vim<CR>
inoremap <S-v> <Esc>"+pa
inoremap <S-c> <Esc>"+ya
map <leader>s :!clear && shellcheck %<CR>
inoremap <Del> <C-w>
nnoremap W $
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
" Neotree 
nnoremap <silent> <leader>y :Neotree toggle current reveal_force_cwd<cr>
nnoremap <silent> <leader>t :Neotree filesystem reveal left<cr>
" Enable nvim-treesitter
map <silent> \hh :TSEnable highlight indent incremental_selection<CR>
" Enable TabNine Pro completion tool hell yeah
nnoremap <silent> \tt :CmpTabnineHub<CR>
" Auto completion for emmet
let g:user_emmet_leader_key=','

" --------------------------------------------------}

" --- Completion Screen Colors
" {--------------------------------------------------

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

" --------------------------------------------------}
