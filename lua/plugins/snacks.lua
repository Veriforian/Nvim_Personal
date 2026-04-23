return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
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
