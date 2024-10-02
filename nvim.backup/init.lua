-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "dist",
      "pnpm-lock",
      "yarn.lock",
      "package-lock",
    },
  },
})
