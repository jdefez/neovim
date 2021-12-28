-- lsp servers

-- function: on_attach attaching completion to lsp server
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

local servers = {'intelephense', 'phpactor'}

require'lspconfig'.intelephense.setup{}

-- phpactor must be installed glabaly as described here:
--  https://phpactor.readthedocs.io/en/master/usage/standalone.html#installation-global
--  and the path to the executable must be set with
--  vim.g['phpactor_executable'] = '~/phpactor/bin/phpactor'

require'lspconfig'.phpactor.setup{}

-- require'lspconfig'.dockerls.setup{}

-- require'lspconfig'.jsonls.setup{}

-- require'lspconfig'.eslint.setup{}

-- require'lspconfig'.yamlls.setup{}

-- require'lspconfig'.dotls.setup{}

local on_attach = function(client, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  local binding_opts = { noremap = true, silent = true }

  -- Enable completion triggered by <c-x><c-o>

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.

  -- See `:help vim.lsp.*` for documentation on any of the below functions

  -- default mappings

  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', binding_opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', binding_opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', binding_opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', binding_opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', binding_opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', binding_opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', binding_opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', binding_opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', binding_opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', binding_opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', binding_opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', binding_opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', binding_opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', binding_opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', binding_opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', binding_opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', binding_opts)

  -- saga mappings

  buf_set_keymap('n', 'lr', '<cmd>Lspsaga rename<CR>', binding_opts)
  buf_set_keymap('n', '<leader>lx', '<cmd>Lspsaga code_action<cr>', binding_opts)
  buf_set_keymap('x', '<leader>lx', ':<c-u>Lspsaga range_code_action<cr>', binding_opts)
  buf_set_keymap('n', 'lk',  '<cmd>Lspsaga hover_doc<cr>', binding_opts)
  buf_set_keymap('n', 'ld', '<cmd>Lspsaga preview_definition<CR>', binding_opts)
  buf_set_keymap('n', 'ls', '<cmd>Lspsaga signature_help<CR>', binding_opts)
  buf_set_keymap('n', '<C-u>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<cr>', binding_opts)
  buf_set_keymap('n', '<C-d>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<cr>', binding_opts)

  require 'illuminate'.on_attach(client)

end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local lspconfig = require('lspconfig')

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    capabilities = capabilities,
  }
end
