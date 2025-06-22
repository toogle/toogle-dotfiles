return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    {
      'mason-org/mason-lspconfig.nvim',
      dependencies = {
        {
          'mason-org/mason.nvim',
          opts = {}
        }, {
          'neovim/nvim-lspconfig',
          version = '*'
        }
      },
      opts = {
        ensure_installed = {
          'ansiblels',
          'docker_compose_language_service',
          'dockerls',
          'gopls',
          'harper_ls',
          'jsonls',
          'lua_ls',
          'markdown_oxide',
          'pyright'
        },
        automatic_enable = true
      },
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline'
  },
  config = function()
    local cmp = require('cmp')

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true })
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }
      }, {
        { name = 'buffer' }
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    -- Tell the server the capability of foldingRange for nvim-ufo
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }

    -- Set up capabilities for LSP servers
    vim.lsp.config('*', { capabilities = capabilities })
  end
}
