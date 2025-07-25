return {
  {
    'numToStr/Comment.nvim',
    opts = {},
    config = function()
      require('Comment').setup()

      local api = require 'Comment.api'

      -- Toggle selection (linewise)
      vim.keymap.set('x', '<leader>\\', function()
        vim.api.nvim_feedkeys(esc, 'nx', false)
        api.toggle.linewise(vim.fn.visualmode())
      end)

      -- Toggle selection (blockwise)
      vim.keymap.set('x', '<leader>|', function()
        vim.api.nvim_feedkeys(esc, 'nx', false)
        api.toggle.blockwise(vim.fn.visualmode())
      end)
    end,
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        user_default_options = { names = true, css = true, tailwind = true },
        filetypes = { 'tsx', 'html', 'jsx', 'astro', 'vue', 'hbs' },
      }
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
      'TmuxNavigatorProcessList',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  {
    'nacro90/numb.nvim',
    event = 'BufRead',
    config = function()
      require('numb').setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    'f-person/git-blame.nvim',
    event = 'BufRead',
    config = function()
      vim.cmd 'highlight default link gitblame SpecialComment'
      vim.g.gitblame_enabled = 0
    end,
  },

  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    -- opts = {},
  },

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

  {
    '4DRIAN0RTIZ/complexity.nvim',
    setup = 'pip install lizard',
    config = function()
      require('complexity').setup {
        thresholds = {
          low = 10, -- CCN <= low is considered low complexity
          medium = 15, -- CCN > low and <= medium is medium complexity
          -- CCN > medium is high complexity
        },

        virt_prefix = '⮕ Complexity:', -- text prefix for virtual text
        virt_pos = 'eol', -- extmark position ("eol" or "overlay")

        autosave = false, -- set true to annotate on BufWritePost
        autosave_patterns = { '*.php' }, -- file patterns to trigger autosave
      }
    end,
  },
}
