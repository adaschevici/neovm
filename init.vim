cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa
cnoreabbrev qA qa
cnoreabbrev WQ wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev Wq wq

set clipboard+=unnamedplus
set wrap

if &compatible
  set nocompatible               " Be iMproved
endif
" Required:
" root/.config/nvim/repos/github.com/Shougo/dein.vim
set runtimepath^=~/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.config/nvim/repos/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.


call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/syntastic')
call dein#add('kien/ctrlp.vim')
call dein#add('fatih/vim-go')
call dein#add('jimenezrick/vimerl')
call dein#add('nvie/vim-flake8')
call dein#add('rust-lang/rust.vim')
call dein#add('pangloss/vim-javascript')
call dein#add('maksimr/vim-jsbeautify')
call dein#add('mxw/vim-jsx.git')
call dein#add('derekwyatt/vim-scala')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')
call dein#add('mhinz/vim-signify')
call dein#add('Shougo/deoplete.nvim')
call dein#add('chrisbra/csv.vim')
call dein#add('tshirtman/vim-cython')
call dein#add('elixir-lang/vim-elixir')


" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" set nocompatible              " be iMproved, required
set number
" filetype off                  " required
" 
" " set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
" 
" " let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'
" Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
" Plugin 'kien/ctrlp.vim'
" Plugin 'fatih/vim-go'
" Plugin 'jimenezrick/vimerl'
" Plugin 'nvie/vim-flake8'
" Plugin 'rust-lang/rust.vim'
" Plugin 'pangloss/vim-javascript'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'mxw/vim-jsx.git'
" Plugin 'derekwyatt/vim-scala'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'tpope/vim-fugitive'
" Plugin 'mhinz/vim-signify'
" call vundle#end()            " required
" filetype plugin indent on    " required

set history=700                " Sets how many lines of history VIM has to remember

set nocompatible
colo jellybeans
syntax on

set showmode

set autoindent
set smartindent
set backspace=eol,start,indent

set expandtab
set tabstop=4
set shiftwidth=4
set ruler

set ignorecase
set smartcase
set hlsearch
set nowrap
set laststatus=2
set cmdheight=2
if exists('loaded_trailing_whitespace_plugin') | finish | endif
let loaded_trailing_whitespace_plugin = 1

if !exists('g:extra_whitespace_ignored_filetypes')
    let g:extra_whitespace_ignored_filetypes = []
endif

function! ShouldMatchWhitespace()
    for ft in g:extra_whitespace_ignored_filetypes
        if ft ==# &filetype | return 0 | endif
    endfor
    return 1
endfunction

" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * if ShouldMatchWhitespace() | match ExtraWhitespace /\s\+$/ | endif

" The above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * if ShouldMatchWhitespace() | match ExtraWhitespace /\s\+$/ | endif
autocmd InsertEnter * if ShouldMatchWhitespace() | match ExtraWhitespace /\s\+\%#\@<!$/ | endif

function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction
highlight Search ctermbg=LightBlue ctermfg=white
vnoremap // y/<C-R>"<CR>
let g:go_fmt_command = "goimports"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
" let g:go_fmt_fail_silently = 1

set ttimeoutlen=50
let g:airline_theme = 'powerlineish'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_use_quickfix_lists = 0
let g:jsx_ext_required = 0
" Deoplete using yay
" let g:deoplete#enable_at_startup = 1

au FileType python setl sw=4 sts=4 et
au FileType css setl sw=2 sts=2 et
au FileType js setl sw=2 sts=2 et
au FileType go setl sw=4 sts=4 et
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
let g:syntastic_javascript_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
let g:syntastic_javascript_standard_args = "--global $ --global it --global describe"
let g:syntastic_version = '3.4.0-107'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap F :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap \ :Ag<SPACE>
