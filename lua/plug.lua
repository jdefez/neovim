local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
Plug 'williamboman/nvim-lsp-installer'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'

-- todo: give it a try
--
-- https://github.com/sindrets/diffview.nvim
-- https://github.com/TimUntersberger/neogit
-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/glepnir/galaxyline.nvim/

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- Plug 'swekaj/php-foldexpr.vim'
-- Plug 'airblade/vim-gitgutter'
-- Plug 'mattn/emmet-vim'
-- Plug('mg979/vim-visual-multi', {branch = 'master'})

-- schemes
Plug 'cormacrelf/vim-colors-github'
-- Plug 'phanviet/vim-monokai-pro'

vim.call('plug#end')
