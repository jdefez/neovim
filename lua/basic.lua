
vim.g.mapleader = ' '

vim.wo.colorcolumn = '81'
vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.cmdheight = 3
vim.opt.cursorline = true
-- vim.opt.encoding = utf-8
vim.opt.expandtab = true
vim.opt.foldcolumn = '0'
vim.opt.foldmethod = 'indent'
vim.opt.formatoptions = vim.opt.formatoptions:append('c') -- Autowrap comments using textwidth
vim.opt.formatoptions = vim.opt.formatoptions:append('j') -- Delete comment character when joining commented lines
vim.opt.formatoptions = vim.opt.formatoptions:append('l') -- Do not wrap lines that have been longer when starting insert mode already
vim.opt.formatoptions = vim.opt.formatoptions:append('n') -- Recognize numbered lists
vim.opt.formatoptions = vim.opt.formatoptions:append('q') -- Allow formatting of comments with gq.
vim.opt.formatoptions = vim.opt.formatoptions:append('r') -- Insert comment leader after hitting <Enter>
vim.opt.formatoptions = vim.opt.formatoptions:append('t') -- Auto-wrap text using textwidth
vim.opt.ignorecase = true
--vim.opt.noerrorbells = true
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.pumheight = 40
vim.opt.scrolloff = 1000 -- number of screen lines to show around the cursor
vim.opt.shiftround = true
vim.opt.shiftwidth = 0
vim.opt.shortmess = vim.opt.shortmess:append('c')
vim.opt.showfulltag = true
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.tabstop = 2
vim.opt.undolevels = 10000
-- vim.opt.updatetime = 300

vim.opt.termguicolors = true
