
set number
set tabstop=4
set shiftwidth=4
set expandtab
filetype plugin on
syntax on
set guifont=Noto\ Mono\ 11
set background=dark
set clipboard=unnamedplus
packadd! dracula
colorscheme dracula
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

imap <F1> .<BS><Esc>Aif () {<CR>.<BS><CR>}<Esc>kA
imap <F2> .<BS><Esc>Afor (int i=0; i<size; i++) {<CR>.<BS><CR>}<Esc>kA
imap <F3> .<BS><Esc>Awhile () {<CR>.<BS><CR>}<Esc>kA
inoremap <F4> .<BS><Esc>A{<CR>.<BS><CR>}<Esc>kA

nmap <F5> :w<CR>:make<CR>
nmap <F6> :w<CR>:make build<CR>
nmap <F7> :w<CR>:make run<CR>

imap <F5> .<BS><Esc>:w<CR>:make<CR>
imap <F6> .<BS><Esc>:w<CR>:make build<CR>
imap <F7> .<BS><Esc>:w<CR>:make run<CR>

nmap <F8> :w<CR>
nmap <F9> *<Esc>:%s//
nmap <F10> :noh<CR>

imap <F8> <Esc>:w<CR>a
imap <F9> System.out.println();<Esc>hi
imap <F10> <Esc>:noh<CR>a

nmap <C-y> Atry {<CR>.<BS><CR>} catch (Exception e) {e.printStackTrace();}<CR><Esc>kk$
imap <C-y> .<BS><Esc>Atry {<CR>.<BS><CR>} catch (Exception e) {e.printStackTrace();}<CR><Esc>kk$A

nmap <C-n> :NERDTree<CR>
nmap <C-t> :NERDTreeToggle<CR>
nmap <C-f> :NERDTreeFind<CR>

imap <C-v> .<BS><Esc>pA

nnoremap <leader>q :call QuickfixToggle()<cr>

nmap <C-l> :call ToggleThemeMode()<CR>
let g:theme_mode = 1
function! ToggleThemeMode()
    if g:theme_mode
        set background=light
        colorscheme iceberg
        let g:theme_mode = 0
    else
        set background=dark
        colorscheme gruvbox
        let g:theme_mode = 1
    endif
endfunction

nnoremap <C-;> :call ToggleFileTypeMode()<CR>
let g:filetype_mode = 1
function! ToggleFileTypeMode()
    if g:filetype_mode
        set filetype=off
        let g:filetype_mode = 0
    else
        set filetype=on
        let g:filetype_mode = 1
    endif
endfunction
nmap Y y$

nnoremap n nzzzv
nnoremap J mzJ`z
nnoremap N Nzzzv

call plug#begin('~/.vim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'tmsvg/pear-tree'
call plug#end()

set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
