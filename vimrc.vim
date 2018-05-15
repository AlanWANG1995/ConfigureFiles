syntax on
set background=dark
colorscheme molokai 

filetype off
call plug#begin()
"Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'

Plug 'Shougo/deoplete.nvim',{'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
"Plug	'ervandew/supertab'
Plug 'alvan/vim-closetag'

" beautify plug
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"highlight
Plug 'udalov/kotlin-vim'

"deoplete
Plug 'zchee/deoplete-clang'
call plug#end()

filetype plugin indent on


highlight Pmenu ctermbg=238 gui=bold
" airline setting {
let g:airline_theme="deus"
let g:airline_powerline_fonts=1
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Book
" }
"let g:SuperTabRetainCompletionType='context'

set bsdir=buffer
set t_Co=256
set encoding=utf-8
set laststatus=2
set nocompatible
set fenc=utf-8
set clipboard=unnamedplus

set fenc=uft-8

set number
set mouse=a
set relativenumber
set backspace=2
set backspace=indent,eol,start
set ic
set expandtab
set noswapfile
set softtabstop=2
set cindent shiftwidth=2
set autoindent shiftwidth=2
set smartindent shiftwidth=2
set foldmethod=indent
set foldlevelstart=99
set fileencoding=utf-8

let mapleader=","
let g:mapleader=","

let g:EasyMotion_leader_key = "<leader><leader>" 

let g:deoplete#enable_at_startup = 1
" vimfiler {
  let g:vimfiler_tree_closed_icon = "\u203a"
  let g:vimfiler_tree_opened_icon = "\u2304"
  let g:vimfiler_tree_leaf_icon = ""
  let g:vimfiler_readonly_file_icon = "\ue0a2"
  let g:vimfiler_as_default_explorer = 1
  "let g:vimfiler_safe_mode_by_default = 0
  call vimfiler#custom#profile('default', 'context',{
	\ 'safe' : 0,
	\ 'explorer' : 1,
        \ 'explorer_columns' : 'type'
        \  })
" }
" hi Normal guibg=NONE ctermbg=NONE

"Clang Complete {
  let g:deoplete#sources#clang#libclang_path = "/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1"
  let g:deoplete#sources#clang#clang_header = "/usr/lib/llvm-3.8/lib/clang/3.8.0/include/"
  let g:deoplete#source#clang#sort_algo = "priority"
  "let g:SuperTabDefaultCompletionType 
"}

"autoclose Tag {
  let g:closetag_filenames = '*.html,*.html.erb'
  let g:closetag_emptyTags_caseSensitive = 1
  let g:closetag_shortcut = '>'
  let g:closetag_close_shortcut ='<leader>>'
"}

if has("conceal")
  set conceallevel=2 concealcursor=niv
endif

"Key Mapping {
  inoremap jj <Esc>
  inoremap <C-\> <Esc>o
  nnoremap <M-l> mzgg=G`z

  smap <silent><expr><tab> neosnippet#jumpable() ? "\<plug>(neosnippet_jump)"      : "\<tab>"
  imap <silent><expr><tab> pumvisible()          ? "\<c-n>"                        : (neosnippet#jumpable()   ? "\<plug>(neosnippet_jump)"   : "\<tab>")
  imap <silent><expr><cr>  !pumvisible()         ? "\<cr>\<plug>AutoPairsReturn"   : (neosnippet#expandable() ? "\<plug>(neosnippet_expand)" : deoplete#mappings#close_popup())
  imap <silent><expr><esc> pumvisible()          ? deoplete#mappings#close_popup() : "\<esc>"
  imap <silent><expr><bs>  deoplete#mappings#smart_close_popup()."\<bs>"

  tmap <Esc> <C-\><C-n>
  nnoremap <leader>` :belowright split term://zsh<CR>:set nonumber norelativenumber<CR>i
  nnoremap <leader><leader>` :belowright vsplit term://zsh<CR>:set nonumber norelativenumber<CR>i

  "VimFiler Mapping {
    nmap <C-e> :VimFilerExplorer<CR>
  "}
  "Window Navigation{
    nmap <silent> <C-h> :wincmd h<CR>
    nmap <silent><C-j> :wincmd j<CR>
    nmap <silent> <C-k> :wincmd k<CR>
    nmap <silent> <C-l> :wincmd l<CR>
  "}
  "Line Move{
    nnoremap <C-S-Down> ddp
    nnoremap <C-S-Up> dd<Up>P
    inoremap <C-d> <Esc>yypi
    nnoremap <C-d> yyp
  "}
"
