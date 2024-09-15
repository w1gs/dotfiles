return {
  {
    'akinsho/toggleterm.nvim',
    event = "VimEnter",
    version = "*",
    opts = {
      open_mapping = [[<space>i]],
      start_in_insert = true,
      insert_mappings = false,
      direction = "float"
    },
  }
}
