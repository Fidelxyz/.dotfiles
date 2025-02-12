return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

    cond = function()
        return not vim.g.vscode
    end,

    opts = {
        flavour = "mocha",
        integrations = {
            indent_blankline = {
                enabled = true,
                scope_color = "subtext0",
                colored_indent_levels = false,
            },
            blink_cmp = true,
            copilot_vim = true,
            which_key = true,
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
