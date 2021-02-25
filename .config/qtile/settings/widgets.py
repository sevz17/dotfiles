from libqtile import widget
from settings.theme import colors

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)

base = lambda fg='text', bg='dark': {
    'foreground': colors[fg],
    'background': colors[bg]
}

separator = lambda: widget.Sep(**base(), linewidth=0, padding=5)

icon = lambda fg='text', bg='dark', fontsize=16, text="?": widget.TextBox(
    **base(fg, bg),
    fontsize=fontsize,
    text=text,
    padding=3
)

powerline = lambda fg="light", bg="dark": widget.TextBox(
   **base(fg, bg),
    text="", # Icon: nf-oct-triangle_left
    fontsize=37,
    padding=-2
)

workspaces = lambda: [
    separator(),
    widget.GroupBox(
        **base(fg='light'),
        font='UbuntuMono Nerd Font',
        fontsize=19,
        margin_y=3,
        margin_x=0,
        padding_y=8,
        padding_x=5,
        borderwidth=1,
        active=colors['active'],
        inactive=colors['inactive'],
        rounded=False,
        highlight_method='block',
        urgent_alert_method='block',
        urgent_border=colors['urgent'],
        this_current_screen_border=colors['focus'],
        this_screen_border=colors['grey'],
        other_current_screen_border=colors['dark'],
        other_screen_border=colors['dark'],
        disable_drag=True
    ),
    widget.CurrentLayoutIcon(scale=0.65),
    separator(),
    widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
    separator(),
]

primary_widgets = [
    *workspaces(),

    separator(),



    powerline('color4', 'dark'),

    icon(bg="color4", text=' '), # Icon: nf-fa-download

    widget.CheckUpdates(**base(bg='color4'), update_interval=60, distro='Arch_checkupdates'),

    powerline('color2', 'color4'),

    widget.Volume(**base(bg='color2'), volume_app="pamixer"),

    powerline('color1', 'color2'),

    widget.Pomodoro(**base(bg='color1')),


    powerline('color1', 'color2'),

    widget.Clock(**base(bg='color1'), format=' %H:%M:%S'),

    widget.Clock(**base(bg='color1'), format=' %d/%m/%Y'),

    powerline('dark', 'color1'),

    widget.KeyboardLayout(**base(fg='color3', bg='dark'), configured_keyboards=['us', 'latam'], display_map={'us':'US', 'latam':'ES'}),


    widget.Systray(background=colors['dark'], padding=10),

]

bottom_widgets = [
    widget.Mpris2(**base(bg='color2'), objname='org.mpris.MediaPlayer2.Spotify'),
    widget.Memory(**base(bg='color1'), visible_on_warn = False ),
    widget.CPU(**base(bg='color3'), format='{load_percent}%'),
    widget.Net(**base(bg='color2'))

]
secondary_widgets = [

    widget.Spacer(),

]

widget_defaults = {
    'font': 'UbuntuMono Nerd Font Bold',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()
