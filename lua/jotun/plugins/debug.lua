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

    -- Setup DAP UI
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
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
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Setup mason-dap
    require('mason-nvim-dap').setup {
      automatic_installation = true,
      ensure_installed = { 'delve', 'js-debug-adapter' },
    }

    -- DAP for Go
    require('dap-go').setup {
      delve = {
        detached = vim.fn.has 'win32' == 0,
      },
    }

    -- JS Debug adapter setup for launch mode
    local js_debug_path = vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter'
    local adapter_path = js_debug_path .. '/js-debug/src/dapDebugServer.js'

    dap.adapters['node'] = function(callback, _)
      local js_debug_path = vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter'
      local adapter_path = js_debug_path .. '/js-debug/src/dapDebugServer.js'
      local port = 8123

      local handle
      local pid_or_err
      local opts = {
        stdio = { nil, nil, nil },
        args = { adapter_path, '--server=127.0.0.1:' .. port },
        detached = true,
      }

      handle, pid_or_err = vim.loop.spawn('node', opts, function(code)
        handle:close()
        if code ~= 0 then
          vim.notify('js-debug-adapter exited with code ' .. code, vim.log.levels.ERROR)
        end
      end)

      -- Wait for adapter to open the port before calling callback
      local function connect_when_ready()
        local socket = require 'socket'
        local client = socket.tcp()
        client:settimeout(0.1)
        local ok = client:connect('127.0.0.1', port)
        if ok then
          client:close()
          callback {
            type = 'server',
            host = '127.0.0.1',
            port = port,
          }
        else
          vim.defer_fn(connect_when_ready, 100)
        end
      end

      connect_when_ready()
    end

    -- Load .vscode/launch.json
    require('dap.ext.vscode').load_launchjs(nil, {
      node = { 'javascript', 'typescript' },
      ['node-launch'] = { 'javascript', 'typescript' },
    })
  end,
}
