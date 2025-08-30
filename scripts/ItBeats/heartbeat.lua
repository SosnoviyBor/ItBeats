local storage = require("openmw.storage")
local ambient = require('openmw.ambient')
local time = require("openmw_aux.time")
local self = require("openmw.self")
require("scripts.ItBeats.cells")

local sectionHeartbeat = storage.playerSection("SettingsItBeats_heartbeat")
local sectionDebug = storage.playerSection("SettingsItBeats_debug")

local fileName = "Heartbeat.mp3"
local pitch = 1

local function doHeartbeat()
    local volume = GetVolume(self.cell)
    ambient.playSoundFile(
        "Sound/ItBeats/" .. fileName, {
            volume = volume,
            pitch = pitch,
        })
end

local function startHeartbeat()
    if (InRM or sectionDebug:get("ignoreRegionRequirement"))
        and (not HeartIsDead or sectionDebug:get("ignoreQuestRequirement"))
    then
        local offset = math.random(0, sectionHeartbeat:get("maxOffset") * 100) / 100
        time.newSimulationTimer(
            offset, time.registerTimerCallback("Heartbeat", doHeartbeat))
    end
end

time.runRepeatedly(
    startHeartbeat,
    sectionHeartbeat:get("period"),
    { type = time.SimulationTime })
