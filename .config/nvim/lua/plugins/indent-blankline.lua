return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",

    event = { "BufRead", "BufNewFile" },

    ---@module "ibl"
    ---@type ibl.config
    opts = {},
}
