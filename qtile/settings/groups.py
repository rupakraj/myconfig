from libqtile.config import Key, Group
from libqtile.lazy import lazy
from .keys import mod, keys


groups = [
    Group(i) for i in [
        " 1. ", " 2. ", " 3. ",
        " 4 ", " 5 ", " 6 ",
        " 7 ", " 8  ", " 9.󰢹 ",
    ]
]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])

