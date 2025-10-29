local keymap = vim.keymap

-- Easy window navigation
keymap.set('n', '<C-h>', '<C-w>h')
keymap.set('n', '<C-j>', '<C-w>j')
keymap.set('n', '<C-k>', '<C-w>k')
keymap.set('n', '<C-l>', '<C-w>l')

-- Jump to the next row even with line wrapping enabled
keymap.set('', 'j', 'gj')
keymap.set('', 'k', 'gk')
keymap.set('', 'о', 'gj')
keymap.set('', 'л', 'gk')

-- Keep selected text when fixing indentation
keymap.set('x', '<', '<gv')
keymap.set('x', '>', '>gv')

-- Allow saving of files as root when I forgot to start nvim using sudo
keymap.set('c', 'w!!', 'w !sudo tee > /dev/null %')

-- Toggle line numbers mode
keymap.set('n', '<leader>nu', ':exec &nu==&rnu ? "set nu!" : "set rnu!"<CR>')
