"Make sure we can load pathogen from our bundle
"then add our runtime path
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

"General Settings
set nocompatible
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

"Ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby colorscheme vividchalk
autocmd FileType ruby,eruby call Pl#Load()

"Powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2
set guifont=Ubuntu\ Mono\ for\ Powerline\ 12
