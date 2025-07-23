return {
  {
    'S1M0N38/love2d.nvim',
    branch = 'main',
    event = 'VeryLazy',
    opts = {
      restart_on_save = true, -- Restart LÖVE when the file is saved
    },
    keys = {
      { '<leader>v', ft = 'lua', desc = 'LÖVE' },
      { '<leader>vv', '<cmd>LoveRun<cr>', ft = 'lua', desc = '[V] Run LÖVE' },
      { '<leader>vs', '<cmd>LoveStop<cr>', ft = 'lua', desc = '[S] Stop LÖVE' },
    },
  },

  -- Tools for plugin development

  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
