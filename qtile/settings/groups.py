
from libqtile import qtile, hook
from libqtile.config import Key, Group
from libqtile.lazy import lazy

from .keys import mod, keys



groups = [
    Group(i) for i in [
        " 1. ", " 2. ", " 3. ", " 4 ", " 5 ",
        " 6. ", " 7. ", " 8. ", " 9.󰢹 ",
    ]
]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    #keys.append(
    #    Key([mod], i, lazy.screen.togglegroup(i))
    #)
    keys.extend([
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])


# @hook.subscribe.startup_complete
# def assign_groups_to_screens():
#     if len(qtile.screens) < 2:
#         return
#     print('Running multiple monitor code')

#     # Screen 0 → laptop
#     # Screen 1 → external monitor
#     external_screen = qtile.screens[1]
#     for group_name in [" 6. ", " 7. ", " 8. ", " 9.󰢹 "]:
#         group = qtile.groups_map[group_name]
#         group.toscreen(external_screen.index)