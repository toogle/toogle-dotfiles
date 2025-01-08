local opt = vim.opt

-- Appearance
opt.number = true         -- show line numbers
opt.cursorline = true     -- highlight curson line
opt.wrap = false          -- no line wrapping
opt.showmatch = true      -- show matching brackets
opt.showcmd = true        -- show (partial) command in status line
opt.termguicolors = true  -- enable 24-bit colors

-- Search
opt.incsearch = true   -- incremental search
opt.ignorecase = true  -- ignore case of letters while searching
opt.smartcase = true   -- do smart case matching
opt.hlsearch = true    -- highlight matches

-- Editing
opt.backspace = { 'indent', 'eol', 'start' }
opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
opt.formatoptions:append('j')  -- remove a comment leader when joining lines

-- Language settings
opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
opt.spelllang = { 'en_us', 'ru_yo' }

-- Misc
opt.hidden = true       -- allow edit buffers to be hidden
opt.confirm = true      -- ask for confirmation before saving or exiting
opt.errorbells = false  -- disable error bells

-- Filetypes
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
