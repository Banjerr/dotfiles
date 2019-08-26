call plug#begin('~/.vim/plugged')

" Nerd commenter
Plug 'scrooloose/nerdcommenter'

" Surround
Plug 'tpope/vim-surround'

" NERD Tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" GIT Fugitive
Plug 'tpope/vim-fugitive'

" GIT Gutter
Plug 'airblade/vim-gitgutter'

" VIM Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Startify
Plug 'mhinz/vim-startify'

" Diff stuff
Plug 'mhinz/vim-signify'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" FZF
Plug '/usr/local/opt/fzf'

" Bufferline
Plug 'bling/vim-bufferline'

" Buffergator
Plug 'jeetsukumaran/vim-buffergator'

" ALE
Plug 'dense-analysis/ale'

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" LANGUAGE JUNK
Plug 'sheerun/vim-polyglot'

" Completion stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Settings stuff
set number
set history=1000
set showcmd
set showmode
set incsearch
set hlsearch
set wrap
set linebreak
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" MAPPINGS
map <C-n> :NERDTreeToggle<CR>

" Close NERDTree if its the last thing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" FANCY arrows for NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop=1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'

" Startify stuff
function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
    \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:center(startify#fortune#cowsay())
let g:startify_custom_footer = s:center(['Whoop', 'there it', 'is'])

" ALE stuff
" Enable ESLint only for JavaScript.
let b:ale_linters = {'javascript': ['eslint']}
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#enabled = 1


