return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",

    cond = function()
        return not vim.g.vscode
    end,

    event = { "BufRead", "BufNewFile" },

    ---@module "ibl"
    ---@type ibl.config
    opts = {},
}
