return {
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"

      opts.handlers["prettierd"] = function(_0, _1)
        local config = vim.deepcopy(null_ls.builtins.formatting.prettierd)
        config["disabled_filetypes"] = { "markdown" }
        null_ls.register(config)
      end

      opts.handlers["prettier"] = function(_0, _1)
        local config = vim.deepcopy(null_ls.builtins.formatting.prettier)
        config["disabled_filetypes"] = { "markdown" }
        null_ls.register(config)
      end
    end,
  },
}
