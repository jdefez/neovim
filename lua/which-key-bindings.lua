local wk = require("which-key")

wk.register({
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
  l = {
    name = '+saga',
    r = {'<cmd>Lspsaga rename<CR>', 'Rename'},
    k = {'<cmd>Lspsaga hover_doc<cr>', 'Show documentation'},
    d = {'<cmd>Lspsaga preview_definition<CR>', 'Preview definition'},
    s = {'<cmd>Lspsaga signature_help<CR>', 'Signature help'},
    x = {'<cmd>Lspsaga code_action<cr>', 'Show code actions'},
    x = {':<c-u>Lspsaga range_code_action<cr>', 'Show code actions'}
  },
  p = {
    name = '+php',
    m = {'<cmd>PhpactorContextMenu<CR>', 'Show phpactor context menu'},
    t = {'<cmd>PhpactorTransform<CR>', 'Show phpactor transform menu'},
    em = {'<C-u>PhpactorExtractMethod<CR>', 'Phpactor extract method'},
    ee = {'<C-u>PhpactorExtractExpression<CR>', 'Phpactor extract expression'}
  },
  t = {
    name = '+test',
    t = {'<cmd>TestNearest<CR>', 'Run nearest test'},
    T = {'<cmd>TestFile<CR>', 'Run test file'},
    a = {'<cmd>TestSuite<CR>', 'Run test suite'},
    l = {'<cmd>TestLast<CR>', 'Run latest test'},
    g = {'<cmd>TestVisit<CR>', 'Visit test'}
  }
}, {prefix = '<leader>'})
