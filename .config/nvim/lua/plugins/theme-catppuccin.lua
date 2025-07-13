return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    cond = require("utils").is_not_vscode,

    opts = {
        flavour = "mocha",
        integrations = {
            aerial = true,
            blink_cmp = true,
            copilot_vim = true,
            dropbar = {
                enabled = true,
                color_mode = true,
            },
            flash = true,
            harpoon = true,
            indent_blankline = {
                enabled = true,
                scope_color = "subtext0",
                colored_indent_levels = false,
            },
            mason = true,
            noice = true,
            which_key = true,
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
