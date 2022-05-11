call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/ctags.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-powerline'
Plug 'danro/rename.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/tComment'
Plug 'mattn/emmet-vim'
Plug 'godlygeek/tabular'
Plug 'Lokaltog/vim-easymotion'
Plug 'https://github.com/airblade/vim-gitgutter.git'
"Plug 'iamcco/markdown-preview.nvim',{ 'do': ':call mkdp#util#install()', 'for': ['markdown', 'vim-plug'] }
Plug 'iamcco/markdown-preview.vim'
Plug 'Raimondi/delimitMate'
Plug 'tomasr/molokai'
Plug 'vim-latex/vim-latex'
Plug 'gerw/vim-latex-suite'
" Initialize plugin system
call plug#end()

set nocompatible
set autoindent

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" Leader
let mapleader = ","

set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set autowrite
set confirm
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gbk,gb2312,big5
set termencoding=utf-8
set encoding=utf-8 fileencoding=gb2312    " gb2312(unix),cp936(windows)
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on
filetype plugin on

autocmd BufNewFile *.sh,*.py,*.md exec ":call SetTitle()"

func SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File   : ".expand("%"))
        call append(line(".")+1, "\# Author : xxxxxxx")
        call append(line(".")+2, "\# Email  : xxxxxxxx@gmail.com")
        call append(line(".")+3, "\# Time   : ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    elseif &filetype == 'python'
        call setline(1, "#!/usr/bin/env python")
        call append(line("."), "# -*- coding: utf-8 -*-")
        call append(line(".")+1,"\"\"\"")
        call append(line(".")+2, "\# @File   : ".expand("%"))
        call append(line(".")+3, "\# @Author : xxxxxxx")
        call append(line(".")+4, "\# @Email  : xxxxxxxx@gmail.com")
        call append(line(".")+5, "\# @Time   : ".strftime("%c"))
        call append(line(".")+6, "")
        call append(line(".")+7, "\"\"\"")
        call append(line(".")+8, "")
    elseif &filetype == 'markdown'
        call setline(1,"\/*")
        call append(line("."), "\ > File Name: ".expand("%"))
        call append(line(".")+1, "\ > Author: xxxxxxx")
        call append(line(".")+2, "\ > Email: xxxxxxxx@gmail.com")
        call append(line(".")+3, "\ > Created Time: ".strftime("%c"))
        call append(line(".")+4, "")
        call append(line(".")+5, "\*/")
        call append(line(".")+6, "")
    endif

endfunc

autocmd BufNewFile * normal G

" Color
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded guibg=#0A0A0A guifg=#9090D0

set t_Co=256

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  "autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 4 spaces
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Code folding
set foldenable
set foldmethod=syntax
"set foldmethod=indent
set foldcolumn=0
set foldclose=all

" Search results high light
set hlsearch

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=40
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
autocmd vimenter * if !argc() | NERDTree | endif " Automatically open a NERDTree if no files where specified
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " Close vim if the only window left open is a NERDTree
nmap <F5> :NERDTreeToggle<cr>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

autocmd Syntax javascript set syntax=jquery " JQuery syntax support

set matchpairs+=<:>
"set statusline+=%{fugitive#statusline()} " Git Hotness

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " Ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

set laststatus=2 " Always display the status line
"set statusline+=%{fugitive#statusline()} " Git Hotness

" Markdown
"let g:mkdp_path_to_chrome = "google-chrome"
let g:mkdp_path_to_chrome = "firefox"
let g:mkdp_auto_start = 1
let g:mkdp_auto_open = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:vim_markdown_frontmatter = 1

" Javascript
syntax enable
source $VI /usr/share/vim/vim74/syntax/javascript.vim

" up down
nnoremap <up> <C-u>
nnoremap <down> <C-d>
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l

" vim-gitgutter
let g:gitgutter_max_signs = 2000

" Quicker
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>

" Arduino
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" delimitMate
let delimitMate_matchpairs = "(:),[:],{:}"
