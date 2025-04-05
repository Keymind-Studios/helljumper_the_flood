local engine = Engine
local balltze = Balltze
local objectTypes = Engine.tag.objectType
local tagClasses = Engine.tag.classes
local getTag = Engine.tag.getTag
local getObject = Engine.gameState.getObject
local getPlayer = Engine.gameState.getPlayer
local state = require "helljumper.witch_system.stateLoader"

local playerState = {}

---@type BalltzeEventListener
local tickEventHandle = nil

function playerState.saveHealth()
    local player = getPlayer()
    if player then
        local biped = getObject(player.objectHandle, objectTypes.biped)
        if biped then
            state.set("player.health", biped.vitals.health)
            state.save()
        end
    end
end

function playerState.loadHealth()
    local player = getPlayer()
    if player then
        local biped = getObject(player.objectHandle, objectTypes.biped)
        if biped then
            local healthKey = "player.health"
            if state.exists(healthKey) then
                local healthValue = state.getNumber(healthKey)
                if healthValue then
                    biped.vitals.health = healthValue
                end
            end
        end
    end
end

function playerState.saveGrenades()
    local player = getPlayer()
    if player then
        local biped = getObject(player.objectHandle, objectTypes.biped)
        if biped then
            if state.exists("player.grenades") then
                state.remove("player.grenades")
            end
            state.set("player.grenades.frag", biped.grenadeCounts[1])
            state.set("player.grenades.plasma", biped.grenadeCounts[2])
            state.save()
        end
    end
end

function playerState.loadGrenades()
    local player = getPlayer()
    if player then
        local biped = getObject(player.objectHandle, objectTypes.biped)
        if biped then
            local gFragKey = "player.grenades.frag"
            local gPlasmaKey = "player.grenades.plasma"
            if state.exists(gFragKey) and state.exists(gPlasmaKey) then
                local gFragvalue = state.getInteger(gFragKey)
                local gPlasmaValue = state.getInteger(gPlasmaKey)
                if gFragvalue and gPlasmaValue then
                    biped.grenadeCounts[1] = gFragvalue
                    biped.grenadeCounts[2] = gPlasmaValue
                end
            end
        end
    end
end



function playerState.saveWeapon()
    local player = getPlayer()
    if player then
        local biped = getObject(player.objectHandle, objectTypes.biped)
        if biped then
            if state.exists("player.weaponInventory") then
                state.remove("player.weaponInventory")
            end
            for weaponIndex = 1, 4 do
                local weapon = getObject(biped.weapons[weaponIndex], objectTypes.weapon)
                if weapon then
                    local tag = getTag(weapon.tagHandle, tagClasses.weapon)
                    if tag then
                        local tagPath = tag.path
                        state.set("player.weaponInventory." .. weaponIndex .. ".weaponTag.roundsLoaded", weapon.magazines[1].roundsLoaded)
                        state.set("player.weaponInventory." .. weaponIndex .. ".weaponTag.roundsUnloaded", weapon.magazines[1].roundsUnloaded)
                        state.set("player.weaponInventory." .. weaponIndex .. ".weaponTag.energy", weapon.age)
                        state.set("player.weaponInventory." .. weaponIndex .. ".weaponTag.tagPath", tagPath)
                    end
                end
            end
            state.save()
        end
    end
end

function playerState.loadWeapon()
    local player = getPlayer()
    if player then
        local biped = getObject(player.objectHandle, objectTypes.biped)
        if biped then
            -- Delete the existing weapons
            for weaponIndex = 1, 4 do
                if not biped.weapons[weaponIndex]:isNull() then
                    engine.gameState.deleteObject(biped.weapons[weaponIndex])
                end
            end

            -- Create a tick event to create and add the weapons to the player's inventory
            tickEventHandle = balltze.event.tick.subscribe(function(ev) 
                if ev.time == "before" then
                    for weaponIndex = 1, 4 do
                        local roundsLoadedKey = "player.weaponInventory." .. weaponIndex .. ".weaponTag.roundsLoaded"
                        local roundsUnloadedKey = "player.weaponInventory." .. weaponIndex .. ".weaponTag.roundsUnloaded"
                        local ageKey = "player.weaponInventory." .. weaponIndex .. ".weaponTag.energy"
                        local weaponPathKey = "player.weaponInventory." .. weaponIndex .. ".weaponTag.tagPath"
                        
                        if state.exists(roundsLoadedKey) and state.exists(roundsUnloadedKey) and state.exists(ageKey) and state.exists(weaponPathKey) then
                            local roundsLoadedValue = state.getInteger(roundsLoadedKey)
                            local roundsUnloadedValue = state.getInteger(roundsUnloadedKey)
                            local ageValue = state.getNumber(ageKey)
                            local weaponPathValue = state.getString(weaponPathKey)
                            if roundsLoadedValue and roundsUnloadedValue and ageValue and weaponPathValue then
                                local weaponTag = getTag(weaponPathValue, tagClasses.weapon)
                                if weaponTag then
                                    local weaponHandle = engine.gameState.createObject(weaponTag.handle, nil, { x = 0, y = 0, z = 0 })
                                    local weapon = getObject(weaponHandle, objectTypes.weapon)
                                    if weapon then
                                        engine.gameState.unitAddWeaponToInventory(player.objectHandle, weaponHandle, 0)
                                        weapon.magazines[1].roundsLoaded = roundsLoadedValue
                                        weapon.magazines[1].roundsUnloaded = roundsUnloadedValue
                                        weapon.age = ageValue
                                    else
                                        error("Failed to create weapon object")
                                    end
                                end
                            end
                        end
                    end

                    -- Remove the tick event after creating the weapons so it doesn't run again
                    tickEventHandle:remove()
                end
            end)
        end
    end
end

return playerState
