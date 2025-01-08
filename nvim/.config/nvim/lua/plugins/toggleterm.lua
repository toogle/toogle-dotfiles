return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({
      open_mapping = [[<C-\>]],
      direction = 'float'
    })

    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*toggleterm#*',
      callback = function()
        vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { buffer = 0 })
        vim.keymap.set('t', '<C-e>', [[<C-\><C-n><C-e>]], { buffer = 0 })
        vim.keymap.set('t', '<C-y>', [[<C-\><C-n><C-y>]], { buffer = 0 })
      end
    })
  end
}
