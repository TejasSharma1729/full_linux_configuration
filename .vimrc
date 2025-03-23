set number
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set foldmethod=syntax
autocmd Filetype c,cpp,java setlocal foldmethod=syntax
autocmd Filetype make,python setlocal foldmethod=indent
autocmd Filetype make setlocal noexpandtab
set foldlevel=100
set hls
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'bfrg/vim-cpp-modern'
Plugin 'scrooloose/nerdtree'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'davidhalter/jedi-vim'
Plugin 'github/copilot.vim'
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'ptzz/lf.vim'
Plugin 'voldikss/vim-floaterm'
call vundle#end()
filetype plugin indent on
syntax on
syntax enable
set backspace=indent,eol,start
set laststatus=2
set noshowmode
set mouse=anv
colorscheme gruvbox
let g:livepreview_previewer = 'open -a Preview'
let NERDTreeShowHidden=1
