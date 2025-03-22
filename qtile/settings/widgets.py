import pytz
from libqtile import widget, bar

from qtile_extras import widget
from qtile_extras.widget import decorations

from .theme import colors


# They are for the conference reminders AoE
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


decoration_slash = {
    "decorations": [decorations.PowerLineDecoration(path="forward_slash")]
}

decoration_angle_right= {
    "decorations": [decorations.PowerLineDecoration(path="rounded_right")]
}

decoration_angle_left= {
    "decorations": [decorations.PowerLineDecoration(path="rounded_left")]
}


def workspaces():
    return [
        separator(),
        widget.GroupBox(
            **base(fg   = "light"),
            font        = "Ubuntu Nerd Font",
            fontsize    = 18,
            margin_y    = 3,
            margin_x    = 0,
            padding_y   = 8,
            padding_x   = 3,
            borderwidth = 3.5,
            
            active      = colors["active"],
            inactive    = colors["inactive"],

            rounded      = True,
            hide_unused  = False,
            disable_drag = True,

            highlight_method     = "line",
            urgent_alert_method  = "block",
            
            urgent_border               = colors["urgent"],
            this_current_screen_border  = colors["focus"],
            this_screen_border          = colors["grey"],
            other_current_screen_border = colors["dark"],
            other_screen_border         = colors["dark"],
        ),
        separator(),
        widget.Spacer(**base(bg = "dark"), length=15),
        widget.WindowName(
            **base(fg = "focus"),
            fontsize   = 15,
            padding    = 5,
            format     = "{name}",
            max_chars  = 200,
            width      = bar.STRETCH,
        ),
        widget.Spacer(**base(bg = "dark")),
        separator(),
    ]


primary_widgets = [
    powerline("dark", "color1"),
    widget.TextBox(
        **base(bg="color1"),
        text="  ",
        **decoration_angle_left,
    ),

    *workspaces(),
    separator(),
    
    widget.Sep(**base(bg="dark"), linewidth=0, **decoration_angle_right),
    widget.CurrentLayoutIcon(**base(bg="color2"), scale=0.65),
    widget.Sep(**base(bg="color2"), linewidth=0, **decoration_slash),
    
    # Check the naming convention here: 
    # cat /sys/class/power_supply/BATT/model_name
    widget.UPowerWidget(
        **base(bg = "color1"),
        battery_height = 12,
        battery_name = "BATT",        
        text_charging = "󰂉 ({percentage:.0f}%) {ttf}",
        text_discharging = '󰂍 ({percentage:.0f}%) {tte}',
        **decoration_slash
    ),
   
    widget.WiFiIcon(
        **base(bg = "color3"),
        interface = "wlp1s0",
        active_colour = colors["light"],
        update_interval = 30,
        **decoration_slash,
    ),
    
   
    widget.KeyboardLayout(
        **base(bg = "color2"),
        configured_keyboards = ['us', 'np'],
        **decoration_slash,
    ),
    
    widget.Systray(
        background = colors["focus"],
        padding    = 5,
        **decoration_slash
    ),

    # ########## They are for the conference deadline reminders #######
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
        **base(bg = "color2"), 
        format    = "%a %d %b / %I:%M ", 
        fmt       = "  {}"
    ),

    powerline("dark", "color1"),
]

secondary_widgets = [
    powerline("dark", "color1"),
    widget.TextBox(
        **base(bg="color1"),
        text="  ",
        **decoration_angle_left,
    ),
    *workspaces(),
    separator(),
    widget.Sep(**base(bg="dark"), linewidth=0, **decoration_angle_right),
    widget.CurrentLayoutIcon(**base(bg="color1"), scale=0.65, **decoration_slash),
    widget.Sep(**base(bg="color1"), linewidth=0, **decoration_slash),
    widget.Clock(
        **base(bg = "color2"), 
        format    = "%a %d %b / %I:%M ", 
        fmt       = "  {}"
    ),
    powerline("dark", "color1"),
]


widget_defaults = {
    "font": "Ubuntu Nerd Font",
    "fontsize": 18,
    "padding": 2,
}
extension_defaults = widget_defaults.copy()

