return {
    "zbirenbaum/copilot.lua",
    dependencies = {
        "AndreM222/copilot-lualine",
    },

    cmd = "Copilot",
    event = "InsertEnter",

    opts = {
        panel = { enabled = false },
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = false,
                accept_word = "<C-l>",
                accept_line = "<C-j>",
            },
        },
    },
    config = function(_, opts)
        require("copilot").setup(opts)

        -- Compatibility with Blink
        vim.api.nvim_create_autocmd("User", {
            pattern = "BlinkCmpMenuOpen",
            callback = function()
                local suggestion = require("copilot.suggestion")
                if suggestion.is_visible() then
                    suggestion.dismiss()
                end
                vim.b.copilot_suggestion_hidden = true
            end,
        })
        vim.api.nvim_create_autocmd("User", {
            pattern = "BlinkCmpMenuClose",
            callback = function()
                vim.b.copilot_suggestion_hidden = false
            end,
        })
    end,
}
