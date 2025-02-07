return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",

    cond = function()
        return not vim.g.vscode
    end,

    event = { "BufReadPre", "BufNewFile" },

    ---@module "ibl"
    ---@type ibl.config
    opts = {},
}
