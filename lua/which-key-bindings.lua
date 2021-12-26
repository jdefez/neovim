local wk = require("which-key")

wk.register({
  -- todo:
  --  - phpactor (augroup?)
  --  - illuminate
  --  - gitsigns
  b = {
    name = '+buffer',
    c = {'<cmd>BDelete this<CR>', 'Close current buffer'},
    h = {'<cmd>BDelete hidden<CR>', 'Close hidden buffers'},
    n = {'<cmd>BDelete nameless<CR>', 'Close nameless buffers'},
  },
  d = {
    name = '+trouble',
    t = {'<cmd>TroubleToggle<CR>', 'Toggle trouble'},
    w = {'<cmd>TroubleToggle workspace_diagnostics<CR>', 'Toggle trouble diagnostics'},
    d = {'<cmd>TroubleToggle document_diagnostics<CR>', 'Toggle document diagnostics'},
    q = {'<cmd>TroubleToggle quickfix<CR>', 'Toggle quickfix'},
    l = {'<cmd>TroubleToggle loclist<CR>', 'Toggle loclist'},
    R = {'<cmd>TroubleToggle lsp_references<CR>', 'Toggle lsp references'}
  },
  f = {
    name = '+telescope',
    f = {'<cmd>Telescope find_files<CR>', 'Find file'},
    g = {'<cmd>Telescope live_grep<CR>', 'Live grep'},
    b = {'<cmd>Telescope buffers<CR>', 'Buffers'},
    h = {'<cmd>Telescope help_tags<CR>', 'Tags'},
    c = {'<cmd>Telescope git_commits<CR>', 'List commits'},
    s = {'<cmd>Telescope git_status<CR>', 'Show git status'}
  },
  h = {
    name = '+hunk',
    s = {'<cmd>Gitsigns stage_hunk<CR>', 'Stage hunk'},
    u = {'<cmd>Gitsigns undo_stage_hunk<CR>', 'Undo stage hunk'},
    U = {'<cmd>Gitsigns reset_buffer_index<CR>', 'Reset buffer index'},
    r = {'<cmd>Gitsigns reset_hunk<CR>', 'Reset hunk'},
    R = {'<cmd>Gitsigns reset_buffer<CR>', 'Reset buffer'},
    S = {'<cmd>Gitsigns stage_buffer<CR>', 'Stage buffer'},
    p = {'<cmd>Gitsigns preview_hunk<CR>', 'Preview hunk'}
  },
  p = {
    name = '+php',
    m = {'<cmd>PhpactorContextMenu<CR>', 'show phpactor context menu'},
    t = {'<cmd>PhpactorTransform<CR>', 'show phpactor transform menu'},
    em = {'<C-u>PhpactorExtractMethod<CR>', 'phpactor extract method'},
    ee = {'<C-u>PhpactorExtractExpression<CR>', 'phpactor extract expression'}
  }
}, {prefix = '<leader>'})
