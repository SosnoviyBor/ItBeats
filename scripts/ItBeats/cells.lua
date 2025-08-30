EXTERIOR = "exterior"
GENERIC_INTERIOR = "generic interior"
DAGOTH_UR = "dagoth ur"
FACILITY_CAVERN = "dagoth ur, facility cavern"
AKULAKHANS_CHAMBER = "akulakhan's chamber"

function GetRMCellType(cell)
    if string.lower(cell.name) == "akulakhan's chamber" then                return AKULAKHANS_CHAMBER
    elseif string.lower(cell.name) == "dagoth ur, facility cavern" then     return FACILITY_CAVERN
    elseif string.find(string.lower(cell.name), "dagoth ur") ~= nil then    return DAGOTH_UR
    elseif cell.isExterior then                                             return EXTERIOR
    elseif not cell.isExterior then                                         return GENERIC_INTERIOR
    end
end