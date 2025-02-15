local wezterm = require("wezterm")

local M = {}

wezterm.on("window-resized", function(window, pane)
	local dim = window:get_dimensions()
	local width = dim.pixel_width
	local height = dim.pixel_height

	local overrides = window:get_config_overrides() or {}

	-- Example logic: Set font size based on window width
	if width > 3840 and height > 2160 then
		overrides.font_size = 18.0
		overrides.line_height = 1.2
	else
		overrides.font_size = nil
		overrides.line_height = nil
	end

	-- Apply the new font size
	window:set_config_overrides(overrides)
end)

return M
