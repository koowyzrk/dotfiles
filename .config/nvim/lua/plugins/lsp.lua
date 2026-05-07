return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          keys = {
            { "<leader>ch", false }, -- Opcjonalnie wyłącz skrót do przełączania nagłówków, jeśli Ci przeszkadza
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy=false", -- TO WYŁĄCZA CLANG-TIDY
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
        },
      },
    },
  },
}
