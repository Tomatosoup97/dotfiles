set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

Plugin 'nvim-lua/plenary.nvim'  " module for async coroutines, required for others
Plugin 'nvim-telescope/telescope.nvim'  " searching through lists

" LSP
Plugin 'neovim/nvim-lspconfig'
Plugin 'kabouzeid/nvim-lspinstall'
Plugin 'hrsh7th/nvim-cmp'
Plugin 'arakashic/chromatica.nvim'

" chromatica.nvim settings
let g:chromatica#libclang_path='/usr/lib64/libclang.so'
" let g:chromatica#enable_at_startup=1
let g:chromatica#responsive_mode=1

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

" Required conf for nvim-cmp
set completeopt=menu,menuone,noselect
