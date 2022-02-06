# awesome-shortcut-json

![code size](https://img.shields.io/github/languages/code-size/CyanPiano/awesome-shortcut-json) ![last commit](https://img.shields.io/github/last-commit/CyanPiano/awesome-shortcut-json)

Simple plugin for [awesomewm](https://github.com/awesomeWM/awesome) that works as a simple way to create keyboard shortcuts without having to edit your `rc.lua` file. Originally made this so I could remove sxhkd from my setup, but I thought I'd clean it up a bit and make it an actual repo.

## Setup
Download the source code and move it into the same directory as your `rc.lua`. Next, copy the `shortcuts.json` file into the same directory as your `rc.lua` file.
```
$ cp awesome-shortcut-lua/ext/shortcuts.json .
```
Your file structure should look something like this.

    /awesome-shortcut-lua
        /src
            ...
        /lib
            ...
        /ext
            ...
        awesome-shortcut.lua
        
    rc.lua
    shortcuts.json

Next you'll want to configure your `shortcuts.json`. For reference on how to do this, read `ext/shortcuts.md`. Finally, you need to require `awesome-shortcut-lua/awesome-shortcut.lua` in your `rc.lua` file. This can vary between setups, but the basic idea is to `require` the module and call it with `root.keys`.

```lua
root.keys(
    require("awesome-shortcut-json.awesome-shortcut")
)
```

If you already have shortcuts you don't want to overwrite you can also combine them.

```lua
root.keys(gears.table.join(
    require("awesome-shortcut-json.awesome-shortcut"),
    globalkeys -- or whatever you have this named as
))
```

Finally, you need to edit `awesome-shortcut.lua`. Set the `shortcuts.json` path to any location you want. Don't use a relative path.

```lua
AWESOME_SHORTPATH = "/home/USERNAME/.config/awesome/shortcuts.json"
```

And that's it! Just reload awesome and the shortcuts should load. If `shortcuts.json` has any errors like an unset value you will get a warning notification. If you want to change the default modkey or change the directory of the `shortcuts.json` file, edit `awesome-shortcut.lua`.

## Dependencies
`rxi/log.lua` doesn't exist on luarocks so it has been installed in the `/lib` directory.
- [rxi/log.lua](https://github.com/rxi/log.lua)

