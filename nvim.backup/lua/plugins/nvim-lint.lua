return {
  {
    "mfussenegger/nvim-lint",

    opts = {
      linters = {
        -- This stops _all_ linting from running on markdown.
        ["markdownlint-cli2"] = {
          args = { "--config", "~/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
