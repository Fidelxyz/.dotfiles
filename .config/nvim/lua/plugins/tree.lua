return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cond = require("utils").is_not_vscode,

    keys = {
        { "<leader>e", function() require("nvim-tree.api").tree.toggle() end, desc = "Toggle Nvim Tree" },
    },

    opts = {},

    config = function(_, opts)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup(opts)
    end,
}
