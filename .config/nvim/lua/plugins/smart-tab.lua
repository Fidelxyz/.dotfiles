return {
    "boltlessengineer/smart-tab.nvim",
    cond = require("utils").is_not_vscode,

    event = "InsertCharPre",

    opts = {
        mapping = false,
    },
}
