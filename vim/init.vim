lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
EOF

call plug#begin()

" Make sure you use single quotes

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'mg979/vim-visual-multi'
Plug 'mbbill/undotree'
Plug 'chrisbra/csv.vim'
Plug 'vifm/vifm.vim'
Plug 'davidhalter/jedi-vim'
Plug 'morhetz/gruvbox'
Plug 'whonore/Coqtail'
Plug 'vim-python/python-syntax'
Plug 'psf/black'
Plug 'airblade/vim-gitgutter'
Plug 'bogado/file-line'

Plug 'nvim-lua/plenary.nvim'  " module for async coroutines, required for others
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }  " searching through lists
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-cmp'
Plug 'arakashic/chromatica.nvim'
Plug 'windwp/nvim-spectre'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'github/copilot.vim'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" chromatica.nvim settings
let g:chromatica#libclang_path='/usr/lib64/libclang.so'
" let g:chromatica#enable_at_startup=1
let g:chromatica#responsive_mode=1

let mapleader = ","

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').registers()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').command_history()<cr>
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_stash()<cr>

lua << EOF
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
EOF

" Spectre search&replace
nnoremap <leader>S <cmd>lua require('spectre').open()<CR>
"search current word
nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
" search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre

" Required conf for nvim-cmp
set completeopt=menu,menuone,noselect

" Aliases
command NT NvimTreeToggle

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

" ALE settings
let g:ale_fix_on_save = 1
let g:ale_fixers = {'python': ['isort', 'black']}

let g:ale_set_quickfix = 0
let g:ale_set_loclist = 1

" by some reason it doesn't call it on its own
autocmd BufReadPre,FileReadPre,BufWritePre * execute ':ALEPopulateLocList'

nmap <silent> <C-K> <Plug>(ale_previous_wrap)
nmap <silent> <C-J> <Plug>(ale_next_wrap)

" " Syntastic settings

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_cpp_checkers = ['cpplint']
" let g:syntastic_cpp_cpplint_exec = '~/Anaconda3/bin/cpplint'

" let g:syntastic_python_checkers = ['flake8', 'mypy']

" " disabling noisy tex checker
" let g:syntastic_tex_checkers = []

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_enable_signs = 1


" " Making errors window not too big
" " https://github.com/vim-syntastic/syntastic/issues/1678
" function! SyntasticCheckHook(errors)
"     if !empty(a:errors)
"         let g:syntastic_loc_list_height = min([len(a:errors), 8])
"     endif
" endfunction

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

" nvim-tree.lua
lua << EOF
-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  disable_netrw = true,
  view = {
    width = 32,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
})
EOF
