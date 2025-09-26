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
                log_level = "off",                -- Disable logging
                disable_inline_completion = true, -- Disable inline completion to prevent interference
                disable_keymaps = false            -- Keep keymaps for manual control
            })
            
            -- Custom highlighting for supermaven suggestions
            vim.api.nvim_set_hl(0, "SupermavenSuggestion", { fg = "#6CC644", italic = true })
        end,
    },
}
