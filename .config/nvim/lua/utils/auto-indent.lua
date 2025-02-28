local utils = require("utils")

local M = {}

---@class IndentInfo
---@field indentexpr string
---@field expandtab boolean
---@field tabstop number
local indent_info = {
    indentexpr = "",
    expandtab = false,
    tabstop = 4,
}

local indentexpr_func = function(lnum)
    return require("nvim-treesitter.indent").get_indent(lnum)
end

---@param bufnr number
local function fetch_indent_info(bufnr)
    local indentexpr = string.sub(vim.api.nvim_get_option_value("indentexpr", { buf = bufnr }) or "", 1, -3) -- Remove the trailing '()'
    local expandtab = vim.api.nvim_get_option_value("expandtab", { buf = bufnr })
    local tabstop = vim.api.nvim_get_option_value("tabstop", { buf = bufnr })

    indent_info = {
        indentexpr = indentexpr,
        expandtab = expandtab,
        tabstop = tabstop,
    }
end

---@param row number
---@return number
local function get_target_indent(row)
    if indentexpr_func then
        local success, result = pcall(indentexpr_func, row)
        return success and result or 0
    else
        local indentexpr = indent_info.indentexpr
        if indentexpr == "" then
            return 0
        end
        local success, result = pcall(vim.fn[indentexpr])
        return success and result or 0
    end
end

---@param char string
---@param count number
local function put_chars(char, count)
    vim.api.nvim_put({ string.rep(char, count) }, "c", false, true)
end

---@return boolean
M.check_indent = function()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    local current_indent = vim.fn.indent(row)
    local target_indent = get_target_indent(row)

    -- print(row, current_indent, target_indent)

    if current_indent >= target_indent then
        return false
    end

    if indent_info.expandtab then
        -- Space
        put_chars(" ", target_indent - current_indent)
    else
        -- Tab
        local tabstop = indent_info.tabstop
        put_chars("\t", math.ceil((target_indent - current_indent) / tabstop))
    end
    return true
end

if utils.is_not_vscode() then
    vim.api.nvim_create_autocmd("BufRead", {
        callback = function(args)
            fetch_indent_info(args.buf)
        end,
    })

    vim.api.nvim_create_autocmd("OptionSet", {
        pattern = { "indentexpr", "expandtab", "tabstop" },
        callback = function()
            fetch_indent_info(vim.api.nvim_get_current_buf())
        end,
    })
end

return M
