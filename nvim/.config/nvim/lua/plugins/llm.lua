local model_repo = 'mlx-community/DeepSeek-Coder-V2-Lite-Instruct-4bit-mlx'

return {
  'huggingface/llm.nvim',
  opts = {
    backend = 'openai',
    url = 'http://localhost:8080',
    model = model_repo,
    request_body = {
      temperature = 0.2,
      top_p = 0.95,
      max_tokens = 40
    },
    fim = {
      prefix = '<｜fim▁begin｜>',
      middle = '<｜fim▁end｜>',
      suffix = '<｜fim▁hole｜>',
    },
    lsp = {
      bin_path = vim.fn.stdpath('data') .. '/mason/bin/llm-ls'
    },
    tokenizer = {
      repository = model_repo
    },
    context_window = 1024
  }
}
