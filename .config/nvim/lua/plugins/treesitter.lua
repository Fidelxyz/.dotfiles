return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cond = require("utils").is_not_vscode,

    event = { "BufRead", "BufNewFile" },
}
