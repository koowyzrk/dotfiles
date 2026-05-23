--  MONITORS ---
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@120",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "eDP-1",
	mode = "2560x1600@60",
	position = "1920x0",
	scale = 1,
})

--- MY PROGRAMS ---
terminal = "kitty"
menu = "rofi -show drun"

--- AUTOSTART ---
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("waybar")
	hl.exec_cmd("hpr-scratcher")
	hl.exec_cmd("swaync")
	hl.exec_cmd("kitty")
end)

--- ENVIRONMENT VARIABLES ---
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_MENU_PREFIX", "arch-")

--- LOOK AND FEEL ---
require("configs.looknfeel")
--- INPUT ---
require("configs.input")
--- KEYBINDINGSS ---
require("configs.keybinds")
--- WINDOW RULES ---
require("configs.windowrules")

---  NVIDIA  ---
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia - drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

hl.config({
	cursor = {
		no_hardware_cursors = 1,
	},
})
