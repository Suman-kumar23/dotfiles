-- Pull in the wezterm API
local wezterm = require("wezterm")
local module = {}

local function private_helper()
	wezterm.log_error("Hello !")
end

function module.apply_to_config(config)
	private_helper()

	config.colors = {
		foreground = "#CBE0F0",
		background = "#011423",
		cursor_bg = "#47FF9C",
		cursor_border = "#47FF9C",
		cursor_fg = "#011423",
		selection_bg = "#033259",
		selection_fg = "#CBE0F0",
		ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
		brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
	}
	config.color_scheme = "Dracula"

	config.font = wezterm.font("JetBrainsMono Nerd Font")
	config.font_size = 19

	config.enable_tab_bar = false

	config.window_decorations = "RESIZE"
	config.window_background_opacity = 0.9
	config.macos_window_background_blur = 10
	config.window_background_gradient = {
		orientation = "Vertical",

		colors = {
			"#223343",
			"#000000",
		},
		interpolation = "Linear",
		blend = "Rgb",
	}

	config.keys = {
		{
			key = "f",
			mods = "CMD",
			action = wezterm.action.ToggleFullScreen,
		},
	}
end

return module
