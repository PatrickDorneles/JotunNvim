vim.g.mapleader = ' '
vim.opt.clipboard:append 'unnamedplus'

vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>')

vim.keymap.set('n', '<leader><leader>', "<Cmd>call VSCodeNotify('workbench.action.reloadWindow')<CR>")

vim.keymap.set('n', '<leader>e', "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
vim.keymap.set('n', '<C-h>', "<Cmd>call VSCodeNotify('workbench.view.explorer')<CR>")

vim.keymap.set('n', '<leader>z', "<Cmd>call VSCodeNotify('workbench.action.toggleZenMode')<CR>")

-- Find
vim.keymap.set('n', '<leader>ff', "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
vim.keymap.set('n', '<leader>fg', "<Cmd>call VSCodeNotify('workbench.view.search')<CR>")

-- Write and Quit
vim.keymap.set('n', '<leader>w', "<Cmd>call VSCodeNotify('workbench.action.files.save')<CR>")
vim.keymap.set('n', '<leader>c', "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")
vim.keymap.set('n', '<leader>q', "<Cmd>call VSCodeNotify('workbench.action.revertAndCloseActiveEditor')<CR>")
vim.keymap.set('n', '<leader>Q', "<Cmd>call VSCodeNotify('workbench.action.closeAllEditors')<CR>")

-- Buffer to Tab Navigation
vim.keymap.set('n', 'L', "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
vim.keymap.set('n', 'H', "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")

-- LSP
vim.keymap.set('n', '<leader>lr', "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
vim.keymap.set('n', 'za', "<Cmd>call VSCodeNotify('editor.toggleFold')<CR>")
vim.keymap.set('n', 'gr', "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")

-- Git
vim.keymap.set('n', 'gr', "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")

vim.keymap.set('n', '<a-j>', ':m .+1<CR>==', { desc = 'Move Line Down' })
vim.keymap.set('n', '<a-k>', ':m .-2<CR>==', { desc = 'Move Line Up' })

vim.keymap.set('x', '<a-j>', ":m '>+1<CR>gv-gv", { desc = 'Move Line Down' })
vim.keymap.set('x', '<a-k>', ":m '<-2<CR>gv-gv", { desc = 'Move Line Up' })
