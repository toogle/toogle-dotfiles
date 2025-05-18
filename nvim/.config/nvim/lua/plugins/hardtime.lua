return {
  'm4xshen/hardtime.nvim',
  lazy = false,
  dependencies = {
    'MunifTanjim/nui.nvim'
  },
  opts = {
    disabled_keys = {
      ['<Space>'] = { 'n', 'x' }
    }
  }
}
