return {
    "zbirenbaum/copilot.lua",
    dependencies = {
        "AndreM222/copilot-lualine",
    },

    cond = function()
        return not vim.g.vscode
    end,

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
    keys = {
        {
            "<Tab>",
            function()
                local suggestion = require("copilot.suggestion")
                if suggestion.is_visible() then
                    suggestion.accept()
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
                end
            end,
            mode = "i",
            desc = "Super Tab",
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
