return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    cond = require("utils").is_not_vscode,

    event = { "BufRead", "BufNewFile" },

    ---@module "ibl"
    ---@type ibl.config
    opts = {},
}
