return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    {
      'williamboman/mason-lspconfig.nvim',
      dependencies = {
        {
          'williamboman/mason.nvim',
          opts = {}
        },
        'neovim/nvim-lspconfig'
      },
      opts = {
        ensure_installed = {
          'ansiblels',
          'docker_compose_language_service',
          'dockerls',
          'gopls',
          'jsonls',
          'lua_ls',
          'pyright'
        }
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
      --snippet = {},
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

    -- Set up lspconfig
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup_handlers({
      function(server_name)
        require('lspconfig')[server_name].setup({
          capabilities = capabilities
        })
      end
    })
  end
}
