return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    cond = function()
        return not vim.g.vscode
    end,

    event = { "BufRead", "BufNewFile" },
}
