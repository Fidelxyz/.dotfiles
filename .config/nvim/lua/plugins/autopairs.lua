return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    cond = require("utils").is_not_vscode,
    opts = {},
}
