" Setup vimplug for fresh install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Helper to conditionally load plugins
function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction


call plug#begin(stdpath('data') . '/plugged')

Plug 'joshdick/onedark.vim', Cond(!exists('g:vscode'))
Plug 'vim-airline/vim-airline', Cond(!exists('g:vscode'))
Plug 'tpope/vim-surround'
Plug 'ggandor/leap.nvim'
Plug 'bkad/CamelCaseMotion'

call plug#end()

inoremap <Esc> <Esc>`^

nnoremap <SPACE> <Nop>
let mapleader = " "

" Unmap join because I always intend j
nnoremap J j
vnoremap J j

" Delete instead of cut
nnoremap d "_d
xnoremap d "_d

" Intentionally cut
nnoremap <leader>d d
xnoremap <leader>d d

xmap s	<Plug>VSurround

" CamelCase and snake_case aware w and ge
map <silent> w <Plug>CamelCaseMotion_w
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap ge

" CamelCaseMotion_ie does what unmodified iw does on a single word
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie


set showcmd
set whichwrap+=h,l
set tabstop=2
set shiftwidth=2
set expandtab

"super glitchy, causes nvim to hang
"set clipboard=unnamedplus

lua require('leap').add_default_mappings()

if !exists('g:vscode')
  colorscheme onedark
  syntax on
  set number
endif
