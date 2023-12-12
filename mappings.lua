return {
  n = {
    ["<leader>e"] = false,
    ["<leader>o"] = false,
    ["<leader>ee"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    ["<leader>eo"] = {
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.Neotree "focus"
        end
      end,
      desc = "Toggle Explorer Focus",
    },
    ["<leader>gg"] = {
      "<cmd>Neogit<cr>",
      desc = "Neogit",
    },
  },
}
