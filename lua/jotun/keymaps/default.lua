return function()
  vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = '[W]rite Buffer' })
  vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = '[Q]uit Pane/Nvim' })
  vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Open [E]xplorer' })

  vim.keymap.set('n', '<a-j>', ':m .+1<CR>==', { desc = 'Move Line Down' })
  vim.keymap.set('n', '<a-k>', ':m .-2<CR>==', { desc = 'Move Line Up' })

  vim.keymap.set('x', '<a-j>', ":m '>+1<CR>gv-gv", { desc = 'Move Line Down' })
  vim.keymap.set('x', '<a-k>', ":m '<-2<CR>gv-gv", { desc = 'Move Line Up' })

  -- Clear highlights on search when pressing <Esc> in normal mode
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  -- Splits into horizontal and vertical splits
  -- Use `|` to split vertically
  -- Use `\` to split horizontally
  vim.keymap.set('n', '|', ':vsplit<CR>')
  vim.keymap.set('n', '\\', ':split<CR>')
end
