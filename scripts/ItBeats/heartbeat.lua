local storage = require("openmw.storage")
local ambient = require('openmw.ambient')
local time = require("openmw_aux.time")
local self = require("openmw.self")
require("scripts.ItBeats.cells")

local sectionHeartbeat = storage.playerSection("SettingsItBeats_heartbeat")
local sectionVolume = storage.playerSection("SettingsItBeats_volume")
local sectionDebug = storage.playerSection("SettingsItBeats_debug")

local filePath = "Sound/ItBeats/"
-- placeholder for time when there will be made separate files for each location
-- you can edit it!
local sameFile = "heartbeat.ogg"
local fileDataByCellType = {
    [EXTERIOR] = {
        fileName = sameFile,
        pitch = 1
    },
    [GENERIC_INTERIOR] = {
        fileName = sameFile,
        pitch = 1
    },
    [DAGOTH_UR] = {
        fileName = sameFile,
        pitch = 1
    },
    [FACILITY_CAVERN] = {
        fileName = sameFile,
        pitch = 1
    },
    [AKULAKHANS_CHAMBER] = {
        fileName = sameFile,
        pitch = 1
    },
}

local function getVolume(cellType)
    -- defined in the function so it would actually update with settings changing
    local volumeByCellType = {
        [EXTERIOR] =            sectionVolume:get("exteriorVolume"),
        [GENERIC_INTERIOR] =    sectionVolume:get("genericInteriorVolume"),
        [DAGOTH_UR] =           sectionVolume:get("dagothUrVolume"),
        [FACILITY_CAVERN] =     sectionVolume:get("facilityCavernVolume"),
        [AKULAKHANS_CHAMBER] =  sectionVolume:get("akulakhansChamberVolume"),
    }
    local masterVolume = sectionVolume:get("masterVolume")
    return volumeByCellType[cellType] / 50 * masterVolume / 100
end

local function doHeartbeat()
    local cellType = GetRMCellType(self.cell)
    local volume = getVolume(cellType)
    local fileName = fileDataByCellType[cellType].fileName
    local pitch = fileDataByCellType[cellType].pitch

    ambient.playSoundFile(
        filePath .. fileName, {
            volume = volume,
            pitch = pitch,
        })
end

local function startHeartbeat()
    -- more like "try starting heartbeat"
    if (PlayerState.inRM or sectionDebug:get("ignoreRegionRequirement"))
        and (not PlayerState.heartIsDead or sectionDebug:get("ignoreQuestRequirement"))
    then
        local offset = math.random(0, sectionHeartbeat:get("maxOffset") * 100) / 100
        local callback = time.registerTimerCallback("Heartbeat", doHeartbeat)
        time.newSimulationTimer(offset, callback)
    end
end

time.runRepeatedly(
    startHeartbeat,
    sectionHeartbeat:get("period"),
    { type = time.SimulationTime })
