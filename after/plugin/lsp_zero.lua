local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'eslint', 'tsserver', 'rust_analyzer'},
  handlers = {
    function(server_name) -- default handler (optional)

      require("lspconfig")[server_name].setup {
        capabilities = capabilities
      }
     end,
     ["lua_ls"] = function()
       local lspconfig = require("lspconfig")
       lspconfig.lua_ls.setup {
         capabilities = capabilities,
         settings = {
           Lua = {
             diagnostics = {
               globals = { "vim", "it", "describe", "before_each", "after_each" },
             }
           }
         }
       }
     end,
     ["eslint"] = function()
       local lspconfig = require("lspconfig")
       lspconfig.eslint.setup{
         on_attach = function(client, bufnr)
           vim.api.nvim_create_autocmd("BufWritePre", {
             buffer = bufnr,
             command = "EslintFixAll",
           })
         end,
       }
     end,
   }
 })

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})
