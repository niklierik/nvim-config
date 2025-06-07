return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local transparent = false

    local theme = require('github-theme')
    local toggle_transparency = function()
        transparent = not transparent
        setup = {
            options = {
                transparent = transparent,
            }
        }
        theme.setup(setup)
        vim.cmd('colorscheme github_dark_default')
    end
    toggle_transparency()
    vim.keymap.set("n", "<leader>bg", toggle_transparency, { desc = true, noremap = true, desc = "Toggle background transparency" })

    

  end,
}
