local engine = Engine
local balltze = Balltze
local objectTypes = Engine.tag.objectType
local tagClasses = Engine.tag.classes
local getTag = Engine.tag.getTag
local getObject = Engine.gameState.getObject
local getPlayer = Engine.gameState.getPlayer

local weaponExtensions = {}

function weaponExtensions.casterFixHeat()
    --for playerIndex = 0,15 do
        local player = getPlayer()
        if player then
            local biped = getObject(player.objectHandle, engine.tag.objectType.biped)
            if biped then
                for weaponIndex = 1,4 do
                    Weapon = getObject(biped.weapons[weaponIndex], engine.tag.objectType.weapon)
                    if Weapon then
                        --if weaponIndex == 1 then
                        --Weapon.magazines[1].roundsLoaded = 30
                        --Weapon.magazines[1].roundsUnloaded = 72
                        logger:debug("Weapon: {} Ammo: {} ReserveAmmo: {}", weaponIndex, Weapon.magazines[1].roundsLoaded, Weapon.magazines[1].roundsUnloaded)
                        --end
                    end
                end
            end
        end
    --end
end

--local Weapon = {}
--
--local weaponAmmoTable = {
--    weaponAmmo1 = {
--        loadedAmmo = Weapon.magazines[1].roundsLoaded,
--        reserveAmmo = Weapon.magazines[1].roundsUnloaded
--    }
--}

local dir_path = "lua/modules/helljumper/gameplay_core" -- Ruta donde se quiere guardar el archivo
local file_name = "weaponAmmoState" -- Nombre que tendrá el archivo (sin la extensión .json)







return weaponExtensions