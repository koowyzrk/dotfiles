return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", "/home/kwzrk/.markdownlint-cli2.yaml", "--" },
      },
    },
  },
}
