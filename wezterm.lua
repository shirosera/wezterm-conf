local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_domain = 'WSL:Ubuntu-22.04'
config.color_scheme = 'nord'

-- フォントサイズの設定
config.font_size = 10

-- keybind
config.keys = {
  -- C-Shift + h　で水平方向にペインを分割
  {key="h", mods="CTRL|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
  -- C-Shift + b　で垂直方向にペインを分割
  {key="b", mods="CTRL|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
  -- C-Shift + Q　でペインを閉じる
  {key="q", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentPane={confirm=true}}},
  -- C-Alt + hjkl　でペイン間を移動
  {key="h", mods="CTRL|ALT", action=wezterm.action{ActivatePaneDirection="Left"}},
  {key="j", mods="CTRL|ALT", action=wezterm.action{ActivatePaneDirection="Down"}},
  {key="k", mods="CTRL|ALT", action=wezterm.action{ActivatePaneDirection="Up"}},
  {key="l", mods="CTRL|ALT", action=wezterm.action{ActivatePaneDirection="Right"}},
  -- C-Shift-Alt + hjkl　でペインのサイズを変更
  {key="h", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Left", 5}}},
  {key="j", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Down", 5}}},
  {key="k", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Up", 5}}},
  {key="l", mods="CTRL|SHIFT|ALT", action=wezterm.action{AdjustPaneSize={"Right", 5}}},

  -- C-Shift + t　で新しいタブを開く
  {key="t", mods="CTRL|SHIFT", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
  -- C-Shift + p で前のタブに移動
  {key="p", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
  -- C-Shift + n で次のタブに移動
  {key="n", mods="CTRL|SHIFT", action=wezterm.action{ActivateTabRelative=1}},
  -- C-Shift + w で現在のタブを閉じる
  {key="w", mods="CTRL|SHIFT", action=wezterm.action{CloseCurrentTab={confirm=true}}},
}


return config

