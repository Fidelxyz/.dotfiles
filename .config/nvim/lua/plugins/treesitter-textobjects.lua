return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufRead", "BufNewFile" },

    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,

                    keymaps = {
                        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter" },
                        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter" },

                        ["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
                        ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["ma"] = { query = "@parameter.inner", desc = "Swap a parameter with next" },
                        ["mf"] = { query = "@function.outer", desc = "Swap a function with next" },
                    },
                    swap_previous = {
                        ["mA"] = { query = "@parameter.inner", desc = "Swap a parameter with previous" },
                        ["mF"] = { query = "@function.outer", desc = "Swap a function with previous" },
                    },
                },
            },
        })
    end,
}
