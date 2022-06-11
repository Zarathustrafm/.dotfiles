" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Custom
set incsearch
set nohlsearch
set number
set numberwidth=4
set relativenumber
set termguicolors
set tabstop=4
set softtabstop=4
set expandtab
set smartindent
set shiftwidth=4
set splitbelow
set splitright
set hidden
set scrolloff=8
set scroll=10
syntax on
map \p i(<Esc>ea)<Esc>
map \o i{<Esc>ea}<Esc>
