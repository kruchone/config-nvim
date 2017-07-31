syntax on
colorscheme Tomorrow-Night

set nowrap

let mapleader="\<SPACE>"

set tabstop=2
set shiftwidth=2
set expandtab
set number
set ruler
set autochdir
set colorcolumn=119

set clipboard=unnamed

" open terminal with L-t
nnoremap <silent> <Leader>t :split<CR> :terminal<CR>
nnoremap <silent> <Leader>n :tabnew .<CR>

" clear search with CR after search
nnoremap <cr> :noh<CR><CR>:<backspace>

" plugins
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'unblevable/quick-scope'
Plug 'hynek/vim-python-pep8-indent'
Plug 'leafgarland/typescript-vim'
call plug#end()

" lightline
set laststatus=2 " allows lightline on singlewindow panes
set noshowmode " lightline shows us the mode, we dont need it from vim
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [['mode', 'paste'], ['readonly', 'modified'], ['fugitive', 'filename']],
    \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype']],
    \ },
    \ 'component': {
    \   'readonly': '%{&readonly?"":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&& &modified)',
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightLineFugitive'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }
function! LightLineFugitive()
    if exists("*fugitive#head")
        let _ = fugitive#head()
        return strlen(_) ? ' '._ : ''
    endif
    return ''
endfunction

" netrw
let g:netrw_liststyle = 3
let g:netrw_banner=0
let g:netrw_preview=1
let g:netrw_list_hide= '.*\.swp,__pycache__,.*\.pycm.*\.pyo'
nnoremap <Leader>% :Vexplore<CR>
nnoremap <Leader>" :Sexplore<CR>

" fzf
nmap <C-P> :FZF<CR>

