import os
import json

from .path import qtile_path


def load_theme():
    theme = "material-ocean"  # fallback theme
    config = os.path.join(qtile_path, "config.json")
    if os.path.isfile(config):
        with open(config) as f:
            theme = json.load(f)["theme"]
    else:
        with open(config, "w") as f:
            f.write(f'{{"theme": "{theme}"}}\n')

    theme_file = os.path.join(qtile_path, "themes", f'{theme}.json')
    if not os.path.isfile(theme_file):
        raise Exception(f'"{theme_file}" does not exist')

    with open(os.path.join(theme_file)) as f:
        return json.load(f)


if __name__ == "settings.theme":
    colors = load_theme()

