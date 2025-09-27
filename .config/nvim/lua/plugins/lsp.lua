return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Python
      lspconfig.pyright.setup({})

      -- PHP
      lspconfig.intelephense.setup({
        settings = {
          intelephense = {
            format = {
              indentSize = 2,
              tabSize = 2,
              useTabs = false,
            },
          },
        },
      })

      -- Nix
      lspconfig.nil_ls.setup({})

      -- Markdown
      lspconfig.marksman.setup({})

      -- Rust
      lspconfig.rust_analyzer.setup({})

      -- YAML
      lspconfig.yamlls.setup({})

      -- Bash
      lspconfig.bashls.setup({})

      -- CSS and SCSS
      lspconfig.cssls.setup({})

      -- JavaScript/TypeScript
      lspconfig.tsserver.setup({})

      -- Lua
      lspconfig.lua_ls.setup({})
    end,
  },
}
