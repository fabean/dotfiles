return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        -- Show hidden files and directories
        filtered_items = {
          visible = true, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false, -- hide files starting with a dot
          hide_gitignored = false, -- hide files that are in .gitignore
          hide_hidden = false, -- only works on Windows for hidden files/directories
          hide_by_name = {
            -- "node_modules"
          },
          hide_by_pattern = { -- uses glob style patterns
            -- "*.meta",
            -- "*/src/*/tsconfig.json",
          },
          always_show = { -- remains visible even if other settings would normally hide it
            -- ".gitignored",
          },
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            -- ".DS_Store",
            -- "thumbs.db"
          },
          never_show_by_pattern = { -- uses glob style patterns
            -- ".null-ls_*",
          },
        },
        -- Follow current file
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto-opened directories, `true` leaves them open.
        },
        -- Use libuv file watcher to detect changes instead of polling
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "✖", -- this can only be used in the git_status source
            renamed = "󰁕", -- this can only be used in the git_status source
            untracked = "󰄱",
            ignored = "󰛗",
            unstaged = "󰄱",
            staged = "󰱒",
            conflict = "󰉛",
            unknown = "󰟰",
          },
        },
      },
    },
  },
}
