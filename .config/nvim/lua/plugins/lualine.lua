return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cond = require("utils").is_not_vscode,

    opts = {
        options = {
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
