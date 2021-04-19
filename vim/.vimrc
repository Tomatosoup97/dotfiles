" **** BEGIN Vundle ****

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-syntastic/syntastic'
Plugin 'itchyny/lightline.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mbbill/undotree'
Plugin 'chrisbra/csv.vim'
Plugin 'codota/tabnine-vim'
Plugin 'vifm/vifm.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" **** END Vundle ****

let mapleader = ","

set relativenumber
set number

syntax on
syntax enable

" allows to easily find files using :find
set path=,.**

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
set colorcolumn=80,89,100
highlight ColorColumn ctermbg=0 guibg=lightgrey


" <Ctrl-l> redraws the screen and removes any search highlighting.
" execute :checktime to trigger file reload (see autoread section)
nnoremap <silent> <C-l> :nohl<CR><C-l> \| :checktime<CR>

" <Ctrl-o> evens selected text to 80 lines
noremap <C-o> <S-j>k \| ::norm gww<CR>

" Aliases
command NT NERDTree
command UT UndotreeToggle

" UndoTree config

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" NerdTree
" -------

" Show dotfiles
let NERDTreeShowHidden=1

" Open buffor automatically when starting NT
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Sidebar window size
let g:NERDTreeWinSize=33

" -------

" NERDTree File highlighting (https://github.com/scrooloose/nerdtree/issues/433#issuecomment-92590696)
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('yml', 'lightmagenta', 'none', 'lightmagenta', '#151515')

call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('cfg', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')

call NERDTreeHighlightFile('md', 'darkcyan', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('j2', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('js', 'lightblue', 'none', 'lightblue', '#151515')
call NERDTreeHighlightFile('py', 'lightgreen', 'none', 'lightgreen', '#151515')



highlight OverLength ctermbg=Brown ctermfg=white guibg=#ba8888
match OverLength /\%89v.\+/

" set history=500

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
colorscheme gruvbox

set background=dark
" set background=light

set encoding=utf8

set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
"   " Respect package order (merlin should be after ocp-index)
"   if count(s:opam_available_tools, tool) > 0
"     call s:opam_configuration[tool]()
"   endif
" endfor

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" ## end of OPAM user-setup addition for vim / base ## keep this line
