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
" --------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
" ColorSchemes
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'rakr/vim-one'
Plug 'marko-cerovac/material.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim' 
" Others
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
Plug 'nanozuki/tabby.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'jayli/vim-easycomplete'
Plug 'mattn/emmet-vim'
Plug 'RRethy/vim-illuminate'
" Brackets auto-completion
Plug 'cohama/lexima.vim'
" Lightline
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
" Native LSP
Plug 'neovim/nvim-lspconfig'
" Lsp - Other
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'tami5/lspsaga.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

let g:neo_tree_remove_legacy_commands = 1
lua require('zarathustra/telescope')
lua require('zarathustra/lsp')
lua require('zarathustra/lspsaga')
lua require('zarathustra/lualine')
lua require('zarathustra/material-theme')
lua require('zarathustra/tabby')
lua require('zarathustra/neotree')
let g:easycomplete_tab_trigger ="<c-space>"
let g:easycomplete_scheme = "rider"
let g:easycomplete_lsp_type_font = {
        \ 'text' : '⚯',         'method':'m',    'function': 'f',
        \ 'constructor' : '≡',  'field': 'f',    'default':'d',
        \ 'variable' : '𝘤',     'class':'c',     'interface': 'i',
        \ 'module' : 'm',       'property': 'p', 'unit':'u',
        \ 'value' : '𝘧',        'enum': 'e',     'keyword': 'k',
        \ 'snippet': '𝘧',       'color': 'c',    'file':'f',
        \ 'reference': 'r',     'folder': 'f',   'enummember': 'e',
        \ 'constant':'c',       'struct': 's',   'event':'e',
        \ 'typeparameter': 't', 'var': 'v',      'const': 'c',
        \ 'operator':'o',
        \ 't':'𝘵',   'f':'𝘧',   'c':'𝘤',   'm':'𝘮',   'u':'𝘶',   'e':'𝘦',
        \ 's':'𝘴',   'v':'𝘷',   'i':'𝘪',   'p':'𝘱',   'k':'𝘬',   'r':'𝘳',
        \ 'o':"𝘰",   'l':"𝘭",   'a':"𝘢",   'd':'𝘥',                                           
        \ }
let g:tokyonight_transparent_sidebar = "true"
let g:tokyonight_colors = { 'bg':'#17002F', 'bg_highlight':'NONE', 'fg':'#ac7298', 'bg_dark':'#24004A' }
let g:material_style = "palenight"

" --- General Configs

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
set mouse=vic
set lazyredraw
set formatoptions+=r
set cursorline
syntax on
" Colors
set termguicolors
colorscheme duskfox
set t_BE=                                                      " Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_Co=256
set background=dark
hi Normal guibg=NONE ctermbg=NONE


" --- Key Mappings

" General
nnoremap <C-s> :w<CR>:so ~/.config/nvim/init.vim<CR>
nnoremap \ss :Telescope find_files<CR> 
map <leader>s :!clear && shellcheck %<CR>
inoremap <Del> <C-w>
nnoremap W $
" Neotree 
nnoremap <silent> \ft :Neotree toggle current reveal_force_cwd<cr>
nnoremap \ff :Neotree reveal<cr>
nnoremap <leader>t :Neotree toggle show buffers right<cr>
nnoremap <leader>g :Neotree float git_status<cr>
" Auto Completion ( I dont know what these are except emmet but,,, duh )
let g:user_emmet_leader_key=','
set completeopt=menuone,noinsert,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_confirm_key = ""
imap <expr> <CR> pumvisible() ? complete_info()["selected"] != "-1" ? "\<Plug>(comletion_confirm_completion)" : "<C-e>\<CR>" : "\<CR>"


