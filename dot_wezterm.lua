local wezterm = require("wezterm")
local act = wezterm.action

-- ── Startup ────────────────────────────────────────────────────────────────
wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- ── Key bindings ───────────────────────────────────────────────────────────
local keys = {
	-- Scroll (espelhando o alacritty)
	{ key = "j", mods = "CTRL|SHIFT", action = act.ScrollByLine(1) },
	{ key = "k", mods = "CTRL|SHIFT", action = act.ScrollByLine(-1) },
	{ key = "d", mods = "CTRL|SHIFT", action = act.ScrollByPage(0.5) },
	{ key = "u", mods = "CTRL|SHIFT", action = act.ScrollByPage(-0.5) },

	-- Tabs
	{ key = "t",          mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w",          mods = "CTRL|SHIFT", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "LeftArrow",  mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(1) },

	-- Splits
	{ key = "%", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-",  mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "h",  mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "l",  mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },

  -- Fechar pane atual (sem confirmação)
  { key = "x", mods = "ALT", action = act.CloseCurrentPane({ confirm = false }) },

	-- Clipboard
	{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

	-- Zoom do painel atual
	{ key = "z", mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },

	-- Busca no scrollback
	{ key = "f", mods = "CTRL|SHIFT", action = act.Search({ CaseInSensitiveString = "" }) },
}

-- ── Config ─────────────────────────────────────────────────────────────────
return {
	-- Fonte
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 14,

	-- Aparência
  color_scheme = 'Gruvbox dark, medium (base16)',
	window_background_opacity = 0.9,
	window_padding = { left = 10, right = 10, top = 10, bottom = 10 },

	-- Cursor
	default_cursor_style = "BlinkingUnderline",
	cursor_blink_rate = 500,

	-- Tab bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,

	-- Scrollback
	scrollback_lines = 10000,

	-- Teclas
	keys = keys,
}
