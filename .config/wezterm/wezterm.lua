local wezterm = require("wezterm")

local function private_helper()
	wezterm.log_error("Hello !")
end

return {
	colors = {
		foreground = "#CBE0F0",
		background = "#011423",
		cursor_bg = "#47FF9C",
		cursor_border = "#47FF9C",
		cursor_fg = "#011423",
		selection_bg = "#033259",
		selection_fg = "#CBE0F0",
		ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
		brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
	},
	scrollback_lines = 3500,

	color_scheme = "Dracula",
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 19,

	enable_tab_bar = false,

	window_decorations = "RESIZE",
	window_background_opacity = 0.9,
	macos_window_background_blur = 10,

	window_background_gradient = {
		orientation = "Vertical",
		colors = {
			"#223343",
			"#000000",
		},
		interpolation = "Linear",
		blend = "Rgb",
	},
	keys = {
		{ key = "f", mods = "CMD", action = wezterm.action.ToggleFullScreen },
		{
			key = "|",
			mods = "CTRL|ALT|SHIFT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
	},
}
