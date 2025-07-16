return {
  {
    'numToStr/Comment.nvim',
    opts = {},
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
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    --optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    --setting the keybinding for LazyGit with 'keys' is recommended in
    --order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Open Lazy[G]it [G]UI' },
    },
  },
}
