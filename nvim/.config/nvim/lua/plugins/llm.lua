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
      max_tokens = 40,
      -- stop = '\n',
      -- repetition_penalty = 1.2,
      -- repetition_context_size = 40,
    },
    fim = {
      enabled = true,
      prefix = '<｜fim▁begin｜>',
      middle = '<｜fim▁end｜>',
      suffix = '<｜fim▁hole｜>',
    },
    debounce_ms = 600,
    accept_keymap = '<C-J>',
    lsp = {
      bin_path = vim.fn.stdpath('data') .. '/mason/bin/llm-ls'
    },
    tokenizer = {
      repository = model_repo
    },
    context_window = 768
  }
}
