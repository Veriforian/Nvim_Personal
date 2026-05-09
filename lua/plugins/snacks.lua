return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    explorer = {
      follow = false,
      hidden = true,
      ignored = true,
      exclude = { ".git", "coverage" },
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
    image = {
      enabled = true,
      inline = false,
      float = true,
    },
  },
}
