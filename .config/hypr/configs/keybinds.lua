local mainMod = "SUPER"

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize the active window using CTRL + arrow keys
hl.bind("CTRL + right", hl.dsp.window.resize({ x = 70, y = 0, relative = true }))
hl.bind("CTRL + left", hl.dsp.window.resize({ x = -70, y = 0, relative = true }))
hl.bind("CTRL + up", hl.dsp.window.resize({ x = 0, y = -70, relative = true }))
hl.bind("CTRL + down", hl.dsp.window.resize({ x = 0, y = 70, relative = true }))
-- Moving workspaces [1-6] to the current monitor using mainMod + CTRL + [1-6]
for i = 1, 6 do
	hl.bind(mainMod .. " + CTRL + " .. i, hl.dsp.workspace.move({ workspace = i, monitor = "current" }))
end

--- waybar relaunch
hl.bind(mainMod .. " + SHIFT + B ", hl.dsp.exec_cmd("~/.config/waybar/launch.sh"), { locked = true, repeating = true })
--- brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +10"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10-"), { locked = true, repeating = true })
-- volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("amixer -D pulse sset Master 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("amixer -D pulse sset Master 5%-"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
--- screenshot
hl.bind(mainMod .. " + SHIFT + C ", hl.dsp.exec_cmd("grimblast copy area"), { locked = true })
--- Screenshot a window
hl.bind(mainMod .. " + PRINT ", hl.dsp.exec_cmd("hyprshot -m window"), { locked = true })
--- Screenshot a monitor
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output -o /home/kwzrk/screenshots/ -z"), { locked = true })
--- Screenshot a region
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"), { locked = true })
--- zen
hl.bind(mainMod .. " + z ", hl.dsp.exec_cmd("zen-browser"), { locked = true })
