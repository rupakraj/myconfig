from datetime import datetime
import pytz
from libqtile import widget
from libqtile.lazy import lazy
from libqtile.bar import CALCULATED

from qtile_extras import widget
from qtile_extras.widget import decorations

from .theme import colors



# AoE
aoe_tz = pytz.timezone('Etc/GMT+12')  # UTC-12
ist_tz = pytz.timezone('Asia/Kolkata')  #IST
    
# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)


def base(fg="text", bg="dark"):
    return {"foreground": colors[fg], "background": colors[bg]}


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
    )


decoration_updates = {
    "decorations": [
        decorations.RectDecoration(
            use_widget_background=True, filled=True, group=True, radius=[10, 0, 0, 10]
        ),
        decorations.PowerLineDecoration(
            path="forward_slash",
        ),
    ]
}

decoration_slash = {
    "decorations": [decorations.PowerLineDecoration(path="forward_slash")]
}

decoration_spotify = {
    "decorations": [decorations.PowerLineDecoration(path="rounded_left")]
}

decoration_systray = {
    "decorations": [
        decorations.RectDecoration(
            use_widget_background=False, filled=True, group=True, radius=[0, 10, 10, 0]
        ),
    ]
}


def workspaces():
    return [
        separator(),
        widget.GroupBox(
            **base(fg="light"),
            font="Ubuntu Nerd Font",
            fontsize=18,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=3,
            borderwidth=3.5,
            active=colors["active"],
            inactive=colors["inactive"],
            rounded=False,
            hide_unused="true",
            highlight_method="line",
            urgent_alert_method="block",
            urgent_border=colors["urgent"],
            this_current_screen_border=colors["focus"],
            this_screen_border=colors["grey"],
            other_current_screen_border=colors["dark"],
            other_screen_border=colors["dark"],
            disable_drag=True,
        ),
        separator(),
        widget.Spacer(**base(bg="dark")),
        widget.WindowName(
            **base(fg="focus"),
            fontsize=15,
            padding=5,
            format="{name}",
            max_chars=100,
            # width=CALCULATED,
        ),
        widget.Spacer(**base(bg="dark")),
        separator(),
    ]


primary_widgets = [
    *workspaces(),
    separator(),
    # widget.CheckUpdates(
    #     **decoration_updates,
    #     background=colors["color4"],
    #     colour_have_updates=colors["text"],
    #     colour_no_updates=colors["text"],
    #     no_update_string="0",
    #     display_format="{updates}",
    #     update_interval=1800,
    #     custom_command="checkupdates",
    #     fmt="   {}",
    # ),
    widget.Sep(**base(), linewidth=0, padding=5, **decoration_slash),
    widget.CurrentLayoutIcon(**base(bg="color2"), scale=0.65),
    # widget.CurrentLayout(**base(bg="color2"), padding=5, **decoration_slash),

    # Check the naming convention here: 
    # cat /sys/class/power_supply/BATT/model_name
    widget.UPowerWidget(
        **base(bg="color1"),
        battery_height=12,
        battery_name = "BATT",        
        text_charging = "󰂉 ({percentage:.0f}%) {ttf}",
        text_discharging = '󰂍 ({percentage:.0f}%) {tte}',
        **decoration_slash
    ),
    widget.WiFiIcon(
        **base(bg="color3"),
        interface="wlp1s0",
        padding_y=4,
        active_colour=colors["light"],
        # expand_timeout=2,
        # show_ssid=True,
        update_interval = 30,
        # mouse_callbacks={"Button1": lazy.spawn("nm-applet")},
        **decoration_slash,
    ),
    widget.KeyboardLayout(
        **base(bg="color1"),
        configured_keyboards=['us','np'],
        **decoration_slash,
    ),
    
    widget.Systray(background=colors["black"], padding=5, **decoration_slash),

    
    # widget.TextBox(
    #     **base(bg="color3"),
    #     text="CHiPSAL-30Oct",
    #     **decoration_slash,
    # ),
    
    # widget.Clock(
    #     **base(bg="color3"), 
    #     format   = " %d %b / %I:%M%p ", 
    #     fmt="IST {}",
    #     timezone = ist_tz,
    #     **decoration_slash,
    # ),
    widget.Clock(
        **base(bg="color1"), format=" %d %b / %I:%M%p ", fmt="  {}"
    ),
    powerline("dark", "color1"),
]

secondary_widgets = [
    *workspaces(),
    separator(),
    widget.Sep(**base(), linewidth=0, padding=5, **decoration_slash),
    # powerline('color1', 'dark'),
    widget.CurrentLayoutIcon(**base(bg="color2"), scale=0.65, padding=5, **decoration_slash),
    # widget.CurrentLayout(**base(bg="color2"), padding=5, **decoration_slash),
    # powerline('color2', 'color1'),
    widget.Clock(
        **base(bg="color1"), 
        format=" %d %b / %I:%M%p ",
        fmt = "  {}"
    ),
    powerline("dark", "color1"),
]

widget_defaults = {
    "font": "Ubuntu Nerd Font",
    "fontsize": 18,
    "padding": 2,
}
extension_defaults = widget_defaults.copy()
