local wezterm = require("wezterm")

local M = {}

function M.setup(config)
	config.leader = {
		key = "a",
		mods = "CMD",
		timeout_milliseconds = math.maxinteger,
	}
	config.keys = {
		-- Open Configuration
		{
			key = ",",
			mods = "SUPER",
			action = wezterm.action.SpawnCommandInNewTab({
				cwd = wezterm.config_dir,
				args = { "nvim", wezterm.config_file },
			}),
		},
		-- Splitting Panes
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
	}
end

return M
