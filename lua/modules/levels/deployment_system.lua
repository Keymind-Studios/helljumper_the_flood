local balltze = Balltze
local engine = Engine
DebugMode = true
package.preload["luna"] = nil
package.loaded["luna"] = nil
require "luna"

-- Gameplay Core Modules
local dynamicCross = require "helljumper.gameplay_core.dynamicCrosshair"
local hudExtensions = require "helljumper.gameplay_core.hudExtensions"
local healthRegen = require "helljumper.gameplay_core.healthRegen"
local aimingDownSights = require "helljumper.gameplay_core.aimingDownSights"
local playerPingObjectives = require "helljumper.gameplay_core.playerPingObjectives"
-- local sprint = require "helljumper.gameplay_core.playerSprint"
local weaponExtensions = require "helljumper.gameplay_core.weaponExtensions"
local deploymentTest = require "helljumper.witch_system.deploymentTest"


-- Functions OnTick
function OnTick()
    dynamicCross.dynamicReticles()
    hudExtensions.radarHideOnZoom()
    hudExtensions.hudBlurOnLowHealth()
    hudExtensions.changeGreandeSound()
    healthRegen.regenerateHealth()
    -- aimingDownSights.customKeys()
    playerPingObjectives.pingObjectives()
    -- weaponExtensions.casterFixHeat()
    -- deploymentTest.eachTick()
end

local onTickEvent = balltze.event.tick.subscribe(function(event)
    if event.time == "before" then
        OnTick()
    end
end)
local onFrameEvent = balltze.event.frame.subscribe(function(event)
    if event.time == "before" then
    end
end)


return {
    unload = function()
        onTickEvent:remove()
        onFrameEvent:remove()
    end
}
