import os
import subprocess

from libqtile import hook

from settings.keys import mod, keys
from settings.groups import groups
from settings.layouts import layouts, floating_layout
from settings.widgets import widget_defaults, extension_defaults
from settings.screens import screens
from settings.mouse import mouse
from settings.path import qtile_path

import settings.theme

wallpaper_dir = "~/wallpapers"
default_wallpaper = "~/wallpapers/default.jpg"


@hook.subscribe.startup_once
def autostart():
    subprocess.call([os.path.join(qtile_path, 'autostart.sh')])


@hook.subscribe.screens_reconfigured
def update_wallpapers():
    wallpapers = [os.path.join(os.path.expanduser(wallpaper_dir), f) 
                  for f in os.listdir(os.path.expanduser(wallpaper_dir)) 
                  if f.endswith(('.jpg', '.png'))]
    for i, screen in enumerate(screens):
        if i < len(wallpapers):
            screen.set_wallpaper(wallpapers[i], "fill")
        else:
            screen.set_wallpaper(default_wallpaper, "fill")

main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
# focus_on_window_activation = 'urgent'
wmname = 'Qtile'
