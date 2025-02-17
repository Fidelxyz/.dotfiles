return {
    "nvim-treesitter/nvim-treesitter-context",
    cond = require("utils").is_not_vscode,

    event = { "BufRead", "BufNewFile" },
}
