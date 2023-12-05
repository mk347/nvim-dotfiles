return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {

    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

    "L3MON4D3/LuaSnip", -- Snippets plugin
    "saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp

    "rafamadriz/friendly-snippets", -- useful snippets
    "dsznajder/vscode-es7-javascript-react-snippets",
  },

  config = function()
    -- luasnip setup
    local luasnip = require("luasnip")
    -- loads all snippets, important
    luasnip.config.setup({
      require("luasnippets.snippets"),
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/lua/luasnippets/snippets.lua" }),
      -- Load snippets from vscode on startup
      require("luasnip.loaders.from_vscode").load({
        include = { "javascript", "javascriptreact", "html", "css", "scss" },
      }),
    })

    -- nvim-cmp setup
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        -- Jump forward

        vim.keymap.set({ "i", "s" }, "<leader>g", function()
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<leader>g", true, false, true), "n", false)
          end
        end, { silent = true }),

        -- Jump backward
        vim.keymap.set({ "i", "s" }, "<leader>f", function()
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<leader>f", true, false, true), "n", false)
          end
        end, { silent = true }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
      }),
      sorting = {
        comparators = {
          cmp.config.compare.recently_used,
        },
      },
    })
  end,
}
