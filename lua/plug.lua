local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
Plug 'williamboman/nvim-lsp-installer'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug('junegunn/fzf', {dir = '~/.fzf', ['do'] = './install --all'})
-- Plug 'swekaj/php-foldexpr.vim'
-- Plug 'airblade/vim-gitgutter'
-- Plug 'Shougo/neosnippet-snippets'
-- Plug 'Shougo/neosnippet'
-- Plug('phpactor/phpactor', {['for'] = 'php', branch = 'master', ['do'] = 'composer install --no-dev -o'})
-- Plug('neoclide/coc.nvim', {branch = 'release'})
-- Plug 'jreybert/vimagit'
-- Plug 'mattn/emmet-vim'
-- Plug 'psliwka/vim-smoothie'
-- Plug('mg979/vim-visual-multi', {branch = 'master'})
-- Plug 'jparise/vim-graphql'

-- schemes
Plug 'cormacrelf/vim-colors-github'
-- Plug 'phanviet/vim-monokai-pro'

vim.call('plug#end')
