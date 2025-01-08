return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {},
  config = function()
    local flash = require('flash')
    flash.setup({
      multi_window = false,
      modes = {
        search = {
          enabled = true,
          jump = {
            history = true,
            register = true,
            nohlsearch = true
          }
        },
        char = {
          enabled = false
        }
      }
    })

    vim.keymap.set({ 'x', 'o' }, 's', function() flash.jump() end, { desc = 'Flash' })
    vim.keymap.set({ 'x', 'o' }, 'S', function() flash.treesitter() end, { desc = 'Flash Treesitter' })
    vim.keymap.set('o', 'r', function() flash.remote() end, { desc = 'Remote Flash' })
    vim.keymap.set({ 'x', 'o' }, 'R', function() flash.treesitter_search() end, { desc = 'Treesitter Search' })

    vim.api.nvim_set_hl(0, 'FlashLabel', { ctermbg = 'red', ctermfg = 'white', bg = 'red' })
  end
}
