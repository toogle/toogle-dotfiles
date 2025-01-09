local g = vim.g
local opt = vim.opt
local keymap = vim.keymap

-- Neovide settings
if g.neovide then
  opt.guifont = 'DejaVuSansM Nerd Font Mono:h14'
  opt.background = 'dark'

  -- Turn off all animations
  -- g.neovide_position_animation_length = 0
  -- g.neovide_cursor_animation_length = 0.00
  -- g.neovide_cursor_trail_size = 0
  -- g.neovide_cursor_animate_in_insert_mode = false
  -- g.neovide_cursor_animate_command_line = false
  g.neovide_scroll_animation_far_lines = 0
  g.neovide_scroll_animation_length = 0.00

  keymap.set({ 'n', 'v', 'i', 'c' }, '<D-s>', '<cmd>update<CR>')
  keymap.set('x', '<D-c>', '"+y')
  keymap.set('x', '<D-x>', '"+x')
  keymap.set({ 'n', 'v', 'i', 'c' }, '<D-v>', function()
    vim.api.nvim_paste(vim.fn.getreg('+'), false, -1)
  end)

  -- Tab navigation
  keymap.set('n', '<D-w>', '<cmd>tabclose<CR>')
  keymap.set('n', '<D-}>', 'gt', { noremap = true })
  keymap.set('n', '<D-{>', 'gT', { noremap = true })
end

