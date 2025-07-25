return {
  {
    'smoka7/hop.nvim',
    version = '*',
    opts = {
      keys = 'etovxqpdygfblzhckisuran',
    },
    config = function()
      require('hop').setup {}
      vim.api.nvim_set_keymap('n', 'f', ':HopWord<cr>', { silent = true })
    end,
  },
}
