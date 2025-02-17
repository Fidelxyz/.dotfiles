local wezterm = require("wezterm")

local M = {}

wezterm.on("window-resized", function(window, _)
	local dim = window:get_dimensions()
	local width = dim.pixel_width
	local height = dim.pixel_height

	local overrides = window:get_config_overrides() or {}

	-- Example logic: Set font size based on window width
	if width > 3840 and height > 2160 then
		overrides.font_size = 20.0
		overrides.line_height = 1.15
	else
		overrides.font_size = nil
		overrides.line_height = nil
	end

	-- Apply the new font size
	window:set_config_overrides(overrides)
end)

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

return M
