local utils = require("utils")
local auto_indent = utils.is_not_vscode() and require("utils.auto-indent") or nil
local smart_tab = require("smart-tab")
local suggestion = utils.is_not_vscode() and require("copilot.suggestion") or nil

vim.keymap.set("n", "<C-i>", "<C-i>", { noremap = true })

vim.keymap.set("i", "<Tab>", function()
    if suggestion and suggestion.is_visible() then -- Copilot
        suggestion.accept()
    elseif not utils.is_blank_line() and smart_tab.smart_tab() then -- Smart tab
    elseif auto_indent and auto_indent.check_indent() then -- Auto indent
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
    end
end, { desc = "Super Tab" })

vim.keymap.set({ "n", "x" }, "s", "<Plug>(leap)")
vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
vim.keymap.set("o", "s", "<Plug>(leap-forward)")
vim.keymap.set("o", "S", "<Plug>(leap-backward)")
