return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    opts = {
        options = {
            theme = "catppuccin",

            globalstatus = true,

            section_separators = "",
            component_separators = "│",
        },

        sections = {
            lualine_x = { "copilot", "encoding", "fileformat", "filetype" },
        },
    },

    config = true,
}
