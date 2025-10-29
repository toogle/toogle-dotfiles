return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  config = function()
    require('nvim-treesitter.configs').setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = { query = '@function.outer', desc = 'Select function region' },
            ['if'] = { query = '@function.inner', desc = 'Select inner part of a function region' },
            ['ac'] = { query = '@class.outer', desc = 'Select class region' },
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' }
          },
          selection_modes = {
            ['@function.outer'] = 'V',
            ['@function.inner'] = 'V',
            ['@class.outer'] = 'V',
            ['@class.inner'] = 'V'
          }
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = { query = '@parameter.inner', desc = 'Swap with the next parameter' }
          },
          swap_previous = {
            ['<leader>A'] = { query = '@parameter.inner', desc = 'Swap with the previous parameter' }
          }
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = { query = '@function.outer', desc = 'Next function start' },
            [']]'] = { query = '@class.outer', desc = 'Next class start' }
          },
          goto_next_end = {
            [']M'] = { query = '@function.outer', desc = 'Next function end' },
            [']['] = { query = '@class.outer', desc = 'Next class end' }
          },
          goto_previous_start = {
            ['[m'] = { query = '@function.outer', desc = 'Previous function start' },
            ['[['] = { query = '@class.outer', desc = 'Previous class start' }
          },
          goto_previous_end = {
            ['[M'] = { query = '@function.outer', desc = 'Previous function end' },
            ['[]'] = { query = '@class.outer', desc = 'Previous class end' }
          }
        }
      }
    })

    local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

    -- Repeat movement with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
    vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

    -- Make builtin f, F, t, T also repeatable with ; and ,
    vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
  end
}
