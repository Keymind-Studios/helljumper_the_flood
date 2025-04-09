local engine = Engine
local balltze = Balltze
local objectTypes = Engine.tag.objectType
local tagClasses = Engine.tag.classes
local getTag = Engine.tag.getTag
local getObject = Engine.gameState.getObject
local getPlayer = Engine.gameState.getPlayer
local findTags = Engine.tag.findTags
local path = require "helljumper.constants.objectPaths"
local blam = require "blam"

local dynamicCrosshair = {}

local floor = math.floor
local ceil = math.ceil

local ma38_weap_tag = getTag(path.weapons.ma38_weap, tagClasses.weapon)
local vk78_weap_tag = getTag(path.weapons.vk78_weap, tagClasses.weapon)
local br65h_weap_tag = getTag(path.weapons.br65h_weap, tagClasses.weapon)

local ma38_hud_tag = getTag(path.weaponHudInterface.ma38_hud, tagClasses.weaponHudInterface)
local vk78_hud_tag = getTag(path.weaponHudInterface.vk78_hud, tagClasses.weaponHudInterface)
local br65h_hud_tag = getTag(path.weaponHudInterface.br65h_hud, tagClasses.weaponHudInterface)

local brHudCross = {
    br65h_zoom_mask_initial_scale = 3,
    br65h_zoom_mask_additional_scale = 0.22,
    br65h_zoom_initial_scale = 0.21,
    br65h_zoom_additional_scale = 0.018
}

local dynamic_crosshairs = true

local weaponHuds = {
    {
        tagName = "br_65h",
        tagPath = getTag(path.weaponHudInterface.br65h_hud, tagClasses.weaponHudInterface)
    }
}

local lastWeaponTagHandle

function dynamicCrosshair.dynamicReticles()
    if dynamic_crosshairs then
        local player = getPlayer()
        if not player then
            return
        end
        local biped = getObject(player.objectHandle, objectTypes.biped)
        if not biped then
            return
        end
        local blamBiped = blam.biped(get_object(player.objectHandle.value))
        assert(blamBiped, "Biped tag must exist")
        -- TODO Ask Mango if "weaponSlot" prop exists in Balltze, to remove blam dependency
        local weaponObject = getObject(biped.weapons[blamBiped.weaponSlot + 1], objectTypes.weapon)
        if not weaponObject then
            return
        end
        local weaponTag = getTag(weaponObject.tagHandle, tagClasses.weapon)
        assert(weaponTag, "Weapon tag must exist")
        if lastWeaponTagHandle ~= weaponTag.handle.value then
            lastWeaponTagHandle = weaponTag.handle.value
            local weaponHudTag = getTag(weaponTag.data.hudInterface.tagHandle,
                                        tagClasses.weaponHudInterface)
            assert(weaponHudTag, "HUD tag must exist")
            for crosshairIndex = 1, weaponHudTag.data.crosshairs.count do
                local crosshair = weaponHudTag.data.crosshairs.elements[1].crosshairOverlays
                                      .elements[crosshairIndex]
                local crosshairBitmapPath = weaponHudTag.data.crosshairs.elements[crosshairIndex]
                                                .crosshairBitmap.path
                local anchorOffsetX = crosshair.anchorOffset.x
                local anchorOffsetY = crosshair.anchorOffset.y
                local widthScale = crosshair.widthScale
                local heightScale = crosshair.heightScale
                local hudInfo = weaponTag.data.hudInterface.tagHandle.id
                logger:debug("HUD Path:   " .. weaponHudTag.path)
                logger:debug("Crosshair Path:   " .. crosshairBitmapPath)
                logger:debug("Width Scale:   " .. widthScale)
                logger:debug("Height Scale:   " .. heightScale)
                logger:debug("Anchor Offset X:   " .. anchorOffsetX)
                logger:debug("Anchor Offset Y:   " .. anchorOffsetY)
                logger:debug("--------------------------------------------------")
            end
        end
    end
end

return dynamicCrosshair
