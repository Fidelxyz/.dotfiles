return {
    "zbirenbaum/copilot.lua",
    dependencies = {
        "AndreM222/copilot-lualine",
    },

    cond = function()
        return not vim.g.vscode
    end,

    cmd = "Copilot",
    event = "InsertEnter",

    opts = {
        panel = { enabled = false },
    },
}
