return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      hidden = true,
      ignored = true,
      exclude = { ".git", "node_modules", "coverage" },
    },
    picker = {
      hidden = true,
      ignored = true,
      exclude = { ".git", "node_modules", "coverage" },
    },
    terminal = {
      winbar = {
        enabled = false,
      },
    },
  },
}
