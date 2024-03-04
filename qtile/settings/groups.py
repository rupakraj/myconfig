from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import mod, keys

from .screens import screens

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)
# Icons:
# nf-fa-firefox,
# nf-fae-python,
# nf-dev-terminal,
# nf-fa-code

groups = [Group(i) for i in [
    "   ", "   ", " 3  ", " 4  ", " 5  ", " 6  ", " 7  ", " 8  ", " 9  ",
]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])


#if len(screens) == 2:
#    for i in groups:
#        keys.extend([
#            # Switch to group N
#            Key(
#                [mod], 
#                i.name, 
#                lazy.to_screen(0) if i.name in '1234' else lazy.to_screen(1),
#                lazy.group[i.name].toscreen()
#            ),
#            # Move window to group N
#            Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),),
#        ])
#
#else:
#    for i in groups:
#        keys.extend([
#            # Switch to group N
#            Key([mod], i.name, lazy.group[i.name].toscreen()),
#            # Move window to group N
#            Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),),
#        ])
#
