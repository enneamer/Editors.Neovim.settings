-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    -- opts = function(_, opts)
    --   -- add more things to the ensure_installed table protecting against community packs modifying it
    --   opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
    --     "lua_ls",
    --     -- add more arguments for adding more language servers
    --   })
    -- end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      local null_ls = require "null-ls"
      local methods = require "null-ls.methods"
      opts.handlers["ansiblelint"] = function(_0, _1)
        local config = vim.deepcopy(null_ls.builtins.diagnostics.ansiblelint)
        config["method"] = { methods.internal.DIAGNOSTICS_ON_OPEN, methods.internal.DIAGNOSTICS_ON_SAVE }
        null_ls.register(config)
      end
      -- opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      --   "prettier",
      --   "stylua",
      --   -- add more arguments for adding more null-ls sources
      -- })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    -- opts = function(_, opts)
    --   -- add more things to the ensure_installed table protecting against community packs modifying it
    --   opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
    --     "python",
    --     -- add more arguments for adding more debuggers
    --   })
    -- end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    -- opts = function(_, opts)
    --   -- add more things to the ensure_installed table protecting against community packs modifying it
    --   opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
    --     -- "lua",
    --     -- "vim",
    --     -- add more arguments for adding more treesitter parsers
    --   })
    -- end,
  },
}
