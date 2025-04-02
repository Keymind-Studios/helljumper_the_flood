local balltze = Balltze
local engine = Engine
local openWidget = engine.userInterface.openWidget
local playSound = engine.userInterface.playSound
local blam = require "blam"
local core = require "helljumper.core"
local uiWidgetTag = blam.uiWidgetDefinition
local uiWidgetCollection = blam.uiWidgetCollection
local constants = require "helljumper.constants"

local interface = {}
interface.shared = {}

shared = interface.shared


---Play a special interface sound
---@param sound "error" | "success" | "back" | "join" | "leave"
function interface.sound(sound)
    if not (constants.sounds.error and constants.sounds.success and constants.sounds.back and
        constants.sounds.join and constants.sounds.leave) then
        log("Error, no custom sounds found", "error")
        return
    end
    if sound == "error" then
        playSound(constants.sounds.error.id)
    elseif sound == "success" then
        playSound(constants.sounds.success.id)
    elseif sound == "back" then
        playSound(constants.sounds.back.id)
    elseif sound == "join" then
        playSound(constants.sounds.join.id)
    elseif sound == "leave" then
        playSound(constants.sounds.leave.id)
    else
        log("Invalid sound: " .. sound, "error")
    end
end

---Blur UI background
---@param enable boolean
function interface.blur(enable)
    if enable then
        execute_script([[(begin
        (show_hud false)
        (cinematic_screen_effect_start true)
        (cinematic_screen_effect_set_convolution 3 1 1 2 0)
        (cinematic_screen_effect_start false)
    )]])
    else
        execute_script([[(begin
            (show_hud true)
            (cinematic_stop)
        )]])
    end
end

---Close current interface widget
---@param closeAllWidgets boolean
function interface.close(closeAllWidgets)
    if closeAllWidgets then
        while core.getCurrentUIWidgetTag() do
            engine.userInterface.closeWidget()
        end
        return
    end
    engine.userInterface.closeWidget()
    return
end

function interface.changeAspectRatio()
    local widgetTag = core.getCurrentUIWidgetTag()
    if widgetTag then
        if widgetTag.data.bounds.right > 640 then
            -- Change UI aspect ratio
            log("Setting UI aspect ratio to 16:9")
            balltze.features.setUIAspectRatio(16, 9)
        end
        -- Enable menu blur
        execute_script("menu_blur_on")

        -- Set network timeout to 5 seconds (keeps connection alive at loading huge maps)
        -- NOTE! This is meant to help server side loading time, not client side
        execute_script("network_connect_timeout 15000")
    else
        balltze.features.setUIAspectRatio(4, 3)
    end
end

---Fade screen in or out
---@param type "in" | "out"
---@param duration number
function interface.fade(type, duration)
    local type = type == "in" and "in" or "out"
    execute_script("fade_" .. type .. " 0 0 0 " .. duration)
end

return interface
