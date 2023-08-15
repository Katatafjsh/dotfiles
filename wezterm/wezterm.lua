local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- config.default_prog = { '/opt/homebrew/bin/zellij', 'attach', '--create' }
config.default_prog = { '/opt/homebrew/bin/fish' }

config.check_for_updates = false
config.color_scheme = "GruvboxDarkHard"

config.macos_window_background_blur = 20
config.native_macos_fullscreen_mode = true
config.scrollback_lines = 10000

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 600

config.font_size = 13
config.line_height = 1.2

config.initial_rows = 36
config.initial_cols = 146

config.window_background_opacity = 0.90
config.window_decorations = 'RESIZE'
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.adjust_window_size_when_changing_font_size = false

-- disable most of the keybindings 
-- config.enable_kitty_keyboard = true 
-- use_ime=false
config.disable_default_key_bindings = true
config.use_dead_keys = false

config.keys = {
  { key = ")",        mods = "CTRL",  action = act.ResetFontSize },
  { key = "-",        mods = "CTRL",  action = act.DecreaseFontSize },
  { key = "=",        mods = "CTRL",  action = act.IncreaseFontSize },
--  { key = "N",        mods = "CTRL",  action = act.SpawnWindow },
--  { key = "P",        mods = "CTRL",  action = act.ActivateCommandPalette },
  { key = "V",        mods = "CTRL",  action = act.PasteFrom("Clipboard") },
  { key = "Copy",     mods = "NONE",  action = act.CopyTo("Clipboard") },
  { key = "Paste",    mods = "NONE",  action = act.PasteFrom("Clipboard") },
  { key = "F11",      mods = "NONE",  action = act.ToggleFullScreen },
  { key = 'q', mods = 'CMD', action = wezterm.action.QuitApplication },

}

return config
