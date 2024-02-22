return {
  { "AstroNvim/astrocommunity", version = "v5.0.0" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.helm" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.yaml" },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"
      local methods = require "null-ls.methods"
      opts.handlers["ansiblelint"] = function(_0, _1)
        local config = {}
        for k, v in ipairs(null_ls.builtins.diagnostics.ansiblelint) do
          config[k] = v
        end
        config["method"] = { methods.internal.DIAGNOSTICS_ON_OPEN, methods.internal.DIAGNOSTICS_ON_SAVE }
        setmetatable(config, getmetatable(null_ls.builtins.diagnostics.ansiblelint))
        null_ls.register(config)
      end
    end,
  },
}
