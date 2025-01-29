return {
    "akinsho/toggleterm.nvim",
    version = "*",

    cond = function()
        return not vim.g.vscode
    end,

    keys = {
        { "<C-\\>" },
    },
    opts = {
        open_mapping = [[<c-\>]],
    },
}
