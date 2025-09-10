# It Beats (OpenMW)

Feel the heartbeat of the Red Mountain.

For MWSE aternative, check out [Heartthrum](https://www.nexusmods.com/morrowind/mods/47178) by [RedFurryDemon](https://next.nexusmods.com/profile/RedFurryDemon/mods?gameId=100).

## Features

### Audible Red Mountain Heartbeat

Whenever you're in the Red Mountain region (effectively, inside the Ghostfence), you'll hear Lorkhan's heartbeat - distant, yet disturbing...

### And It Gets Louder

The closer you get to the Heart, the louder the heartbeat becomes.  
The mod differentiates **five** separate player locations:

1. **Akulakhan's Chamber** - current cell name: `Akulakhan's Chamber`
2. **Dagoth Ur, Facility Cavern** (the room where you first meet Dagoth Ur) - current cell name: `Dagoth Ur, Facility Cavern`
3. **The rest of Dagoth Ur (the citadel)** - current cell name starts with `Dagoth Ur`
4. **Generic interior** - current cell is an interior and at least one door leads to a Red Mountain region exterior cell (connected interiors are checked the same way)
5. **Exterior** - current cell is exterior and located in the Red Mountain region

All these locations have separate volume configs and can be assigned different SFX (which might be used in the future).

### And It Stops

After you deal with the Heart, the heartbeat - obviously - stops.  
Technically, the mod checks the player's quests: if quest `C3_DestroyDagoth` is at stage 20 or higher, the heartbeat stops.

### Heartthrum SFX Support

Though MADpixel crafted brand-new SFX for each of the five locations, I've brought back the original Heartthrum SFX for those who prefer it. It's available in the mod options.

<a id="custom_cell_blacklist"></a>

### Custom Cell Blacklist

Since the mod assumes an interior is in the Red Mountain region by checking all doors that lead to exteriors, it might conflict with certain player homes or similar mods that add teleports to the Red Mountain region.  
To address this, there's a file in `scripts\ItBeats` called `cellBlacklist.lua`.

To add a cell to the blacklist, simply add an item to the list, like this:

```lua
local BlacklistedInteriors = {
    -- It has to be:
    -- 1. in lower case (not Capital Case or UPPER CASE)
    -- 2. exactly the same as the cell name on the map

    -- Example:
    ["balmora, eight plates"] = true,
}
```

You can also message me or make a PR to the [GitHub repo](https://github.com/SosnoviyBor/ItBeats) to add support for such mods (even if you're not the mod's author).  
If you decide to message me, please prepare a list of cells to add so I don't accidentally miss anything.

## Requirements

OpenMW, duh.

## Installation

Install like any other OpenMW mod.

## Compatibility

The mod might add SFX to interiors leading to the Red Mountain region that aren't actually there. Check the [Custom Cell Blacklist section](#custom_cell_blacklist) for details.

If something renames `Akulakhan's Chamber` or `Dagoth Ur, Facility Cavern`, the mod will default to `Dagoth Ur`.  
If something renames `Dagoth Ur` (the citadel) to something completely different that doesn't contain `Dagoth Ur` in the name, the mod will default to `Generic interior`.

**TL;DR:** Nothing game-breaking.

### Supported Languages (so far)

- English
- French (thanks **lelimule**)

## Credits

Scripting: **Sosnoviy Bor**  
SFX mixing: **MADpixel**

Samples used:
- Heartthrum SFX by [Fredrik Jonasson](https://fredrikjonasson.net/) and RedFurryDemon
- [Thudding Heartbeat](https://pixabay.com/sound-effects/thudding-heartbeat-372487/) by DRAGON-STUDIO
- [024592_Earthquake remix of Laumark's Freesound #415125](https://pixabay.com/sound-effects/024592-earthquake-remix-of-laumark39s-freesound-415125flac-69744/) by freesound community

[Cover artwork](https://www.deviantart.com/ralyncoyote/art/Heart-of-Lorkhan-911155714) by [ralyncoyote](https://www.deviantart.com/ralyncoyote/gallery)

Inspired by [Heartthrum](https://www.nexusmods.com/morrowind/mods/47178) made by RedFurryDemon and OperatorJack.

## Consider Also

- **[Red Mountain Tremors OpenMW](https://www.nexusmods.com/morrowind/mods/53637)** by [AbbaddoN33](https://next.nexusmods.com/profile/AbbaddoN33?gameId=100) and [Demanufacturer87](https://next.nexusmods.com/profile/Demanufacturer87?gameId=100) - Adds tremors in the Red Mountain and Molag Amur regions.
- **[Dynamic Ambient Visual Effects](https://www.nexusmods.com/morrowind/mods/55572)** by [taitechnic](https://www.nexusmods.com/morrowind/users/201374414) - Adds blight clouds and lightning over Red Mountain, visible at far distance, lightning strikes at Dwemer ruins and many many other things.
