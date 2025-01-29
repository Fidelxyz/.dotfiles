return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    cond = function()
        return not vim.g.vscode
    end,

    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({})

        local function open_nvim_tree()
            require("nvim-tree.api").tree.open()
        end

        vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end,
}
