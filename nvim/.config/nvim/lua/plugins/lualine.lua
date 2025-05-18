return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  opts = {
    options = {
      theme = 'nord',
      disabled_filetypes = {
        statusline = {
          'Avante',
          'AvanteInput',
          'AvanteSelectedFiles',
          'alpha',
          'neo-tree',
          'toggleterm',
          'trouble'
        }
      }
    }
  }
}
