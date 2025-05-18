return {
  'nvim-treesitter/nvim-treesitter',
  version = '*',
  build = function()
    require('nvim-treesitter.install').update({
      with_sync = true
    })()
  end,
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash',
        'c',
        'css',
        'd',
        'dockerfile',
        'go',
        'html',
        'ini',
        'javascript',
        'json',
        'latex',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'toml',
        'vim',
        'vimdoc',
        'yaml'
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
      indent = {
        enable = true
      },
      incremental_selection = {
        enable = true
      }
    })
  end
}
