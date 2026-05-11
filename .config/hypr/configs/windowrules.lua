local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
	name = "godot",
	match = { class = "Godot", title = "Godot" },
	tile = true,
})
hl.window_rule({
	name = "aseprite",
	match = { class = "Aseprite" },
	float = true,
	maximize = true,
})
hl.window_rule({
	name = "xdg-desktop-portal-gtk",
	match = { class = "xdg-desktop-portal-gtk" },
	float = true,
})
hl.window_rule({
	name = "pure-ref",
	match = { class = "PureRef" },
	float = true,
	size = { 600, 600 },
	center = true,
})
hl.window_rule({
	name = "org.pulseaudio.pavucontrol",
	match = { class = "org.pulseaudio.pavucontrol" },
	float = true,
	size = { 700, 700 },
	center = true,
})
hl.window_rule({
	name = "nmtui",
	match = { class = "nmtui" },
	float = true,
	size = { 800, 800 },
	center = true,
})
