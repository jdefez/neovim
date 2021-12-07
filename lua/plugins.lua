-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
-- :PackerCompile

-- Remove any disabled or unused plugins
-- :PackerClean

-- Clean, then install missing plugins
-- :PackerInstall

-- Clean, then update and install plugins
-- :PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
-- :PackerSync

-- Loads opt plugin immediately
-- :PackerLoad completion-nvim ale

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use 'tpope/vim-fugitive'
  use 'tpope/vim-obsession'
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- Fugitive-companion to interact with github
  --use 'tpope/vim-rhubarb'

  -- "gc" to comment visual regions/lines
  use 'tpope/vim-commentary'
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Collection of configurations for built-in LSP client
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use {
    'glepnir/galaxyline.nvim', branch = 'main',
    -- config = function() require'statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {'cormacrelf/vim-colors-github', as = 'colorscheme github'}

  -- todo: give it a try
  --
  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  -- https://github.com/lewis6991/gitsigns.nvim
  -- https://github.com/sindrets/diffview.nvim
  -- https://github.com/TimUntersberger/neogit
  -- https://github.com/mfussenegger/nvim-dap
  -- https://github.com/nvim-lualine/lualine.nvim

  -- Plug 'swekaj/php-foldexpr.vim'
  -- Plug 'mattn/emmet-vim'
  -- Plug('mg979/vim-visual-multi', {branch = 'master'})
  -- Plug 'phanviet/vim-monokai-pro'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
