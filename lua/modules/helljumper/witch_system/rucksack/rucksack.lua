local engine = Engine
local balltze = Balltze
local objectTypes = Engine.tag.objectType
local tagClasses = Engine.tag.classes
local getTag = Engine.tag.getTag
local getObject = Engine.gameState.getObject
local getPlayer = Engine.gameState.getPlayer
local state = require "helljumper.witch_system.stateLoader"
local hsc = require "hsc"

hsc.begin_random = function(func)
    func()
end
hsc.print = function(message)
    Engine.core.consolePrint("{}", tostring(message))
end

local rucksack = {}

---@type BalltzeEventListener
local tickEventHandle = nil

-- tickEventHandle = balltze.event.tick.subscribe(function(ev)
--    if ev.time == "before" then
--        -- create here function that only execute in 1 tick
--
--        -- Remove the tick event after creating the weapons so it doesn't run again
--        tickEventHandle:remove()
--    end
-- end)

local weapons = {
    arPath = "keymind\\the_flood\\weapons\\rifle\\assault_rifle\\assault_rifle_ma38",
    brPath = "keymind\\the_flood\\weapons\\rifle\\br65h\\br_65h",
    sawPath = "keymind\\halo_5\\weapons\\rifle\\lmg_saw\\lmg_saw"
}

function rucksack.saveSpecialAmmo()
    local player = getPlayer()
    if player then
        local biped = getObject(player.objectHandle, objectTypes.biped)
        if biped then
            tickEventHandle = balltze.event.tick.subscribe(function(ev)
                if ev.time == "before" then
                    -- create here function that only execute in 1 tick
                    local tagDevicePiercing = getTag("keymind\\helljumper\\objects\\devices\\ammo_crates\\armor_piercing_ammo", tagClasses.deviceControl)
                    local tagDeviceDisruption = getTag("keymind\\helljumper\\objects\\devices\\ammo_crates\\disruption_ammo", tagClasses.deviceControl)
                    local tagDeviceFire = getTag("keymind\\helljumper\\objects\\devices\\ammo_crates\\fire_ammo", tagClasses.deviceControl)
                    if tagDevicePiercing and tagDeviceDisruption and tagDeviceFire then
                        --if state.exists("rucksack.specialAmmo") then
                        --    state.remove("rucksack.specialAmmo")
                        --end
                        --local apAmmoDeviceStatusBefore = 1.0
                        --state.set("rucksack.specialAmmo.piercingAmmo.isActive", apAmmoDeviceStatusBefore)
                        --state.save()
                        local apAmmoDeviceStatusAfter = hsc.device_get_position("ap_ammo")
                        local dAmmoDeviceStatusAfter = hsc.device_get_position("disruption_ammo")
                        local fAmmoDeviceStatusAfter = hsc.device_get_position("fire_ammo")
                        if apAmmoDeviceStatusAfter == 0.0 then
                            local ammoAmountKey = "rucksack.specialAmmo.piercingAmmo.amount"
                            local ammoAmountBefore = state.getInteger(ammoAmountKey)
                            local ammoAmountAdded = 150
                            state.set("rucksack.specialAmmo.piercingAmmo.ammoPath", tagDevicePiercing.path)
                            --state.set("rucksack.specialAmmo.piercingAmmo.isActive", apAmmoDeviceStatusAfter)
                            state.set("rucksack.specialAmmo.piercingAmmo.amount", ammoAmountBefore + ammoAmountAdded)
                            state.set("rucksack.specialAmmo.piercingAmmo.weapons.brPath", weapons.brPath)
                            state.set("rucksack.specialAmmo.piercingAmmo.weapons.arPath", weapons.arPath)
                            state.set("rucksack.specialAmmo.piercingAmmo.weapons.SawPath", weapons.sawPath)
                            state.set("rucksack.specialAmmo.piercingAmmo.isActive", 1.0)
                            hsc.device_set_position("ap_ammo", 1.0)
                            logger:debug("Added 150 Piercing Ammo Saved on Rucksack")
                            logger:debug("Device Get Position:" .. 1.0)
                            state.save()
                        elseif dAmmoDeviceStatusAfter == 0.0 then
                            local dammoAmountKey = "rucksack.specialAmmo.disruptionAmmo.amount"
                            local dammoAmountBefore = state.getInteger(dammoAmountKey)
                            local dammoAmountAdded = 150
                            state.set("rucksack.specialAmmo.disruptionAmmo.ammoPath", tagDeviceDisruption.path)
                            --state.set("rucksack.specialAmmo.disruptionAmmo.isActive", dAmmoDeviceStatusAfter)
                            state.set("rucksack.specialAmmo.disruptionAmmo.amount", dammoAmountBefore + dammoAmountAdded)
                            state.set("rucksack.specialAmmo.disruptionAmmo.weapons.brPath", weapons.brPath)
                            state.set("rucksack.specialAmmo.disruptionAmmo.weapons.arPath", weapons.arPath)
                            state.set("rucksack.specialAmmo.disruptionAmmo.weapons.SawPath", weapons.sawPath)
                            state.set("rucksack.specialAmmo.disruptionAmmo.isActive", 1.0)
                            hsc.device_set_position("disruption_ammo", 1.0)
                            logger:debug("Added 150 Disruption Ammo Saved on Rucksack")
                            logger:debug("Device Get Position:" .. 1.0)
                            state.save()
                        elseif fAmmoDeviceStatusAfter == 0.0 then
                            local fammoAmountKey = "rucksack.specialAmmo.fireAmmo.amount"
                            local fammoAmountBefore = state.getInteger(fammoAmountKey)
                            local fammoAmountAdded = 150
                            state.set("rucksack.specialAmmo.fireAmmo.ammoPath", tagDeviceFire.path)
                            --state.set("rucksack.specialAmmo.fireAmmo.isActive", fAmmoDeviceStatusAfter)
                            state.set("rucksack.specialAmmo.fireAmmo.amount", fammoAmountBefore + fammoAmountAdded)
                            state.set("rucksack.specialAmmo.fireAmmo.weapons.brPath", weapons.brPath)
                            state.set("rucksack.specialAmmo.fireAmmo.weapons.arPath", weapons.arPath)
                            state.set("rucksack.specialAmmo.fireAmmo.weapons.SawPath", weapons.sawPath)
                            state.set("rucksack.specialAmmo.fireAmmo.isActive", 1.0)
                            hsc.device_set_position("fire_ammo", 1.0)
                            logger:debug("Added 150 Fire Ammo Saved on Rucksack")
                            logger:debug("Device Get Position:" .. 1.0)
                            state.save()
                        end
                    end
                    -- Remove the tick event after creating the weapons so it doesn't run again
                    tickEventHandle:remove()
                end
            end)
        end
    end
