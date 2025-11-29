local wezterm = require("wezterm")

local M = {}

function M.setup(config)
    config.leader = {
        key = "b",
        mods = "CMD",
        ---@diagnostic disable-next-line: undefined-field
        timeout_milliseconds = math.maxinteger,
    }
    config.keys = {
        -- Open Configuration
        {
            key = ",",
            mods = "CMD",
            action = wezterm.action.SpawnCommandInNewTab({
                cwd = wezterm.config_dir,
                args = { "nvim", wezterm.config_file },
            }),
        },

        -- Panes
        {
            key = '"',
            mods = "LEADER",
            action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
        },
        {
            key = "%",
            mods = "LEADER",
            action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
        },
        {
            key = "UpArrow",
            mods = "LEADER",
            action = wezterm.action.ActivatePaneDirection("Up"),
        },
        {
            key = "DownArrow",
            mods = "LEADER",
            action = wezterm.action.ActivatePaneDirection("Down"),
        },
        {
            key = "LeftArrow",
            mods = "LEADER",
            action = wezterm.action.ActivatePaneDirection("Left"),
        },
        {
            key = "RightArrow",
            mods = "LEADER",
            action = wezterm.action.ActivatePaneDirection("Right"),
        },

        -- Tabs
        {
            key = "c",
            mods = "LEADER",
            action = wezterm.action.SpawnTab("CurrentPaneDomain"),
        },
        {
            key = "p",
            mods = "LEADER",
            action = wezterm.action.ActivateTabRelative(-1),
        },
        {
            key = "n",
            mods = "LEADER",
            action = wezterm.action.ActivateTabRelative(1),
        },
    }
    for i = 1, 9 do
        table.insert(config.keys, {
            key = tostring(i),
            mods = "LEADER",
            action = wezterm.action.ActivateTab(i - 1),
        })
    end
end

return M
