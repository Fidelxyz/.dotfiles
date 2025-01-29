return {
    "folke/which-key.nvim",
    event = "VeryLazy",

    cond = function()
        return not vim.g.vscode
    end,

    opts = {},
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
