local diagnostic = vim.diagnostic

diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  signs = {
    text = {
      [diagnostic.severity.ERROR] = '',
      [diagnostic.severity.WARN] = '',
      [diagnostic.severity.INFO] = '',
      [diagnostic.severity.HINT] = ''
    }
  },
  float = {
    source = 'if_many'
  },
  severity_sort = true
})
