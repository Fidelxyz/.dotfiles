return {
    "folke/trouble.nvim",
    cond = require("utils").is_not_vscode,

    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
    },
}
