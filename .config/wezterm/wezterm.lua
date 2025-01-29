local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.window_background_opacity = 0.75
config.text_background_opacity = 0.75
config.macos_window_background_blur = 30
config.window_padding = {
	left = 30,
	right = 30,
	top = 30,
	bottom = 30,
}

config.color_scheme = "iTerm2 Smoooooth"

config.font = wezterm.font("CaskaydiaMono Nerd Font Mono")
config.font_size = 16.0

return config
