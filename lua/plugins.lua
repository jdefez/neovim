local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  vim.api.nvim_echo({{'Installing packer.nvim', 'Type'}}, true, {})
  packer_bootstrap = fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Todo: give it a try
  --
  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  -- https://github.com/mfussenegger/nvim-dap

  -- Todo: Not installed + find replacement
  --
  -- Plug 'swekaj/php-foldexpr.vim'
  -- Plug 'mattn/emmet-vim'
  -- Plug('mg979/vim-visual-multi', {branch = 'master'})
  -- Plug 'phanviet/vim-monokai-pro'

  use '/lambdalisue/gina.vim'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup()
    end
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('neogit').setup()
    end
  }

  -- navigation relative plugins

  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- lsp relative plugins

  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'kosayoda/nvim-lightbulb'
  use {
    'folke/lsp-colors.nvim',
    config = function()
      require('lsp-colors').setup({
        Error = '#db4b4b',
        Warning = '#e0af68',
        Information = '#0db9d7',
        Hint = '#10B981'
      })
    end
  }
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {}
    end
  }

  -- use 'nanotee/nvim-lsp-basics'

  -- use {
  --   'ray-x/navigator.lua',
  --   requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}
  -- }

  use 'phpactor/phpactor'

  -- Autocompletion plugin
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-calc'
  use 'hrsh7th/cmp-cmdline'
  use 'quangnguyen30192/cmp-nvim-ultisnips'
  use {
    'SirVer/ultisnips',
    requires = {{'honza/vim-snippets', rtp = '.'}},
    config = function()      
      vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'      
      vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
      vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
      vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }

  -- toggle on/off using :ASToggle
  use {
    'Pocco81/AutoSave.nvim',
    config = function()
      require('autosave').setup{
        {
          enabled = true,
          execution_message = 'AutoSave: saved at ' .. vim.fn.strftime('%H:%M:%S'),
          events = {'InsertLeave', 'TextChanged'},
          conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
          },
          write_all_buffers = false,
          on_off_commands = true,
          clean_command_line_interval = 0,
          debounce_delay = 135
        }
      }
    end
  }

  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        auto_session_enable_last_session = false,
        auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = nil,
        auto_session_suppress_dirs = nil
      }
    end
  }

  use 'kazhala/close-buffers.nvim'

  -- 'gc' to comment visual regions/lines
  use 'tpope/vim-commentary'

  use 'folke/which-key.nvim'

  use {
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup({
        -- dark, dark_default, dimmed, light
        theme_style = 'light',
        function_style = 'italic',
        sidebars = {'qf', 'vista_kind', 'terminal', 'packer'},

        -- Change the 'hint' color to the 'orange' color, and make the 'error'
        -- color bright red
        colors = {hint = 'orange', error = '#ff0000'}
      })
    end
  }

  use 'RRethy/vim-illuminate'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
