DebugMode = true
local balltze = Balltze
local engine = Engine
local blam = require "blam"
local hsc = require "hsc"
local inspect = require "inspect"

local deploymentTest = {}

function deploymentTest.eachTick()
    --console_out("Script is up n' runnin!")
    local player = blam.biped(get_dynamic_player()) -- Defines current player.
    if player.crouchHold then
        if player.meleeKey then
            deploymentTest.squadAssambler()
        end
    end
end

function deploymentTest.squadAssambler()
    --local scenarioTagHandle = engine.tag.getTag(0, engine.tag.classes.scenario) -- Gets the first (and only) .scenario tag from the map
    --assert(scenarioTagHandle, "pigPen: Failed to get scenario tag handle.") -- Assert handle is not nil (or false)
    local actorVariantTags = engine.tag.findTags("elite", engine.tag.classes.actorVariant)
    local actorVariantPath = table.map(actorVariantTags, function (v, k)
        return v.path
    end)
    --logger:debug("Actor Variants: {}", tostring(inspect(actorVariantPath)))
    console_out("Attempted to execute squadAssambler...")
end

return deploymentTest