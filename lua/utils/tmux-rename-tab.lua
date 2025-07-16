local uv = vim.uv
local prename = 'nvim'

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  callback = function()
    os.execute("tmux rename-window '" .. prename .. ':' .. vim.fs.basename(vim.fn.getcwd()) .. "'")
  end,
})

vim.api.nvim_create_autocmd({ 'VimLeave' }, {
  callback = function()
    os.execute "tmux rename-window ''"
    if vim.env.TMUX_PLUGIN_MANAGER_PATH then
      uv.spawn(vim.env.TMUX_PLUGIN_MANAGER_PATH .. '/tmux-window-name/scripts/rename_session_windows.py', {})
    end
  end,
})
