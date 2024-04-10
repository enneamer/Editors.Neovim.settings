-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      local astro = require "astrocore"
      local astrohl = require "astroui.status.hl"

      opts.tabline = {
        { -- file tree padding
          condition = function(self)
            self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
            self.winwidth = vim.api.nvim_win_get_width(self.winid)
            return self.winwidth ~= vim.o.columns -- only apply to sidebars
              and not require("astrocore.buffer").is_valid(vim.api.nvim_win_get_buf(self.winid)) -- if buffer is not in tabline
          end,
          provider = function(self) return (" "):rep(self.winwidth + 1) end,
          hl = { bg = "tabline_bg" },
        },
        status.heirline.make_buflist(status.component.file_info(astro.extend_tbl({
          file_icon = {
            condition = function(self) return not self._show_picker end,
            hl = astrohl.file_icon "tabline",
          },
          filename = {},
          filetype = false,
          unique_path = {
            hl = function(self) return astrohl.get_attributes(self.tab_type .. "_path") end,
          },
          padding = { left = 1, right = 1 },
          hl = function(self)
            local tab_type = self.tab_type
            if self._show_picker and self.tab_type ~= "buffer_active" then tab_type = "buffer_visible" end
            return astrohl.get_attributes(tab_type)
          end,
          surround = false,
        }, opts))), -- component for each buffer tab
        status.component.fill { hl = { bg = "tabline_bg" } }, -- fill the rest of the tabline with background color
        {
          condition = function() return #vim.api.nvim_list_tabpages() >= 2 end,
          status.heirline.make_tablist {
            provider = status.provider.tabnr(),
            hl = function(self) return status.hl.get_attributes(status.heirline.tab_type(self, "tab"), true) end,
          },
        },
      }
    end,
  },
  {
    "marko-cerovac/material.nvim",
    opts = {
      plugins = {
        "dap",
        "nvim-web-devicons",
        "telescope",
        "trouble",
      },
      custom_highlights = {
        Constant = { fg = "#FF9800" },
        Todo = { fg = "#FF9800" },

        ["@symbol"] = { fg = "#FF9800" },
        ["@constant"] = { fg = "#FF9800" },
        ["@constant.builtin"] = { fg = "#FF9800" },
        ["@namespace"] = { fg = "#3F51B5" },
        ["@string.regex"] = { fg = "#E65100" },
      },
      custom_colors = function(colors)
        colors.main.white = "#FFFFFF"
        colors.main.gray = "#9E9E9E"
        colors.main.black = "#000000"
        colors.main.red = "#F44336"
        colors.main.pink = "#E91E63"
        colors.main.purple = "#9C27B0"
        colors.main.paleblue = "#3F51B5"
        colors.main.blue = "#2196F3"
        colors.main.cyan = "#00BCD4"
        colors.main.green = "#4CAF50"
        colors.main.yellow = "#CDDC39"
        colors.main.orange = "#FF9800"

        -- Test
        colors.main.darkred = "#B71C1C"
        colors.main.darkpurple = "#4A148C"
        colors.main.darkblue = "#0D47A1"
        colors.main.darkcyan = "#006064"
        colors.main.darkgreen = "#1B5E20"
        colors.main.darkyellow = "#827717"
        colors.main.darkorange = "#E65100"

        colors.editor.fg = "#616161"
        colors.editor.fg_dark = "#212121"
        -- colors.editor.selection = "#9E9E9E"
        colors.editor.selection = "#BBDEFB"
        colors.editor.line_numbers = "#616161"
        colors.editor.accent = "#212121"
        colors.editor.bg = "#F5F5F5"
        colors.editor.bg_alt = "#FFFFFF"
        colors.editor.contrast = "#E0E0E0"
        colors.editor.active = "#E0E0E0"
        colors.editor.border = "#9E9E9E"
        colors.editor.highlight = "#F5F5F5"
        colors.editor.disabled = "#616161"
        colors.editor.cursor = "#616161"
        colors.editor.link = colors.main.blue
        colors.editor.title = "#212121"
        colors.editor.white = colors.main.white
        colors.editor.gray = colors.main.gray
        colors.editor.title = colors.main.black

        -- colors.syntax.comments = colors.main.darkpurple
        colors.syntax.comments = "#9E9E9E"
        colors.syntax.keyword = colors.main.purple
        colors.syntax.operator = colors.editor.fg
        colors.syntax.type = colors.main.darkblue
        colors.syntax.variable = colors.editor.fg
        colors.syntax.field = colors.editor.fg
        colors.syntax.value = colors.main.darkorange
        colors.syntax.string = colors.main.darkgreen
        colors.syntax.fn = colors.main.blue

        colors.git.added = colors.main.green
        colors.git.removed = colors.main.red
        colors.git.modified = colors.main.blue

        colors.lsp.warning = colors.main.orange
        colors.lsp.info = colors.main.paleblue
        colors.lsp.hint = colors.main.purple
        colors.lsp.error = colors.main.red

        colors.backgrounds.sidebars = colors.editor.black
        colors.backgrounds.floating_windows = colors.editor.black
        colors.backgrounds.non_current_windows = colors.editor.bg
        colors.backgrounds.cursor_line = colors.editor.active
      end,
    },
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        colorscheme = "material",
      },
    },
  },
}
