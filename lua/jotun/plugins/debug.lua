-- debug.lua

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'leoluz/nvim-dap-go',
    'mxsdev/nvim-dap-vscode-js',
  },
  keys = {
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>dB',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint',
    },
    {
      '<F7>',
      function()
        local dap = require 'dap'
        local dapui = require 'dapui'
        if dap.session() then
          dapui.toggle()
        else
          vim.notify('No active debug session', vim.log.levels.WARN)
        end
      end,
      desc = 'Debug: Toggle UI',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- VSCode-like layout: variables/watch/stack/breakpoints on the left,
    -- console + REPL at the bottom.
    dapui.setup {
      wrap = false,
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      mappings = {
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
        toggle = 't',
        watch = 'w',
      },
      element_mappings = {},
      expand_lines = true,
      force_buffers = true,
      layouts = {
        {
          elements = {
            { id = 'scopes', size = 0.25 },
            { id = 'breakpoints', size = 0.25 },
            { id = 'stacks', size = 0.25 },
            { id = 'watches', size = 0.25 },
          },
          size = 40,
          position = 'left',
        },
        {
          elements = { 'repl', 'console' },
          size = 10,
          position = 'bottom',
        },
      },
      floating = {
        max_height = nil,
        max_width = nil,
        border = 'rounded',
        mappings = { close = { 'q', '<Esc>' } },
      },
      controls = {
        enabled = true,
        element = 'repl',
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
      render = {
        indent = 1,
        max_value_lines = 100,
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Setup mason-dap. Note: js-debug must be referenced by its adapter name
    -- `js` (mapped to the `js-debug-adapter` package); the package name itself
    -- is not resolvable here and would be silently skipped.
    require('mason-nvim-dap').setup {
      automatic_installation = true,
      ensure_installed = { 'delve', 'js' },
    }

    -- DAP for Go
    require('dap-go').setup {
      delve = {
        detached = vim.fn.has 'win32' == 0,
      },
    }

    -- JS/TS debugging via vscode-js-debug (installed by mason and exposed on
    -- PATH as `js-debug-adapter`). This replaces the previous manual adapter
    -- spawn which needed luarocks' `socket` and a hand-rolled port poll.
    require('dap-vscode-js').setup {
      debugger_cmd = { 'js-debug-adapter' },
      adapters = { 'pwa-node' },
    }

    -- VSCode aliases the legacy `node` type to the js debugger
    dap.adapters['node'] = dap.adapters['pwa-node']

    for _, language in ipairs { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' } do
      dap.configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch via npm',
          runtimeExecutable = 'npm',
          runtimeArgs = { 'run-script', 'debug' },
          cwd = '${workspaceFolder}',
          console = 'integratedTerminal',
          internalConsoleOptions = 'neverOpen',
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach to process',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
      }
    end

    -- `.vscode/launch.json` is now read automatically by nvim-dap providers
    -- (`:h dap-providers`), so `dap.ext.vscode.load_launchjs` is no longer needed.
  end,
}
