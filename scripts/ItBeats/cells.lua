local storage = require("openmw.storage")

local sectionVolume = storage.playerSection("SettingsItBeats_volume")

EXTERIOR = "exterior"
GENERIC_INTERIOR = "generic interior"
DAGOTH_UR = "dagoth ur"
FACILITY_CAVERN = "dagoth ur, facility cavern"
AKULAKHANS_CHAMBER = "akulakhan's chamber"

local function getRMCellType(cell)
    if string.lower(cell.name) == "akulakhan's chamber" then                return AKULAKHANS_CHAMBER
    elseif string.lower(cell.name) == "dagoth ur, facility cavern" then     return FACILITY_CAVERN
    elseif string.find(string.lower(cell.name), "dagoth ur") ~= nil then    return DAGOTH_UR
    elseif cell.isExterior then                                             return EXTERIOR
    elseif not cell.isExterior then                                         return GENERIC_INTERIOR
    end
end

function GetVolume(cell)
    local volumeTable = {
        [EXTERIOR] =              sectionVolume:get("exteriorVolume"),
        [GENERIC_INTERIOR] =      sectionVolume:get("genericInteriorVolume"),
        [DAGOTH_UR] =             sectionVolume:get("dagothUrVolume"),
        [FACILITY_CAVERN] =       sectionVolume:get("facilityCavernVolume"),
        [AKULAKHANS_CHAMBER] =    sectionVolume:get("akulakhansChamberVolume"),
    }
    local masterVolume = sectionVolume:get("masterVolume")
    local cellType = getRMCellType(cell)
    return volumeTable[cellType] / 50 * masterVolume / 100
end