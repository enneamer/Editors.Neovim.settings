return {
  {
    "RRethy/vim-illuminate",
    enabled = false,
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
  },
}
