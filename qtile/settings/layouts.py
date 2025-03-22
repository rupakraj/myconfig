from libqtile import layout
from libqtile.config import Match
from .theme import colors


# Layouts and layout rules
layout_conf = {
    'border_focus': colors['focus'][0],
    'border_width': 1,
    'margin': 2
}

layouts = [
    layout.Max(),
    layout.MonadTall(**layout_conf),
    # layout.Matrix(columns=2, **layout_conf),
    layout.TreeTab(
        font="Ubuntu Bold",
        fontsize=12,
        panel_width=120,
        section_fontsize=13,
        vspace=3,
        padding=5,
        section_top=True,
        level_shift=10,
        bg_color="#282c34",
        active_bg="#ffcc00",  # Highlight active
        active_fg="#000000",
        inactive_bg="#3b4252",
        inactive_fg="#d8dee9",
    ),
]

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),
        Match(wm_class='makebranch'),
        Match(wm_class='maketag'),
        Match(wm_class='ssh-askpass'),
        Match(title='branchdialog'),
        Match(title='pinentry'),
    ],
    border_focus=colors["color4"][0]
)
