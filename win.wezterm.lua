-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.wsl_domains = {
  {
    name = 'WSL:Ubuntu-24.04',
    distribution = 'Ubuntu-24.04',
  },
}

config.default_domain = 'WSL:Ubuntu-24.04'

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

--config.font = wezterm.font 'GoMono Nerd Font'

config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte
--config.color_scheme = 'One Dark (Gogh)'

local act = wezterm.action
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
			end
		end),
	},
}

-- and finally, return the configuration to wezterm
return config
