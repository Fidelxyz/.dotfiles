local suggestion = require("copilot.suggestion")
local smart_tab = require("smart-tab")
local utils = require("utils")
local auto_indent = require("utils.auto-indent")

vim.keymap.set("n", "<C-i>", "<C-i>", { noremap = true })

vim.keymap.set("i", "<Tab>", function()
    if suggestion.is_visible() then -- Copilot
        suggestion.accept()
    elseif not utils.is_blank_line() and smart_tab.smart_tab() then -- Smart tab
    elseif auto_indent.check_indent() then -- Auto indent
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
    end
end, { desc = "Super Tab" })
