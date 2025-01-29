return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",

    cond = function()
        return not vim.g.vscode
    end,

    config = true,
}
