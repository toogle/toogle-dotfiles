local keymap = vim.keymap

-- Allow semicolon to act as colon
keymap.set({ 'n', 'v' }, ';', ':', { noremap = true })

-- Easy window navigation
keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Jump to the next row even with line wrapping enabled
keymap.set('', 'j', 'gj', { noremap = true })
keymap.set('', 'k', 'gk', { noremap = true })
keymap.set('', 'о', 'gj', { noremap = true })
keymap.set('', 'л', 'gk', { noremap = true })

-- Keep selected text when fixing indentation
keymap.set('x', '<', '<gv', { noremap = true })
keymap.set('x', '>', '>gv', { noremap = true })

-- Allow saving of files as root when I forgot to start nvim using sudo
keymap.set('c', 'w!!', 'w !sudo tee > /dev/null %', { noremap = true })

-- Toggle line numbers mode
keymap.set('n', '<leader>nu', ':exec &nu==&rnu ? "set nu!" : "set rnu!"<CR>', { noremap = true })
