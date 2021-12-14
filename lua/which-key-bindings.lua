local wk = require("which-key")

wk.register({
  -- todo:
  --  - phpactor (augroup?)
  --  - illuminate
  --  - gitsigns
  --  - BDelete
  f = {
    name = '+telescope',
    f = {'<cmd>Telescope find_files<cr>', 'Find file'},
    g = {'<cmd>Telescope live_grep<cr>', 'Live grep'},
    b = {'<cmd>Telescope buffers<cr>', 'Buffers'},
    h = {'<cmd>Telescope help_tags<cr>', 'Tags'},
    c = {'<cmd>Telescope git_commits<cr>', 'Git commits'},
    s = {'<cmd>Telescope git_status<cr>', 'Git status'}
  },
  x = {
    name = '+trouble',
    x = {'<cmd>TroubleToggle<cr>', 'Toggle trouble'},
    w = {'<cmd>TroubleToggle workspace_diagnostics<cr>', 'Toggle trouble diagnostics'},
    d = {'<cmd>TroubleToggle document_diagnostics<cr>', 'Toggle document diagnostics'},
    q = {'<cmd>TroubleToggle quickfix<cr>', 'Toggle quickfix'},
    l = {'<cmd>TroubleToggle loclist<cr>', 'Toggle loclist'},
    R = {'<cmd>TroubleToggle lsp_references<cr>', 'Toggle lsp references'}
  }
}, {prefix = '<leader>'})
