return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          {
            "<leader>ad",
            "<cmd>FzfLua lsp_definitions     jump1=true ignore_current_line=true<cr>",
            desc = "Goto Definition",
            has = "definition",
          },
          {
            "<leader>ar",
            "<cmd>FzfLua lsp_references      jump1=true ignore_current_line=true<cr>",
            desc = "References",
            nowait = true,
          },
          {
            "<leader>aI",
            "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>",
            desc = "Goto Implementation",
          },
          {
            "<leader>ay",
            "<cmd>FzfLua lsp_typedefs        jump1=true ignore_current_line=true<cr>",
            desc = "Goto T[y]pe Definition",
          },
        },
      },
    },
  },
}
