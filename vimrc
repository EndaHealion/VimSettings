
set number
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin on
syntax on
set guifont=Noto\ Mono\ 12
set background=light
colorscheme pyte
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

nmap <F1> Aif () {<CR>.<BS><CR>}<Esc>k$
nmap <F2> Afor (int i=0; i<size; i++) {<CR>.<BS><CR>}<Esc>k$
nmap <F3> Awhile () {<CR>.<BS><CR>}<Esc>k$
nmap <F4> A{<CR>.<BS><CR>}<Esc>k$

imap <F1> .<BS><Esc>Aif () {<CR>.<BS><CR>}<Esc>kA
imap <F2> .<BS><Esc>Afor (int i=0; i<size; i++) {<CR>.<BS><CR>}<Esc>kA
imap <F3> .<BS><Esc>Awhile () {<CR>.<BS><CR>}<Esc>kA
imap <F4> .<BS><Esc>A{<CR>.<BS><CR>}<Esc>kA

nmap <F5> :make<CR>
nmap <F6> :w<CR>:make<CR>

imap <F5> .<BS><Esc>:make<CR>
imap <F6> .<BS><Esc>:w<CR>:make<CR>

nmap <F8> :w<CR>
nmap <F9> *<Esc>:%s//
nmap <F10> :noh<CR>

imap <F8> <Esc>:w<CR>a
imap <F9> System.out.println();<Esc>hi
imap <F10> <Esc>:noh<CR>a

nmap <C-y> Atry {<CR>.<BS><CR>} catch (Exception e) {e.printStackTrace();}<CR><Esc>kk$
imap <C-y> .<BS><Esc>Atry {<CR>.<BS><CR>} catch (Exception e) {e.printStackTrace();}<CR><Esc>kk$A

