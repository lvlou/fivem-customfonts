# Where to get .gfx font files
You can follow [this](https://forum.cfx.re/t/fivem-update-may-5th-6th-2017/18200) example.

# How to register font files
You need to add an `add_font` entry to the resource manifest that follows this syntax:
- **title**: can be whatever, shouldn't matter
- **data**: a Lua table that contains the following keys; **file** (file name *with* .gfx extension) and **name** (the name of the font - display name?)

#### Example: `add_font "myFont" { file = "myFont.gfx", name = "My Font" }`
#
If you've followed these steps correctly, the script will register your fonts and an export function (`getRegisteredFonts`).

Otherwise it will probably fuck up.
