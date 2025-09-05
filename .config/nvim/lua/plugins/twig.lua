return {
  -- Add Twig syntax highlighting using nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Add twig to the list of parsers to ensure are installed
      vim.list_extend(opts.ensure_installed, {
        "twig",
      })
    end,
  },
}
