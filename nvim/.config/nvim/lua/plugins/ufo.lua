return {
  'kevinhwang91/nvim-ufo',
  lazy = false,
  dependencies = {
    'kevinhwang91/promise-async'
  },
  init = function()
    vim.opt.foldcolumn = '0'
    vim.opt.foldlevel = 99  -- using ufo provider need a large value
    vim.opt.foldlevelstart = 99
    vim.opt.foldenable = true
  end,
  opts = {},
  keys = {
    { 'zR', function() require('ufo').openAllFolds() end, desc = 'Open All Folds' },
    { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Close All Folds' }
  }
}
