local function read_workspaces()
  local vault_list_path = vim.fs.normalize "~/.obsidian-vaults"
  local vault_list_file = io.open(vault_list_path, "r")
  if vault_list_file == nil then return nil end
  local workspaces = {}
  for line in vault_list_file:lines() do
    local name, path = line:match "([^,]+),(.+)"
    table.insert(workspaces, { name = name, path = path })
  end
  io.close(vault_list_file)
  return workspaces
end

return {
  "epwalsh/obsidian.nvim",
  event = nil,
  cmd = "Obsidian",
  config = function()
    local opts = {
      dir = nil,
      note_frontmatter_func = function(note)
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,
    }
    local success, result = pcall(read_workspaces)
    if success and result ~= nil then
      opts["workspaces"] = result
    else
      opts["workspaces"] = {
        {
          name = "Home",
          path = "~",
        },
      }
    end
    require("obsidian").setup(opts)
  end,
}
