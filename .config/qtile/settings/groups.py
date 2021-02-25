# Qtile workspaces

from libqtile.config import Key, Group
from libqtile.command import lazy
from settings.keys import mod, keys

groups = [Group(i) for i in [
     "   ", " ﬏  ", "   ", "   ", "   ", "   ", "   ", "   ", "   " , " "
]]

for i, group in enumerate(groups):
    actual_key = str(i + 1)
    if actual_key == "10":
        keys.extend([
            Key([mod], "0", lazy.group[group.name].toscreen()),
            Key([mod, "shift"], "0", lazy.window.togroup(group.name))
        ])
    else:
        keys.extend([
            # Switch to workspace N
            Key([mod], actual_key, lazy.group[group.name].toscreen()),
            # Send window to workspace N
            Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])
