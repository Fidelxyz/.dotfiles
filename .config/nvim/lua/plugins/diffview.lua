return {
    "dlyongemallo/diffview.nvim",
    version = "*",

    cmd = {
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
        "DiffviewRefresh",
        "DiffviewFileHistory",
    },

    opts = {
        enhanced_diff_hl = true,
    },

    config = function(_, opts)
        require("diffview").setup(opts)
        vim.opt.fillchars = vim.opt.fillchars + "diff:╱"
    end,
}
