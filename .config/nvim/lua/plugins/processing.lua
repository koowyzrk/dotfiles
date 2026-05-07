return {
  "sophieforrest/processing.nvim",
  lazy = false,
  config = function()
    vim.g.processing_nvim = {
      Default = {
        highlight = {
          enable = true,
        },
        lsp = {
          cmd = { "processing", "lsp" },
        },
      },
    }
  end,
}
