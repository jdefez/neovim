local wk = require("which-key")

wk.register({
  -- todo:
  --  - phpactor (augroup?)
  --  - illuminate
  --  - gitsigns
  b = {
    name = '+buffer',
    c = {'<cmd>BDelete this', 'Close current buffer'},
    h = {'<cmd>BDelete hidden', 'Close hidden buffers'},
    n = {'<cmd>BDelete nameless', 'Close nameless buffers'},
  },
  d = {
    name = '+trouble',
    t = {'<cmd>TroubleToggle<cr>', 'Toggle trouble'},
    w = {'<cmd>TroubleToggle workspace_diagnostics<cr>', 'Toggle trouble diagnostics'},
    d = {'<cmd>TroubleToggle document_diagnostics<cr>', 'Toggle document diagnostics'},
    q = {'<cmd>TroubleToggle quickfix<cr>', 'Toggle quickfix'},
    l = {'<cmd>TroubleToggle loclist<cr>', 'Toggle loclist'},
    R = {'<cmd>TroubleToggle lsp_references<cr>', 'Toggle lsp references'}
  },
  f = {
    name = '+telescope',
    f = {'<cmd>Telescope find_files<cr>', 'Find file'},
    g = {'<cmd>Telescope live_grep<cr>', 'Live grep'},
    b = {'<cmd>Telescope buffers<cr>', 'Buffers'},
    h = {'<cmd>Telescope help_tags<cr>', 'Tags'},
    c = {'<cmd>Telescope git_commits<cr>', 'List commits'},
    s = {'<cmd>Telescope git_status<cr>', 'Show git status'}
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
  }
}, {prefix = '<leader>'})
