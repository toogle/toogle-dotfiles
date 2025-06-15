local g = vim.g
local opt = vim.opt
local keymap = vim.keymap

-- Neovide settings
if g.neovide then
  opt.guifont = 'JetBrainsMono Nerd Font Mono:h14'
  opt.background = 'dark'

  -- Option Key is Meta
  g.neovide_input_macos_option_key_is_meta = 'both'

  -- Turn off scroll animation
  g.neovide_scroll_animation_far_lines = 0
  g.neovide_scroll_animation_length = 0.00

  -- Save
  keymap.set({ 'n', 'v', 'i', 'c' }, '<D-s>', '<cmd>update<CR>')

  -- Select all
  keymap.set({ 'n', 'v' }, '<D-a>', '<cmd>normal! ggVG<CR>')

  -- Clipboard
  keymap.set('x', '<D-c>', '"+y')
  keymap.set('x', '<D-x>', '"+x')
  keymap.set({ 'n', 'v', 'i', 'c', 't' }, '<D-v>', function()
    vim.api.nvim_paste(vim.fn.getreg('+'), false, -1)
  end)

  -- Font scaling
  keymap.set({ 'n', 'v' }, '<D-=>', function()
    g.neovide_scale_factor = g.neovide_scale_factor + 0.1
  end)
  keymap.set({ 'n', 'v' }, '<D-->', function()
    g.neovide_scale_factor = g.neovide_scale_factor - 0.1
  end)
  keymap.set({ 'n', 'v' }, '<D-0>', function()
    g.neovide_scale_factor = 1
  end)
end
