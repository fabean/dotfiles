return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        -- Show hidden files and directories
        file_ignore_patterns = {},
        hidden = true,
        no_ignore = false,
        no_ignore_parents = false,
      },
      pickers = {
        find_files = {
          -- Show hidden files and directories
          hidden = true,
          -- Don't ignore files in .gitignore
          no_ignore = true,
          -- Don't ignore files in parent .gitignore files
          no_ignore_parents = true,
        },
        live_grep = {
          -- Show hidden files and directories in live grep
          additional_args = { "--hidden" },
        },
        grep_string = {
          -- Show hidden files and directories in grep string
          additional_args = { "--hidden" },
        },
      },
    },
  },
}
