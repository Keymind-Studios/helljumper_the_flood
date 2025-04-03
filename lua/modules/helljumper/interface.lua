local balltze = Balltze
local engine = Engine
local menus = require "helljumper.menus"

local interface = {}

---Close current interface widget
---@param closeAllWidgets boolean
function interface.close(closeAllWidgets)
    if closeAllWidgets then
        while menus.getCurrentUIWidgetTag() do
            engine.userInterface.closeWidget()
        end
        return
    end
    engine.userInterface.closeWidget()
end

---Set aspect ratio 16:9 on widgets > 640 bounds
function interface.changeAspectRatio()
    local widgetTag = menus.getCurrentUIWidgetTag()
    if widgetTag then
        if widgetTag.data.bounds.right > 640 then
            -- Change UI aspect ratio
            --logger:info("Setting UI aspect ratio to 16:9")
            balltze.features.setUIAspectRatio(16, 9)
        end
        -- Enable menu blur
        --interface.blur(true)
        execute_script("menu_blur_on")
        -- Set network timeout to 5 seconds (keeps connection alive at loading huge maps)
        -- NOTE! This is meant to help server side loading time, not client side
        execute_script("network_connect_timeout 15000")
    else
        balltze.features.setUIAspectRatio(4, 3)
        interface.blur(false)
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


return interface
