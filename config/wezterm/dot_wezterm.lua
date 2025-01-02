-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- config.color_scheme = "Later This Evening"
config.color_scheme = "Srcery (Gogh)"

config.cursor_thickness = "0.1cell"
config.cursor_blink_rate = 500
config.default_cursor_style = "SteadyBlock"
-- config.default_cursor_style = "BlinkingBar"

config.font_size = 12.0
config.font = wezterm.font_with_fallback({
	"Hack Nerd Font",
	-- "BlexMono Nerd Font",
	-- "Monaco",
	-- "Consolas",
	"D2Coding",
})

config.initial_cols = 120
config.initial_rows = 45

config.scrollback_lines = 10000

-- and finally, return the configuration to wezterm
return config
