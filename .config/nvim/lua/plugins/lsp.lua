collectgarbage("setpause", 100)
collectgarbage("setstepmul", 500)

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        signs = false,
      },
      servers = {
        clangd = {
          keys = {
            { "<leader>ch", false },
          },
          cmd = {
            "clangd",
            "--background-index",
            "-j=4",
            "--limit-references=100",
            "--limit-results=100",
            "--header-insertion-decorators=false",
            "--clang-tidy=false",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
        },
      },
    },
  },
}
