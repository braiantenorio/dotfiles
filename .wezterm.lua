-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

window_decorations = "TITLE | RESIZE"
-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 13

line_height = 1.2
--config.font = wezterm.font('Geist Mono', {weight= 'Medium'})
config.font = wezterm.font('JetBrains Mono', {weight= 'Medium'})

--config.font = wezterm.font('Cascadia Mono', {weight= 'Medium'})

config.enable_wayland = false 

--config.font = wezterm.font('CaskaydiaMono Nerd Font Mono', {weight= 'Medium'})

--config.color_scheme = 'iTerm2 Default'

--config.color_scheme = 'Dark Pastel (Gogh)'
config.color_scheme = 'Campbell (Gogh)'


--config.color_scheme = 'iTerm2 Pastel Dark Background'
config.hide_tab_bar_if_only_one_tab = true

config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

-- Finally, return the configuration to wezterm:
--
--
config.window_frame = {
    -- The font used in the tab bar.
    -- Roboto Bold is the default; this font is bundled
    -- with wezterm.
    -- Whatever font is selected here, it will have the
    -- main font setting appended to it to pick up any
    -- fallback fonts you may have used there.
    font = wezterm.font { family = 'JetBrains Mono', weight = 'Black' },

    -- The size of the font in the tab bar.
    -- Default to 10.0 on Windows but 12.0 on other systems
    font_size = 12.0,

    -- The overall background color of the tab bar when
    -- the window is focused
    active_titlebar_bg = '#333333',

    -- The overall background color of the tab bar when
    -- the window is not focused
    inactive_titlebar_bg = '#333333',
}

config.colors = {
    tab_bar = {
        -- The color of the inactive tab bar edge/divider
        inactive_tab_edge = '#575757',
    },
    selection_bg = '#FFFFFF',
    selection_fg = '#000000'

}


return config
