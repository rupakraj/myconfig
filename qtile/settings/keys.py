from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.core import manager
from libqtile import qtile


mod = "mod4"
alt = "mod1"

keys = [
    Key(key[0], key[1], *key[2:])
    for key in [
        # ------------ Window Configs ------------
        # Switch between windows in current stack pane
        ([mod], "j", lazy.layout.down()),
        ([mod], "k", lazy.layout.up()),
        ([mod], "h", lazy.layout.left()),
        ([mod], "l", lazy.layout.right()),

        # Change window sizes (MonadTall)
        ([mod, "shift"], "l", lazy.layout.grow()),
        ([mod, "shift"], "h", lazy.layout.shrink()),
        # Toggle floating
        ([mod, "shift"], "f", lazy.window.toggle_floating()),
        # Move windows up or down in current stack
        ([mod, "shift"], "j", lazy.layout.shuffle_down()),
        ([mod, "shift"], "k", lazy.layout.shuffle_up()),

        ([mod], "f", lazy.window.toggle_fullscreen()),
        ([mod], "Tab", lazy.next_layout()),
        ([mod], "w", lazy.window.kill()),
       
        # Restart Qtile
        ([mod, "control"], "r", lazy.restart()),
        ([mod, "control"], "q", lazy.shutdown()),

        # ------------ App Configs ------------
        ([mod], "space", lazy.spawn("rofi -show drun")),
        ([mod, "control"], "l", lazy.spawn("betterlockscreen -l")),
        ([mod, "shift"], "space", lazy.spawn("rofi -show window")),
        (["control", "shift"], "s", lazy.spawn("flameshot gui")),
        ([mod], "e", lazy.spawn("nemo")),
        ([mod], "Return", lazy.spawn("alacritty")),

        # ------------ Hardware Configs ------------
        # Volume
        ([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
        ([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
        ([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
        # Brightness
        ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +5%")),
        ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),

        # multiple keyboard layout
        ([alt], "Shift_L",  lazy.widget["keyboardlayout"].next_keyboard()),
        
        # Switch focus of monitors
        ([mod], "period", lazy.next_screen()),
        ([mod], "comma", lazy.prev_screen()),

    ]
]
