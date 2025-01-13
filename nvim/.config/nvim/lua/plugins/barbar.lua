return {
  'romgrk/barbar.nvim',
  lazy = false,
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {},
  keys = {
    -- Buffer navigation
    { '<A-[>', mode = 'n', '<cmd>BufferPrevious<CR>', desc = 'Go to previous buffer' },
    { '<A-]>', mode = 'n', '<cmd>BufferNext<CR>', desc = 'Go to next buffer' },
    { '<A-1>', mode = 'n', '<cmd>BufferGoto 1<CR>', desc = 'Go to buffer 1' },
    { '<A-2>', mode = 'n', '<cmd>BufferGoto 2<CR>', desc = 'Go to buffer 2' },
    { '<A-3>', mode = 'n', '<cmd>BufferGoto 3<CR>', desc = 'Go to buffer 3' },
    { '<A-4>', mode = 'n', '<cmd>BufferGoto 4<CR>', desc = 'Go to buffer 4' },
    { '<A-5>', mode = 'n', '<cmd>BufferGoto 5<CR>', desc = 'Go to buffer 5' },
    { '<A-6>', mode = 'n', '<cmd>BufferGoto 6<CR>', desc = 'Go to buffer 6' },
    { '<A-7>', mode = 'n', '<cmd>BufferGoto 7<CR>', desc = 'Go to buffer 7' },
    { '<A-8>', mode = 'n', '<cmd>BufferGoto 8<CR>', desc = 'Go to buffer 8' },
    { '<A-9>', mode = 'n', '<cmd>BufferGoto 9<CR>', desc = 'Go to buffer 9' },
    { '<A-0>', mode = 'n', '<cmd>BufferLast<CR>', desc = 'Go to last buffer' },

    -- Pin/unpin buffer
    { '<A-p>', mode = 'n', '<cmd>BufferPin<CR>', desc = 'Pin/unpin current buffer' },

    -- Close buffer
    { '<A-w>', mode = 'n', '<cmd>BufferClose<CR>', desc = 'Close current buffer' }
  }
}
