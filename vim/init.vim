lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
EOF

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
Plugin 'windwp/nvim-spectre'
Plugin 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plugin 'nvim-tree/nvim-tree.lua'


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


" nvim-tree.lua
lua << EOF
-- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true

-- OR setup with some options
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
