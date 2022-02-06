# shortcuts.json Reference

    {
        "keys": {
            "primary": ["Shift"],
            "main": "="
        },

        "info": {
            "description": "Increase Audio",
            "group": "Audio"
        },

        "callback": "amixer set Master 5%+"
    },

This creates a shortcut that will increase audio when `Mod4`+`Shift`+`=` is pressed.

`keys.primary` - Keys used along with the modkey. Examples are Ctrl, Shift, etc...
`keys.main` - The main key used to execute the command.
`info.description` - The description that will show in the awesome info window.
`info.group` - The group that will show in the awesome info window.
`callback` - The command that is executed when the shortcut is activated.
