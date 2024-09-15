return {

  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()

      vim.cmd.colorscheme("bluloco-dark")

      -- Hide all semantic highlights until upstream issues are resolved (https://github.com/catppuccin/nvim/issues/480)
    
    end,
  },
}
