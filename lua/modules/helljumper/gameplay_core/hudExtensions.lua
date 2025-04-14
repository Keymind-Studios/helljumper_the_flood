-- Lua libraries
local engine = Engine
local balltze = Balltze
local objectTypes = Engine.tag.objectType
local getObject = Engine.gameState.getObject
local getPlayer = Engine.gameState.getPlayer
local playSound = engine.userInterface.playSound
-- local read_byte = balltze.memory.readByte
local blam = require "blam"
local path = require "helljumper.constants.objectPaths"

local hudExtensions = {state = {playerCriticalHealth = false}}

function hudExtensions.radarHideOnZoom()
    local player = getPlayer()
    if not player then
        return
    end
    local biped = getObject(player.objectHandle, objectTypes.biped)
    if not biped then
        return
    end
    local levelZoom1 = biped.desiredZoomLevel == 0
    local levelZoom2 = biped.desiredZoomLevel == 1
    if levelZoom1 or levelZoom2 then
        execute_script("hud_show_motion_sensor 0")
    else
        execute_script("hud_show_motion_sensor 1")
    end
end

-- PlaySound
---@param tagPath any
---@param gain number
function hudExtensions.playSound(tagPath, gain)
    local player = getPlayer()
    if not player then
        return
    end
    local playSoundCommand = path.hsc.playSound:format(tagPath, player.index, gain or 1.0)
    execute_script(playSoundCommand)
end

function hudExtensions.changeGrenadeSound()
    local player = getPlayer()
    if not player then
        return
    end
    local biped = getObject(player.objectHandle, objectTypes.biped)
    if not biped then
        return
    end
    -- TODO check if gameOnMenus function are on Balltze
    local isPlayerOnMenu = read_byte(blam.addressList.gameOnMenus) == 0
    if not isPlayerOnMenu then
        return
    end
    local currentGrenadeType = biped.currentGrenadeIndex
    local lastGrenadeType
    if not lastGrenadeType then
        lastGrenadeType = currentGrenadeType
    end
    if lastGrenadeType ~= biped.nextGrenadeIndex then
        lastGrenadeType = biped.nextGrenadeIndex
        if currentGrenadeType == 1 then
            playSound(path.uiSoundFx.plasma_selected)
        else
            playSound(path.uiSoundFx.frag_selected)
        end
    end
    -- logger:debug("Current Grenade Type:  {}  ", lastGrenadeType)
end

-- TODO blur 
function hudExtensions.hudBlurOnLowHealth()
    local player = getPlayer()
    if not player then
        return
    end
    local biped = getObject(player.objectHandle, objectTypes.biped)
    if not biped then
        return
    end
    local lowHealth = biped.vitals.health
    local noShield = biped.vitals.shield
    local isOnVehicle = biped.vehicleSeatId
    if lowHealth <= 0.4 and noShield  <= 0 then
    hudExtensions.hudBlur(true, true)
    end
    --    if not hudExtensions.state.playerCriticalHealth then
    --        hudExtensions.state.playerCriticalHealth = true
    --        hudExtensions.hudBlur(true)
    --    end
    --else
    --    if hudExtensions.state.playerCriticalHealth then
    --        hudExtensions.hudBlur(false)
    --    end
    --    hudExtensions.state.playerCriticalHealth = false
    --end
    --if hudExtensions.state.playerCriticalHealth then
    --    hudExtensions.hudBlur(false, true)
    --    hudExtensions.state.playerCriticalHealth = false
    --end
end

-- HudBlurFX
---@param enableBlur boolean
---@param immediate any
function hudExtensions.hudBlur(enableBlur, immediate)
    if enableBlur then
        execute_script([[(begin
                            (cinematic_screen_effect_start true)
                            (cinematic_screen_effect_set_convolution 2 1 1 1 5)
                            (cinematic_screen_effect_start false)
                        )]])
        return true
    end
    if not enableBlur and immediate then
        execute_script([[(begin
                        (cinematic_screen_effect_set_convolution 2 1 1 0 1)
                        (cinematic_screen_effect_start false)
                        (cinematic_stop)
                    )]])
        return false
    end
    execute_script([[(begin
                        (cinematic_screen_effect_set_convolution 2 1 1 0 1)
                        (cinematic_screen_effect_start false)
                        (sleep 45)
                        (cinematic_stop)
                    )]])
    return false
end

return hudExtensions
