local engine = Engine
local balltze = Balltze
local objectTypes = Engine.tag.objectType
local tagClasses = Engine.tag.classes
local getTag = Engine.tag.getTag
local getObject = Engine.gameState.getObject
local getPlayer = Engine.gameState.getPlayer
local state = require "helljumper.witch_system.stateLoader"

local playerState = {}

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
            local grenade1Key = "player.grenades.frag"
            local grenade2Key = "player.grenades.plasma"
            if state.exists(grenade1Key) and state.exists(grenade2Key) then
                local grenade1value = state.getInteger(grenade1Key)
                local grenade2Value = state.getInteger(grenade2Key)
                if grenade1value and grenade2Value then
                    biped.grenadeCounts[1] = grenade1value
                    biped.grenadeCounts[2] = grenade2Value
                end
            end
        end
    end
end

function playerState.saveAmmo()
    local player = getPlayer()
    if player then
        local biped = getObject(player.objectHandle, objectTypes.biped)
        if biped then
            if state.exists("player.weaponState") then
                state.remove("player.weaponState")
            end
            for weaponIndex = 1, 4 do
                local weapon = getObject(biped.weapons[weaponIndex], objectTypes.weapon)
                if weapon then
                    local tag = getTag(weapon.tagHandle, tagClasses.weapon)
                    if tag then
                        local tagPath = tag.path
                        state.set("player.weaponState." .. tagPath .. ".roundsLoaded", weapon.magazines[1].roundsLoaded)
                        state.set("player.weaponState." .. tagPath .. ".roundsUnloaded", weapon.magazines[1].roundsUnloaded)
                        state.set("player.weaponState." .. tagPath .. ".energy", weapon.age)
                    end
                end
            end
            state.save()
        end
    end
end

function playerState.loadAmmo()
    local player = getPlayer()
    if player then
        local biped = getObject(player.objectHandle, objectTypes.biped)
        if biped then
            for weaponIndex = 1, 4 do
                local weapon = getObject(biped.weapons[weaponIndex], objectTypes.weapon)
                if weapon then
                    local tag = getTag(weapon.tagHandle, tagClasses.weapon)
                    if tag then
                        local tagPath = tag.path
                        local roundsLoadedKey = "player.weaponState." .. tagPath .. ".roundsLoaded"
                        local roundsUnloadedKey = "player.weaponState." .. tagPath .. ".roundsUnloaded"
                        local ageKey = "player.weaponState." .. tagPath .. ".energy"
                        if state.exists(roundsLoadedKey) and state.exists(roundsUnloadedKey) and
                            state.exists(ageKey) then
                            local roundsLoadedValue = state.getInteger(roundsLoadedKey)
                            local roundsUnloadedValue = state.getInteger(roundsUnloadedKey)
                            local ageValue = state.getNumber(ageKey)
                            if roundsLoadedValue and roundsUnloadedValue and ageValue then
                                weapon.magazines[1].roundsLoaded = roundsLoadedValue
                                weapon.magazines[1].roundsUnloaded = roundsUnloadedValue
                                weapon.age = ageValue
                            end
                        end
                    end
                end
            end
        end
    end
end

return playerState
