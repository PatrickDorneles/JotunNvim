-- Description: AI plugins configuration for Neovim

return {
  {
    'sudo-tee/opencode.nvim',
    config = function()
      require('opencode').setup {
        keymap_prefix = '<leader>a',
        keymap = {
          editor = {
            -- Remap toggle to <leader>aa
            ['<leader>aa'] = { 'toggle', desc = 'Toggle Opencode window' },
            ['<leader>ag'] = false,
            -- Quick chat on <leader>aq
            ['<leader>aq'] = { 'quick_chat', mode = { 'n', 'x' }, desc = 'Quick chat with current context' },
            -- Disable noisy keymaps (toggle + <leader>q already handle open/close)
            ['<leader>a/'] = false,
            ['<leader>ai'] = false,
            ['<leader>aI'] = false,
            ['<leader>ao'] = false,
            ['<leader>at'] = false,
            ['<leader>aT'] = false,
            ['<leader>az'] = false,
            ['<leader>av'] = false,
            ['<leader>ax'] = false,
            ['<leader>att'] = false,
            ['<leader>atr'] = false,
            ['<leader>atm'] = false,
          },
        },
      }
    end,
    dependencies = {
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          anti_conceal = { enabled = false },
          file_types = { 'markdown', 'opencode_output' },
        },
        ft = { 'markdown', 'Avante', 'copilot-chat', 'opencode_output' },
      },
      -- Optional, for file mentions and commands completion, pick only one
      'saghen/blink.cmp',
      -- 'hrsh7th/nvim-cmp',

      -- Optional, for file mentions picker, pick only one
      'folke/snacks.nvim',
      -- 'nvim-telescope/telescope.nvim',
      -- 'ibhagwan/fzf-lua',
      -- 'nvim_mini/mini.nvim',
    },
  },
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    opts = {
      filetypes = {
        gdscript = false,
      },
      panel = {
        enabled = false,
      },
      suggestion = {
        auto_trigger = true,
        hide_during_completion = false,
        keymap = {
          accept = '<c-y>',
          next = '<c-n>',
          prev = '<c-p>',
        },
      },
    },
  },
}
