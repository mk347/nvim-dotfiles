return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp", -- Autocompletion plugin
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
  },
  config = function()
    -- Add additional capabilities supported by nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
    local servers = {
      "tsserver",
      "html",
      "cssls",
      -- "tailwindcss",
      "lua_ls",
      "graphql",
      "emmet_ls",
      "pyright",
    }
    -- Loop to add all servers
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
      })
    end

    -- configure html server to override defaults
    lspconfig["html"].setup({
      capabilities = capabilities,
      -- on_attach = on_attach,
      settings = {
        css = {
          lint = {
            validProperties = {},
          },
        },
      },
    })
  end,
}
