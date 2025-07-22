--#region Utils

function check_configfile_exists(filename)
  local cwd = vim.fn.getcwd()
  return vim.fn.filereadable(cwd .. '/' .. filename)
end

function check_any_configfile_exists(filenames)
  local cwd = vim.fn.getcwd()
  local exists = false

  for i, filename in ipairs(filenames) do
    exists = vim.fn.filereadable(cwd .. '/' .. filename) == 1 or exists
  end

  return exists
end
--#endregion
