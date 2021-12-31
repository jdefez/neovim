-- lsp servers

-- function: on_attach attaching completion to lsp server
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

local servers = {'intelephense', 'phpactor'}

require'lspconfig'.intelephense.setup{}

-- phpactor must be installed glabaly as described here:
--  https://phpactor.readthedocs.io/en/master/usage/standalone.html#installation-global
--  works fine with lspsaga plugin
--  and the path to the executable must be set with
--  vim.g['phpactor_executable'] = '~/phpactor/bin/phpactor'

require'lspconfig'.phpactor.setup{}

-- require'lspconfig'.dockerls.setup{}

-- require'lspconfig'.jsonls.setup{}

-- require'lspconfig'.eslint.setup{}

-- require'lspconfig'.yamlls.setup{}

-- require'lspconfig'.dotls.setup{}

local on_attach = function(client, bufnr)

  local m = require('mapx').setup({ global = false, whichkey = true })
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  m.nname('<leader>w', 'lsp: workspace')
  nnoremap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add workspace folder')
  nnoremap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove workspace folder')
  nnoremap('<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List workspcase folder')
  nnoremap('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Lsp: declaration')
  nnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>', 'Lsp: definition')
  nnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>', 'Lsp: references')
  nnoremap('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Lsp: implementation')
  nnoremap('<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Lsp: format')

  -- saga

  m.nname('<leader>l', 'Lsp')
  nnoremap('<leader>lr', ':Lspsaga rename<CR>', 'Rename')
  nnoremap('<leader>lk', ':Lspsaga hover_doc<cr>', 'Show documentation')
  nnoremap('<leader>ld', ':Lspsaga preview_definition<CR>', 'Preview definition')
  nnoremap('<leader>ls', ':Lspsaga signature_help<CR>', 'Signature help')
  nnoremap('<leader>lh', ':Lspsaga lsp_finder<CR>', 'Word definition and reference')
  nnoremap('<leader>lx', ':Lspsaga code_action<cr>', 'Show code actions')
  vnoremap('<leader>lx', ':<C-U>Lspsaga range_code_action<cr>', 'Show code actions')

  -- illuminate

  nnoremap('<M-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', 'Illuminate next')
  nnoremap('<M-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', 'Illuminate previous')

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
