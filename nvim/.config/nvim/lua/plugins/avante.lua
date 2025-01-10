return {
  'yetone/avante.nvim',
  version = false,
  build = 'make',
  event = 'VeryLazy',
  lazy = false,
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' }
      },
      ft = { 'markdown', 'Avante' }
    }
  },
  opts = {
    provider = 'openai',
    auto_suggestions_provider = 'openai',
    tokenizer = 'hf',
    openai = {
      endpoint = 'http://localhost:8080/v1',
      api_key_name = { 'echo', '-n' },  -- no API key needed
      model = 'mlx-community/Mistral-Nemo-Instruct-2407-8bit',
      timeout = 3000,  -- in milliseconds
      temperature = 0.2,
      top_p = 0.95,
      max_tokens = 4096
    },
    hints = {
      enabled = false
    }
  }
}
