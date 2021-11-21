
set number
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin on
syntax on
set guifont=Noto\ Mono\ 12
set background=light
colorscheme hemisu
set clipboard=unnamedplus
set hlsearch
set ignorecase
set smartcase
set cursorline
set cindent
set splitright
set splitbelow
set incsearch
set relativenumber
nmap <F1> Aif () {<CR>.<CR>}<Esc>k$vd
nmap <F2> Afor (int i=0; i<size; i++) {<CR>.<CR>}<Esc>k$vd
nmap <F3> Awhile () {<CR>.<CR>}<Esc>k$vd
nmap <F4> A{<CR>.<CR>}<Esc>k$vd
nmap <F5> :make<CR>
nmap <F6> :w<CR>:make<CR>
imap <F1> .<BS><Esc>Aif () {<CR>.<CR>}<Esc>k$vda
imap <F2> .<BS><Esc>Afor (int i=0; i<size; i++) {<CR>.<CR>}<Esc>k$vda
imap <F3> .<BS><Esc>Awhile () {<CR>.<CR>}<Esc>k$vda
imap <F4> .<BS><Esc>A{<CR>.<CR>}<Esc>k$vda
imap <F5> .<BS><Esc>:make<CR>
imap <F6> .<BS><Esc>:w<CR>:make<CR>
nmap <F8> :w<CR>
imap <F8> <Esc>:w<CR>a
imap <F10> <Esc>:noh<CR>a
nmap <F10> :noh<CR>
nmap <F9> *<Esc>:%s//
