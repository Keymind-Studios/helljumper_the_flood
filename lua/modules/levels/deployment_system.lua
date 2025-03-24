local balltze = Balltze
local engine = Engine
DebugMode = true
package.preload["luna"] = nil
package.loaded["luna"] = nil
require "luna"
local blam = require "blam"

-- Gameplay Core Modules
local dynamicCross = require "helljumper.gameplay_core.dynamicCross"
local hudExtensions = require "helljumper.gameplay_core.hudExtensions"
local healthRegen = require "helljumper.gameplay_core.healthRegen"
local aimingDownSights = require "helljumper.gameplay_core.aimingDownSights"
local playerPingObjectives = require "helljumper.gameplay_core.playerPingObjectives"
local sprint = require "helljumper.gameplay_core.playerSprint"
local weaponExtensions = require "helljumper.gameplay_core.weaponExtensions"
local deploymentTest = require "helljumper.witch_system.deploymentTest"

dynamicCross.initializeSettings()

-- Functions OnTick
function OnTick()
    dynamicCross.dynamicReticles()
    hudExtensions.radarHideOnZoom()
    hudExtensions.hudBlurOnLowHealth()
    hudExtensions.changeGreandeSound()
    healthRegen.regenerateHealth()
    -- aimingDownSights.customKeys()
    playerPingObjectives.pingObjectives()
    --weaponExtensions.casterFixHeat()
    deploymentTest.eachTick()
end

local onTickEvent = balltze.event.tick.subscribe(function(event)
    if event.time == "before" then
        OnTick()
    end
end)
local onFrameEvent = balltze.event.frame.subscribe(function(event)
    if event.time == "before" then
        OnFrame()
    end
end)
local onRconMessageEvent = balltze.event.rconMessage.subscribe(function(event)
    if event.time == "before" then
        if blam.rcon.handle(event.context:message()) == false then
            event:cancel()
        end
    end
end)

return {
    unload = function()
        onTickEvent:remove()
        onFrameEvent:remove()
        onRconMessageEvent:remove()
    end
}
