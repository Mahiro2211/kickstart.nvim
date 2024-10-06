-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- require "custom.keymap"

  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true, opts = ... },
  -- python 环境管理器
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'mfussenegger/nvim-dap-python', --optional
      { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
    },
    lazy = false,
    branch = 'regexp', -- This is the regexp branch, use this for the new version

    config = function()
      require('venv-selector').setup {
        settings = {
          search = {
            anaconda_base = {
              command = 'fd python.exe $HOME/.conda --full-path ',
              type = 'anaconda',
            },
          },
        },
      }
    end,
    keys = {
      { ',v', '<cmd>VenvSelect<cr>' },
    },
  },

  -- 项目管理
  {
    'coffebar/neovim-project',
    opts = {
      projects = { -- define project roots
        'D:/coding/*',
        'D:/coding/Python_Project/*',
        'D:/coding/Python_Project/*/*',
        'C:/Users/douhuanmin/AppData/Local/nvim',
      },
      picker = {
        type = 'telescope', -- or "fzf-lua"
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append 'globals' -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      -- optional picker
      { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
      -- optional picker
      { 'ibhagwan/fzf-lua' },
      { 'Shatur/neovim-session-manager' },
    },
    lazy = false,
    priority = 100,
  },
}
