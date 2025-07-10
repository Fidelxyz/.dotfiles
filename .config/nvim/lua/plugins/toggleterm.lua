return {
    "akinsho/toggleterm.nvim",
    cond = require("utils").is_not_vscode,

    keys = {
        { "<C-\\>", desc = "Toggle terminal" },
    },
    opts = {
        open_mapping = [[<c-\>]],
    },
}
