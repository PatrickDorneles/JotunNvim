return {
  {
    -- "hoob3rt/lualine.nvim",
    'nvim-lualine/lualine.nvim',
    -- "Lunarvim/lualine.nvim",
    config = function()
      require('lualine').setup {
        options = {
          globalstatus = true,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
      }
    end,
    event = 'VimEnter',
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          always_show_bufferline = true,
          separator_style = 'slope',
        },
      }

      vim.api.nvim_set_keymap('n', '<S-l>', '<cmd>BufferLineCycleNext<cr>', { silent = true })
      vim.api.nvim_set_keymap('n', '<S-h>', '<cmd>BufferLineCyclePrev<cr>', { silent = true })

      vim.api.nvim_set_keymap('n', '<leader>bh', '<cmd>BufferLineCloseLeft<cr>', { silent = true, desc = '[B]uffer Close [H] Left' })
      vim.api.nvim_set_keymap('n', '<leader>bl', '<cmd>BufferLineCloseRight<cr>', { silent = true, desc = '[B]uffer Close [L] Right' })
      vim.api.nvim_set_keymap('n', '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', { silent = true, desc = '[B]uffer Close [O]thers' })

      vim.api.nvim_set_keymap('n', '<leader>c', '<CMD>lua buf_kill()<CR>', { desc = '[C]loses Buffer' })
    end,
  },
  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    config = function()
      local dropbar_api = require 'dropbar.api'
      vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end,
  },
}
