-- Display
vim.opt.termguicolors = true
vim.opt.number = true
vim.lsp.inlay_hint.enable(true)

-- Indent
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Editor
vim.opt.scrolloff = 8

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Fold
vim.opt.foldlevel = 99

-- Terminal Title
vim.opt.title = true
vim.opt.titlestring = 'nvim | %{fnamemodify(getcwd(),":t")}'

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
