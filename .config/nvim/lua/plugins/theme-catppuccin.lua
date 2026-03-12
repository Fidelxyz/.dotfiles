return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,

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

        ---@module 'catppuccin.colors'
        ---@param colors CtpColors<string>
        ---Style Guide: https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md
        custom_highlights = function(colors)
            return {
                -- Diffview
                -- https://github.com/sindrets/diffview.nvim/blob/main/lua/diffview/hl.lua
                DiffviewDiffDelete = { fg = colors.surface0 },
                DiffviewDiffDeleteDim = { fg = colors.surface0 },
            }
        end,
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin")
    end,
}
