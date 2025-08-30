local types = require("openmw.types")
local time = require("openmw_aux.time")
local self = require("openmw.self")
local core = require("openmw.core")
require("scripts.ItBeats.heartbeat")
require("scripts.ItBeats.cellBlacklist")

-- mod state
InRM = false
HeartIsDead = types.Player.quests(self)["C3_DestroyDagoth"].stage >= 20

local function updateCurrentRegion()
    local cell = self.cell
    -- in case you have a player home with teleports, for example
    if BlacklistedInteriors[string.lower(cell.name)] then return end

    if cell.isExterior then
        InRM = cell.region == "red mountain region"
    else
        core.sendGlobalEvent("isCellInRM", cell.id)
    end
end

local function onQuestUpdate(questId, stage)
    -- disable heartbeat after the Heart of Lorkhan is killed
    if questId == "C3_DestroyDagoth" and stage == 20 then
        HeartIsDead = true
    end
end

local function updateInRM(status)
    InRM = status
end

time.runRepeatedly(updateCurrentRegion, 1 * time.second, { type = time.SimulationTime })

return {
    engineHandlers = {
        onQuestUpdate = onQuestUpdate
    },
    eventHandlers = {
        updateInRM = updateInRM
    }
}
