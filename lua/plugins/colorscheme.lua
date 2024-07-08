local spec = {
  {
    "folke/tokyonight.nvim",
    name = "colors_tokyonight",
    lazy = true,
    config = function() vim.print("setup tokyo") end,
    transparet = true,
  },
  {
    "catppuccin/nvim",
    name = "colors_catppuccin",
    lazy = true,
    config = function() vim.print("setup catppuccin") end,
    transparet = true,
  },
}
local M = {}
local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"

M.AplyTheme = function(prompt_bufnr)
    local theme = action_state.get_selected_entry()
    actions.close(prompt_bufnr)
    -- vim.cmd( string.format(":colorscheme %s", theme) )
    vim.cmd.colorscheme(theme.value)
end

vim.keymap.set("n", "<leader>uu", function() --> Show all custom colors in telescope...

  for _, color in ipairs(spec) do  --> Load all colors in spec....
    vim.cmd("Lazy load " .. color.name) --> vim colorschemes cannot be required...
  end

  vim.schedule(function() --> Needs to be scheduled:
    -- stylua: ignore
    local builtins = { "zellner", "torte", "slate", "shine", "ron", "quiet", "peachpuff",
    "pablo", "murphy", "lunaperche", "koehler", "industry", "evening", "elflord",
    "desert", "delek", "default", "darkblue", "blue" }

    local completion = vim.fn.getcompletion
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.fn.getcompletion = function() --> override
      return vim.tbl_filter(function(color)
        return not vim.tbl_contains(builtins, color) --
      end, completion("", "color"))
    end

    require'telescope.builtin'.colorscheme{
        prompt_title = "< Dotfiles >",
        enable_preview=true,
        attach_mappings = function(_, map)
          map("i", "<C-y>", M.AplyTheme)
          return true
        end,
    }
    vim.fn.getcompletion = completion --> restore
  end)

end, { desc = "Telescope custom colors", silent = true })

return spec
