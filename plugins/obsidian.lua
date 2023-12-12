return {
  "epwalsh/obsidian.nvim",
  ft = "markdown",
  event = nil,
  opts = {
    dir = nil,
    workspaces = {
      {
        name = "Home",
        path = "~",
      },
    },
    note_frontmatter_func = function(note)
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
  },
}
