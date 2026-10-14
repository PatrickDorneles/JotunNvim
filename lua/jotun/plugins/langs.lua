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

  -- TypeScript/JavaScript LSP. Uses tsserver directly and loads the
  -- @styled/typescript-styled-plugin (installed globally) for CSS-in-JS
  -- IntelliSense inside styled-components/emotion template literals.
  -- Replaces ts_ls; no lspconfig/mason registration needed.
  {
    'pmizio/typescript-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
    },
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    opts = {
      settings = {
        tsserver_plugins = {
          '@styled/typescript-styled-plugin',
        },
      },
    },
  },
}
