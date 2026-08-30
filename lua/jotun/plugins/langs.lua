return {

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

  -- CSS-in-JS (styled-components / emotion): native CSS LSP inside template literals
  {
    'crafts69guy/styled-components.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'neovim/nvim-lspconfig',
    },
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    opts = {
      enabled = true,
      cssls_config = {
        settings = {
          css = {
            lint = { unknownAtRules = 'ignore' },
          },
        },
      },
    },
  },
}
