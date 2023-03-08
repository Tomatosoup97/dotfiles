let mapleader = ","

set relativenumber
set number

syntax on
syntax enable

" allows to easily find files using :find
set path=,.**

" Disable mouse
set mouse=

" *** BEGIN Autoread ***

" See https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
set autoread
" Trigger autoread on buffer change or terminal focus
au FocusGained,BufEnter * :checktime
" Trigger autoread when cursor stops moving
au CursorHold,CursorHoldI * checktime

" *** END Autoread ***

" Identation

set ai "Auto indent
set si "Smart indent
set nowrap

set backspace=indent,eol,start

set autoindent

set shiftwidth=4
set softtabstop=4
set expandtab

set whichwrap+=<,>,h,l


" Set ruler
set ruler
set colorcolumn=80,89
highlight ColorColumn ctermbg=0 guibg=lightgrey


" <Ctrl-l> redraws the screen and removes any search highlighting.
" execute :checktime to trigger file reload (see autoread section)
nnoremap <silent> <C-l> :nohl<CR><C-l> \| :checktime<CR>
nnoremap <silent> <C-p> :colorscheme gruvbox<CR>

" Copying to clipboard
noremap <Leader>Y "+y
noremap <Leader>P "+p

" <Ctrl-o> evens selected text to 80 lines
noremap <Leader>O <S-j>k \| ::norm gww<CR>

" Aliases
command UT UndotreeToggle

" UndoTree config

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif


highlight OverLength ctermbg=Brown ctermfg=white guibg=#ba8888
match OverLength /\%89v.\+/

" Set X lines to the cursor - when moving vertically using j/k
set so=12

" Searching
" ignore case
set ignorecase
" Try to be smart when searching
set smartcase
" Highligh results
set hlsearch
"
set incsearch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set indent based on filetype
autocmd FileType c,cpp,html set ts=2 sw=2 sts=2

" HIGHLIGHTS

" Show trailing whitespace:

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set guifont=Iosevka\ 22


" Theme
" set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_material_palette = 'material'

set background=dark
" set background=light

set encoding=utf8

set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


" Syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = '~/Anaconda3/bin/cpplint'

let g:syntastic_python_checkers = ['flake8']

" disabling noisy tex checker
let g:syntastic_tex_checkers = []

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1


" Making errors window not too big
" https://github.com/vim-syntastic/syntastic/issues/1678
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 8])
    endif
endfunction



"  Black
autocmd BufWritePre *.py execute ':Black'

" Markdown preview

let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=1


" haskell-vim

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles



" Lightline settings
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '>', 'right': '<' },
      \ 'subseparator': { 'left': '>', 'right': '<' }
      \ }

" ccrypt config
augroup CPT
  au!
  au BufReadPre *.cpt set bin
  au BufReadPre *.cpt set viminfo=
  au BufReadPre *.cpt set noswapfile
  au BufReadPost *.cpt let $vimpass = inputsecret("Password: ")
  au BufReadPost *.cpt silent '[,']!ccrypt -cb -E vimpass
  au BufReadPost *.cpt set nobin
  au BufWritePre *.cpt set bin
  au BufWritePre *.cpt silent! '[,']!ccrypt -e -E vimpass
  au BufWritePost *.cpt silent! u
  au BufWritePost *.cpt set nobin
augroup END


" ## end of OPAM user-setup addition for vim / base ## keep this line
"
let g:jedi#use_tabs_not_buffers = 1

let g:python_highlight_all = 1
let g:python_highlight_func_calls = 0

colorscheme gruvbox
