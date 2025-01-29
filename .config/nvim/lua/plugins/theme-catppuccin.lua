return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    cond = function()
        return not vim.g.vscode
    end,

    opts = {
        flavour = "mocha",
    },
    config = function()
        vim.cmd([[colorscheme catppuccin]])
    end,
}
