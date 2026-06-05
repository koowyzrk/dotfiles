local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
	name = "kitty",
	match = { class = "kitty-special" },
	workspace = "special:magic",
})

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
hl.window_rule({
	name = "org.kde.dolphin",
	match = { class = "org.kde.dolphin" },
	float = true,
	size = { 1000, 800 },
	center = true,
})
hl.window_rule({
	name = "org.gnome.Nautilus",
	match = { class = "org.gnome.Nautilus" },
	float = true,
	size = { 1000, 800 },
	center = true,
})
hl.window_rule({
	name = "imv",
	match = { class = "imv" },
	float = true,
	-- size = { 1000, 800 },
	center = true,
})
hl.window_rule({
	name = "mpv",
	match = { class = "mpv" },
	float = true,
	size = { 1000, 800 },
	center = true,
})
hl.window_rule({
	name = "steam",
	match = { class = "steam", title = "Friends List" },
	float = true,
	size = { 600, 800 },
	center = true,
})

-- rydz engine
-- rydz_ecs 3D Demo
hl.window_rule({
	name = "Rydz Tools",
	match = { class = "Tk" },
	float = true,
	size = { 800, 800 },
	center = true,
})
hl.window_rule({
	name = "rydz_ecs 3D Demo",
	match = { class = "main", title = "rydz_ecs 3D Demo" },
	float = true,
	-- size = { 800, 800 },
	center = true,
})
