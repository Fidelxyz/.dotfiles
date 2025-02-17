return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cond = require("utils").is_not_vscode,

    keys = {
        { "<C-\\>" },
    },
    opts = {
        open_mapping = [[<c-\>]],
    },
}
