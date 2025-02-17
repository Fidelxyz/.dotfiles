return {
    "nguyenvukhang/nvim-toggler",
    cond = require("utils").is_not_vscode,

    keys = {
        {
            "<leader>i",
            function()
                require("nvim-toggler").toggle()
            end,
            desc = "Toggle",
        },
    },
    opts = {},
}
