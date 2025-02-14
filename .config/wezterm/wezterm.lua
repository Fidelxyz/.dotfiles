local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

-- Window
config.initial_rows = 30
config.initial_cols = 100
config.window_background_opacity = 0.75
config.text_background_opacity = 0.75
config.macos_window_background_blur = 30
config.window_padding = {
	left = 30,
	right = 30,
	top = 30,
	bottom = 30,
}
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE | MACOS_FORCE_ENABLE_SHADOW"
config.window_frame = {
	font = wezterm.font({ family = "JetBrains Mono NL", weight = "Bold" }),
	font_size = 14,
}

-- Status Bar
wezterm.on("update-status", function(window, _)
	local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
	local color_scheme = window:effective_config().resolved_palette
	local background_color = wezterm.color.parse(color_scheme.background)
	local foreground_color = wezterm.color.parse(color_scheme.foreground)

	local segments = {
		wezterm.strftime("%F %a %r"),
	}
	local gradient = wezterm.color.gradient({
		orientation = "Horizontal",
		colors = { background_color, background_color:lighten(0.2) },
	}, #segments)

	local elements = {}
	for i, seg in ipairs(segments) do
		if i == 1 then
			table.insert(elements, { Background = { Color = "none" } })
		end
		table.insert(elements, { Foreground = { Color = gradient[i] } })
		table.insert(elements, { Text = SOLID_LEFT_ARROW })

		table.insert(elements, { Foreground = { Color = foreground_color } })
		table.insert(elements, { Background = { Color = gradient[i] } })
		table.insert(elements, { Text = " " .. seg .. " " })
	end
	window:set_right_status(wezterm.format(elements))
end)

-- Color scheme
config.color_scheme = "iTerm2 Smoooooth"

-- Font
config.font = wezterm.font("CaskaydiaMono Nerd Font Mono")
config.font_size = 16.0

-- Keyboard
config.enable_kitty_keyboard = true
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- Key Bindings
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

return config
