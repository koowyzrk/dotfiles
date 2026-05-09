#!/usr/bin/env python3
import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, GLib
import subprocess
import re
import sys


def get_sink_inputs():
    result = subprocess.run(
        ["pactl", "list", "sink-inputs"], capture_output=True, text=True
    )
    inputs = []
    current = {}
    for line in result.stdout.splitlines():
        m = re.match(r"^Sink Input #(\d+)", line)
        if m:
            if current:
                inputs.append(current)
            current = {
                "id": m.group(1),
                "name": "Unknown",
                "volume": 100,
                "muted": False,
            }
        elif current:
            if "application.name" in line:
                current["name"] = line.split("=", 1)[1].strip().strip('"')
            elif (
                "Volume:" in line
                and "Base Volume" not in line
                and "volume" not in current.get("_seen", "")
            ):
                m2 = re.search(r"(\d+)%", line)
                if m2:
                    current["volume"] = int(m2.group(1))
                current["_seen"] = "volume"
            elif "Mute: yes" in line:
                current["muted"] = True
    if current:
        inputs.append(current)
    return inputs


def set_volume(sink_id, volume):
    subprocess.run(["pactl", "set-sink-input-volume", sink_id, f"{volume}%"])


def toggle_mute(sink_id, btn, slider):
    result = subprocess.run(
        ["pactl", "list", "sink-inputs"], capture_output=True, text=True
    )
    muted = False
    current_id = None
    for line in result.stdout.splitlines():
        m = re.match(r"^Sink Input #(\d+)", line)
        if m:
            current_id = m.group(1)
        if current_id == sink_id and "Mute: yes" in line:
            muted = True
    subprocess.run(["pactl", "set-sink-input-mute", sink_id, "0" if muted else "1"])
    btn.set_label("🔊" if muted else "🔇")


class PulsePopup(Gtk.Window):
    def __init__(self):
        super().__init__(type=Gtk.WindowType.POPUP)
        self.set_decorated(False)
        self.set_keep_above(True)
        self.set_skip_taskbar_hint(True)
        self.set_skip_pager_hint(True)
        self.set_name("pulse-popup")

        # Style
        css = b"""
        #pulse-popup {
            background-color: rgba(22, 25, 37, 0.95);
            border-radius: 12px;
            border: 1px solid rgba(242, 244, 243, 0.2);
        }
        label {
            color: #FAF0C6;
            font-family: "JetBrainsMono Nerd Font";
            font-size: 12px;
        }
        scale trough {
            background-color: rgba(242, 244, 243, 0.2);
            border-radius: 6px;
            min-height: 4px;
        }
        scale highlight {
            background-color: #FAF0C6;
            border-radius: 6px;
        }
        scale slider {
            background-color: #FAF0C6;
            border-radius: 50%;
            min-width: 12px;
            min-height: 12px;
        }
        button {
            background: transparent;
            border: none;
            color: #FAF0C6;
            font-size: 14px;
            padding: 0 4px;
        }
        button:hover {
            background: rgba(242, 244, 243, 0.15);
            border-radius: 4px;
        }
        .app-row {
            padding: 4px 8px;
        }
        .title-label {
            color: rgba(250, 240, 198, 0.6);
            font-size: 10px;
            padding: 6px 12px 2px 12px;
        }
        """
        style_provider = Gtk.CssProvider()
        style_provider.load_from_data(css)
        Gtk.StyleContext.add_provider_for_screen(
            self.get_screen(), style_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
        )

        self.main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=0)
        self.main_box.set_margin_top(6)
        self.main_box.set_margin_bottom(6)
        self.add(self.main_box)

        self.build_ui()
        self.connect("leave-notify-event", self.on_leave)

        # Position near cursor / bar (top-left area for modules-left)
        self.move(10, 35)
        self.show_all()

        # Auto-refresh
        GLib.timeout_add(2000, self.refresh)

        # Close on focus loss
        self.connect("focus-out-event", lambda *a: self.quit())

    def build_ui(self):
        # Clear
        for child in self.main_box.get_children():
            self.main_box.remove(child)

        inputs = get_sink_inputs()

        if not inputs:
            label = Gtk.Label(label="  No audio streams")
            label.get_style_context().add_class("title-label")
            self.main_box.pack_start(label, False, False, 4)
        else:
            title = Gtk.Label(label="  Audio Mixer")
            title.get_style_context().add_class("title-label")
            title.set_xalign(0)
            self.main_box.pack_start(title, False, False, 0)

            sep = Gtk.Separator(orientation=Gtk.Orientation.HORIZONTAL)
            sep.set_margin_top(4)
            sep.set_margin_bottom(4)
            self.main_box.pack_start(sep, False, False, 0)

            for inp in inputs:
                row = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
                row.get_style_context().add_class("app-row")
                row.set_margin_start(6)
                row.set_margin_end(6)

                # Mute button
                mute_btn = Gtk.Button(label="🔇" if inp["muted"] else "🔊")
                mute_btn.set_relief(Gtk.ReliefStyle.NONE)
                inp_id = inp["id"]
                mute_btn.connect(
                    "clicked", lambda b, sid=inp_id, sl=None: toggle_mute(sid, b, sl)
                )

                # App name
                name_label = Gtk.Label(label=inp["name"][:22])
                name_label.set_xalign(0)
                name_label.set_width_chars(22)
                name_label.set_ellipsize(3)  # PANGO_ELLIPSIZE_END

                # Volume slider
                adj = Gtk.Adjustment(
                    value=inp["volume"],
                    lower=0,
                    upper=150,
                    step_increment=1,
                    page_increment=5,
                )
                slider = Gtk.Scale(
                    orientation=Gtk.Orientation.HORIZONTAL, adjustment=adj
                )
                slider.set_size_request(140, -1)
                slider.set_draw_value(True)
                slider.set_value_pos(Gtk.PositionType.RIGHT)
                slider.set_digits(0)
                slider.connect(
                    "value-changed",
                    lambda s, sid=inp_id: set_volume(sid, int(s.get_value())),
                )

                row.pack_start(mute_btn, False, False, 0)
                row.pack_start(name_label, False, False, 0)
                row.pack_start(slider, True, True, 0)
                self.main_box.pack_start(row, False, False, 2)

        self.show_all()
        return True

    def refresh(self):
        self.build_ui()
        return True  # keep timer alive

    def on_leave(self, widget, event):
        # Check if mouse truly left the window
        x, y = self.get_position()
        w, h = self.get_size()
        px, py = self.get_display().get_default_seat().get_pointer().get_position()[1:]
        if not (x <= px <= x + w and y <= py <= y + h):
            self.quit()

    def quit(self):
        Gtk.main_quit()


if __name__ == "__main__":
    popup = PulsePopup()
    Gtk.main()
