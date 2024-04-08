return {
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },
    config = function()
      require("neogit").setup {}
      vim.cmd "highlight NeogitDiffDeleteHighlight guifg=#B71C1C guibg=#F44336"
      vim.cmd "highlight NeogitDiffDelete guifg=#B71C1C guibg=#F44336"
    end,
  },
  {
    "wintermute-cell/gitignore.nvim",
    ft = "gitignore",
  },
}
