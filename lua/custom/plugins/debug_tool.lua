return {
  {
    'williamboman/mason.nvim',
    'mfussenegger/nvim-dap',
    'jay-babu/mason-nvim-dap.nvim',
  },
  require('mason-nvim-dap').setup(),

  -- nvim dap ui
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },

    config = function()
      local dap = require 'dao'
      local dapui = require 'dapui'
      dapui.setup()

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end,
  },
}
