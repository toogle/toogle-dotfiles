return {
  'kevinhwang91/nvim-bqf',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    {
      'yorickpeterse/nvim-pqf',
      opts = {
        max_filename_length = 32
      }
    }
  },
  opts = {},
  -- ft = 'qf'
}