end

--function rucksack.loadSpecialAmmo()
--    local player = getPlayer()
--    if player then
--        local biped = getObject(player.objectHandle, objectTypes.biped)
--        if biped then
--            for weaponIndex = 1, 4 do
--                local roundsUnloadedKey = "player.weaponInventory." .. weaponIndex .. ".weaponTag.roundsUnloaded"
--                local weaponPathKey = "player.weaponInventory." .. weaponIndex .. ".weaponTag.tagPath"
--                if state.exists(roundsUnloadedKey) and state.exists(weaponPathKey) then
--                    local roundsUnloadedValue = state.getInteger(roundsUnloadedKey)
--                    local weaponPathValue = state.getString(weaponPathKey)
--                    if roundsUnloadedValue and weaponPathValue then
--                        local weaponTag = getTag(weaponPathValue, tagClasses.weapon)
--                        if weaponTag then
--                            local weaponHandle = engine.gameState.createObject(weaponTag.handle,
--                                                                               nil, {
--                                x = 0,
--                                y = 0,
--                                z = 0
--                            })
--                            local weapon = getObject(weaponHandle, objectTypes.weapon)
--                            if weapon then
--                                engine.gameState.unitAddWeaponToInventory(player.objectHandle,
--                                                                          weaponHandle, weaponIndex)
--                                weapon.magazines[1].roundsLoaded = roundsLoadedValue
--                                weapon.magazines[1].roundsUnloaded = roundsUnloadedValue
--                                weapon.age = ageValue
--                            else
--                                error("Failed to create weapon object")
--                            end
--                        end
--                    end
--                end
--            end
--            local ammoAmountKey = "rucksack.specialAmmo.piercingAmmo.amount"
--            if state.exists(ammoAmountKey) then
--                local ammoAmountValue = state.getNumber(ammoAmountKey)
--                if ammoAmountValue then
--                    AmmoAmountBefore = ammoAmountValue
--                end
--            end
--        end
--    end
--end

-- function rucksack.loadWeapon()
--    local player = getPlayer()
--    if player then
--        local biped = getObject(player.objectHandle, objectTypes.biped)
--        if biped then
--            -- Delete the existing weapons
--            for weaponIndex = 1, 4 do
--                if not biped.weapons[weaponIndex]:isNull() then
--                    engine.gameState.deleteObject(biped.weapons[weaponIndex])
--                end
--            end
--
--            -- Create a tick event to create and add the weapons to the player's inventory
--            tickEventHandle = balltze.event.tick.subscribe(function(ev) 
--                if ev.time == "before" then
--                    for weaponIndex = 1, 4 do
--                        local roundsLoadedKey = "player.weaponInventory." .. weaponIndex .. ".weaponTag.roundsLoaded"
--                        local roundsUnloadedKey = "player.weaponInventory." .. weaponIndex .. ".weaponTag.roundsUnloaded"
--                        local ageKey = "player.weaponInventory." .. weaponIndex .. ".weaponTag.energy"
--                        local weaponPathKey = "player.weaponInventory." .. weaponIndex .. ".weaponTag.tagPath"
--                        
--                        if state.exists(roundsLoadedKey) and state.exists(roundsUnloadedKey) and state.exists(ageKey) and state.exists(weaponPathKey) then
--                            local roundsLoadedValue = state.getInteger(roundsLoadedKey)
--                            local roundsUnloadedValue = state.getInteger(roundsUnloadedKey)
--                            local ageValue = state.getNumber(ageKey)
--                            local weaponPathValue = state.getString(weaponPathKey)
--                            if roundsLoadedValue and roundsUnloadedValue and ageValue and weaponPathValue then
--                                local weaponTag = getTag(weaponPathValue, tagClasses.weapon)
--                                if weaponTag then
--                                    local weaponHandle = engine.gameState.createObject(weaponTag.handle, nil, { x = 0, y = 0, z = 0 })
--                                    local weapon = getObject(weaponHandle, objectTypes.weapon)
--                                    if weapon then
--                                        engine.gameState.unitAddWeaponToInventory(player.objectHandle, weaponHandle, weaponIndex)
--                                        weapon.magazines[1].roundsLoaded = roundsLoadedValue
--                                        weapon.magazines[1].roundsUnloaded = roundsUnloadedValue
--                                        weapon.age = ageValue
--                                    else
--                                        error("Failed to create weapon object")
--                                    end
--                                end
--                            end
--                        end
--                    end
--                    -- Remove the tick event after creating the weapons so it doesn't run again
--                    tickEventHandle:remove()
--                end
--            end)
--        end
--    end
-- end

return rucksack
