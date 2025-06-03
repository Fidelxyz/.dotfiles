return {
    "folke/which-key.nvim",
    cond = require("utils").is_not_vscode,

    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
