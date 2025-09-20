return {
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<C-l>",
                    clear_suggestion = "<C-h>",
                    accept_word = "<C-w>",
                },
                log_level = "info",                -- Set to "off" to disable logging
                disable_inline_completion = false, -- Enable inline completion instead of nvim-cmp integration
                disable_keymaps = false            -- Set to true for manual keymap control
            })
            
            -- Custom highlighting for supermaven suggestions
            vim.api.nvim_set_hl(0, "SupermavenSuggestion", { fg = "#6CC644", italic = true })
        end,
    },
}
