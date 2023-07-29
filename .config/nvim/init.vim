set background=dark
set completeopt=noinsert,menuone,noselect
set cursorline
set hidden
set inccommand=split
set mouse=a
set number
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set clipboard=unnamedplus

set expandtab
set shiftwidth=4
set tabstop=4
set wildmode=longest,list

filetype plugin indent on
syntax on

set t_Co=256

set termguicolors

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

call plug#begin()
    Plug 'ryanoasis/vim-devicons'
    Plug 'dracula/vim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'SmiteshP/nvim-navic'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'romgrk/barbar.nvim'
    Plug 'neovim/nvim-lspconfig'
call plug#end()

colorscheme dracula

lua <<EOF
local navic = require("nvim-navic")
require('nvim-web-devicons').get_icons()

require("lualine").setup({
    sections = {
        lualine_c = {
            {
              function()
                  return navic.get_location()
              end,
              cond = function()
                  return navic.is_available()
              end
            }
        }
    }
  }
)

require("nvim-tree").setup({
  sort_by = "case_insensitive",
  view = {
    width = 30,
    },
  renderer = {
    group_empty = true,
  }
  ,

  filters = {
    dotfiles = true,
  },
})

local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {}
lspconfig.pyright.setup {}
lspconfig.clangd.setup {}

EOF

nnoremap q :NvimTreeToggle<CR>

nnoremap <silent> <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent> <A-.> <Cmd>BufferNext<CR>
tnoremap <Esc> <C-\><C-n>
command ConfigReload :source $MYVIMRC

highlight BufferInactiveMod guifg=#FFA500
highlight BufferCurrentMod guifg=#FFA500
