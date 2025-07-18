require 'utils.check-file'

return {

  {
    'nvim-neotest/neotest',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',

      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-jest',
      'marilari88/neotest-vitest',
    },
    config = function()
      local is_vitest = check_configfile_exists 'vitest.config.ts'

      local jest_adapter = require 'neotest-jest' {
        jestCommand = 'npm run test -- --detectOpenHandles',
        jestConfigFile = 'custom.jest.config.ts',
        env = { CI = true },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      }

      local vitest_adapter = require 'neotest-vitest'

      local js_adapter = is_vitest == 1 and vitest_adapter or jest_adapter

      require('neotest').setup {
        adapters = {
          js_adapter,
        },
      }

      vim.keymap.set('n', '<leader>tr', '<cmd>lua require("neotest").run.run() <cr>', { desc = '[R]un Nearest [T]est' })
      vim.keymap.set('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%")) <cr>', { desc = '[T]est Current [F]ile' })
      vim.keymap.set('n', '<leader>td', '<cmd>lua require("neotest").run.run({ strategy = "dap" }) <cr>', { desc = '[D]ebug Nearest [T]est' })
      vim.keymap.set(
        'n',
        '<leader>ti',
        '<cmd>lua require("neotest").output.open({ enter = true, auto_close = true, short = true }) <cr>',
        { desc = 'Show [T]est [I]nfo' }
      )
      vim.keymap.set('n', '<leader>tw', '<cmd>lua require("neotest").watch.toggle(vim.fn.expand("%")) <cr>', { desc = '[T]oggle [W]atch On Test File' })
      vim.keymap.set('n', '<leader>tp', '<cmd>lua require("neotest").jump.prev({ status = "failed" }) <cr>', { desc = '[P]revious Failed [T]est' })
      vim.keymap.set('n', '<leader>tn', '<cmd>lua require("neotest").jump.next({ status = "failed" }) <cr>', { desc = '[N]ext Failed [T]est' })
      vim.keymap.set('n', '<leader>ts', '<cmd>lua require("neotest").summary.toggle() <cr>', { desc = 'Toggle [T]ests [S]ummary' })
    end,
  },
}
