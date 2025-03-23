DebugMode = true
local balltze = Balltze
local engine = Engine
local blam = require "blam"
local hsc = require "hsc"

local deploymentTest = {}

function deploymentTest.eachTick()
    --console_out("Script is up n' runnin!")
    deploymentTest.squadAssambler()
end

function deploymentTest.squadAssambler()
    local player = blam.biped(get_dynamic_player())
    local currentStep = 0
    
    player.invisible = true
    if player.crouchHold then
        if player.meleeKey then
            currentStep = currentStep + 1
            console_out(currentStep)
        end
    end
end

return deploymentTest