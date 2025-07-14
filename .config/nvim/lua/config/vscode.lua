local enabled_plugins = {
    "flash.nvim",
    "nvim-toggler",
    "nvim-treesitter-textobjects",
}

local config = require("lazy.core.config")
config.options.checker.enabled = false
config.options.change_detection.enabled = false
config.options.defaults.cond = function(plugin)
    return vim.tbl_contains(enabled_plugins, plugin.name)
end
