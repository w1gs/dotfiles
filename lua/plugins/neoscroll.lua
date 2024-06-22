return {
  {
    "karb94/neoscroll.nvim",
    event = "VimEnter",
    config = function()
      require('neoscroll').setup({ mappings = { '<C-u>', '<C-d>', '<C-b>' } })
    end,
  },
}
