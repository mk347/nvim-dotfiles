return {
  "lukas-reineke/indent-blankline.nvim",
  name = "indent_blankline",
  event = { "BufReadPost", "BufNewfile" },
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = false },
  }
}
