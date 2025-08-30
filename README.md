# It Beats (OpenMW)

Feel the heartbeat of the Red Mountain.

For MWSE aternative, check out [Heartthrum](https://www.nexusmods.com/morrowind/mods/47178) by [RedFurryDemon](https://next.nexusmods.com/profile/RedFurryDemon/mods?gameId=100).

## Features

### Audible Red Mountain Heartbeat

Whenever you’re in the Red Mountain region (effectively, inside the Ghostfence), you’ll hear Lorkhan’s heartbeat - distant, yet disturbing...

### And It Gets Louder

The closer you get to the Heart, the louder the heartbeat becomes.  
The mod differentiates **five** separate player locations:

1. Akulakhan’s Chamber
2. Dagoth Ur, Facility Cavern (the room where you meet Dagoth Ur for the first time)
3. The rest of Dagoth Ur (the citadel)
4. All other interiors in the region
5. The region’s exterior

All these locations have separate volume configs and can be assigned different SFX (which might be used in the future).

<a id="custom_cell_blacklist"></a>

### Custom Cell Blacklist

Since the mod assumes an interior is in the Red Mountain region by checking all doors that lead to exteriors, it might conflict with certain player homes or similar mods that add teleports to the Red Mountain region.  
To address this, there’s a file in `scripts\ItBeats` called `cellBlacklist.lua`.

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

You can also message me or make a PR to the [GitHub repo](https://github.com/SosnoviyBor/ItBeats) to add support for such mods (even if you’re not the mod’s author).  
If you decide to message me, please prepare a list of cells to add so I don’t accidentally miss anything.

## Requirements

OpenMW, duh.

## Installation

Install like any other OpenMW mod.

## Compatibility

The mod might add SFX to interiors leading to the Red Mountain region that aren’t actually there.  
Check the [Custom Cell Blacklist section](#custom_cell_blacklist) for details.

Otherwise, the mod should be compatible with anything.

## Special Thanks

**[RedFurryDemon](https://next.nexusmods.com/profile/RedFurryDemon/mods?gameId=100)** and everyone else who worked on the [Heartthrum](https://www.nexusmods.com/morrowind/mods/47178) mod - clear inspiration for this project.

## Consider Also

- **[Red Mountain Tremors OpenMW](https://www.nexusmods.com/morrowind/mods/53637)** by [AbbaddoN33](https://next.nexusmods.com/profile/AbbaddoN33?gameId=100) and [Demanufacturer87](https://next.nexusmods.com/profile/Demanufacturer87?gameId=100) - Adds tremors in the Red Mountain and Molag Amur regions.
