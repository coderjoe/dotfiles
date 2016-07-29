set nocompatible " The future is now!
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle for fundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'SirVer/ultisnips'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/matchit.zip'

call vundle#end()
filetype plugin indent on

"General Settings
filetype on
filetype plugin on
filetype indent on
compiler ruby
set history=1000
set cf
set ffs=unix,dos,mac

"Extra filetype settings
" Php, php3, php4, etc.
au BufNewFile,BufRead *.ctp,*.thtml	setf php

"Theme/Colors
set background=dark
syntax on
colorscheme torte

"Files/Backups
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/temp

"Visual cues
set ruler

"Highlight whitespace at the end of a line
highlight WhitespaceEOL ctermbg=blue guibg=blue
match WhitespaceEOL /\s\+$/

" Text formatting/layout
set autoindent
set smartindent
set cindent
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
set nowrap
set smarttab

"Folding
set foldenable "turn it on
set foldmethod=indent "folding should be wary of indents
set foldlevel=100 "don't fold anything (but let me fold manually)
