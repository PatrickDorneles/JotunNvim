-- Description: AI plugins configuration for Neovim

return {
  {
    'sudo-tee/opencode.nvim',
    config = function()
      require('opencode').setup { keymap_prefix = '<leader>a' }

      -- Re-register keymaps with bracketed descriptions ([T]oggle, [I]nput, etc.)
      local config = require 'opencode.config'
      local keymap = require 'opencode.keymap'
      for _, mappings in pairs(config.values.keymap) do
        for _, entry in pairs(mappings) do
          if type(entry) == 'table' and entry.desc then
            entry.desc = entry.desc:gsub('(%w+)', function(word)
              return '[' .. word:sub(1, 1) .. ']' .. word:sub(2)
            end)
          end
        end
      end
      keymap.setup(config.values.keymap.editor)
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
