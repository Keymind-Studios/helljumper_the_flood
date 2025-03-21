-- Lua libraries
local const = require "helljumper.constants"
local core = require "helljumper.core"
local network = require "helljumper.network"
local engine = Engine
local balltze = Balltze
local blam = require "blam"

local playerPingObjectives = {}

blam.rcon.event("CreateWaypoint", function(message, playerIndex)
    if blam.isGameSAPP() then
        local senderPlayer = blam.player(get_player(playerIndex))
        if senderPlayer then
            for i = 1, 16 do
                local player = blam.player(get_player(i))
                if player then
                    if player.team == senderPlayer.team then
                        blam.rcon.dispatch("CreateWaypoint", message, i)
                    end
                end
            end
        end
    else
        local x, y, z, type = network.parseWaypoint(message)
        core.createWaypoint(x, y, z, type)
    end
end)

---@type number?
local raycastId
local canCreateNewObjective = true
local keyboard_input_address = 0x64C550

function playerPingObjectives.pingObjectives()
    if blam.isGameSAPP() then
        error("This function is not meant to be used on the server")
    end
    if not canCreateNewObjective then
        return
    end
    local player = blam.biped(get_dynamic_player())
    if not player then
        return
    end
    local cKeyPressed = read_byte(keyboard_input_address + 60)
    if blam.isNull(player.vehicleObjectId) then
        if not raycastId then
            local isPlayerOnMenu = read_byte(blam.addressList.gameOnMenus) == 1
            if cKeyPressed > 0 and isPlayerOnMenu then
                local rayX, rayY, rayZ = core.calculateRaycast(player)
                local raycastTagId = const.projectiles.raycastTag.id
                --raycastTagId = blam.findTag("plasma_grenade", tagClasses.projectile).id
                raycastId = spawn_object(raycastTagId, rayX, rayY, rayZ)
                local ray = blam.projectile(get_object(raycastId))
                if ray then
                    ray.xVel = player.cameraX * const.raycastOffset * const.raycastVelocity
                    ray.yVel = player.cameraY * const.raycastOffset * const.raycastVelocity
                    ray.zVel = player.cameraZ * const.raycastOffset * const.raycastVelocity
                    ray.yaw = player.cameraX * const.raycastOffset
                    ray.pitch = player.cameraY * const.raycastOffset
                    ray.roll = player.cameraZ * const.raycastOffset
                end
            end
            return
        end

        local ray = blam.projectile(get_object(raycastId))
        if not ray then
            raycastId = nil
            return
        end
        -- Play the ping sound
        engine.userInterface.playSound(const.sounds.uiFGrenadePath.id)

        -- Lock the player from creating new objectives
        canCreateNewObjective = false
        local timer
        AllowCreateNewObjective = function()
            canCreateNewObjective = true
            timer.stop()
        end
        timer = balltze.misc.setTimer(4300, AllowCreateNewObjective)

        -- Create the waypoint
        local type = "objective"
        local x = ray.x
        local y = ray.y
        local z = ray.z
        local attachedToId = ray.attachedToObjectId
        if not blam.isNull(attachedToId) then
            local object = blam.object(get_object(attachedToId))
            if object then
                x = x + object.x
                y = y + object.y
                z = z + object.z + 0.45
                if object.class == objectClasses.weapon then
                    type = "weapon"
                end
                if object.class == objectClasses.vehicle then
                    type = "vehicle"
                end
                if object.class == objectClasses.biped then
                    type = "biped"
                end
            end
        end
        blam.rcon.dispatch("CreateWaypoint", network.genWaypoint(x, y, z, type))
    end
end

return playerPingObjectives