let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

function! Cond(Cond, ...)
	let opts = get(a:000, 0, {})
	return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction


call plug#begin(stdpath('data') . '/plugged')

Plug 'joshdick/onedark.vim', Cond(!exists('g:vscode'))
Plug 'vim-airline/vim-airline', Cond(!exists('g:vscode'))
"Plug 'preservim/nerdtree', Cond(!exists('g:vscode'))
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))

Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

Plug 'tpope/vim-surround'

call plug#end()

nnoremap <SPACE> <Nop>

let mapleader = " "
"let lowercase match upper, but not otherway arround
let g:EasyMotion_smartcase = 1 
map <leader> <Plug>(easymotion-prefix)
""map <leader>e <Plug>(easymotion-bd-e)
""map <leader>l <Plug>(easymotion-bd-jk)
map <leader>f <Plug>(easymotion-s)
map <leader>s <Plug>(easymotion-f)
map <leader>S <Plug>(easymotion-F)

" Delete instead of cut
nnoremap <leader>d "_d
xnoremap <leader>d "_d

xmap s	<Plug>VSurround

set showcmd
set whichwrap+=h,l
"super glitchy, causes nvim to hang
"set clipboard=unnamedplus

if !exists('g:vscode')
	colorscheme onedark
	syntax on
	set number
	"set relativenumber
	"ESC + moves cursor after edit instead of before
	"inoremap jk <c-c>`^
	"nnoremap <Tab> :NERDTreeToggle<CR>
endif
