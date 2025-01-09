vim.filetype.add({
  extension = {
    yml = function(path, bufnr)
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, 5, false)
      local content = table.concat(lines, '\n')
      if vim.regex('docker-compose.*\\.yml$'):match_str(path) ~= nil then
        return 'yaml.docker-compose'
      elseif vim.regex('\\(ansible\\|hosts\\|roles\\|tasks\\|ungrouped\\)'):match_str(content) ~= nil then
        return 'yaml.ansible'
      else
        return 'yaml'
      end
    end
  }
})
