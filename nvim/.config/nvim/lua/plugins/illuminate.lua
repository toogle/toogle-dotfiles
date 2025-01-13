return {
  'RRethy/vim-illuminate',
  event = 'VeryLazy',
  config = function()
    require('illuminate').configure({
      delay = 0
    })

    vim.api.nvim_set_hl(0, 'IlluminatedWordText', {})
    vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { bg = 'NvimDarkYellow' })
    vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { bg = 'NvimDarkYellow' })
  end
}
