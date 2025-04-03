local balltze = Balltze
local engine = Engine

local menus = {}

--- Get the tag widget of the current ui open in the game
function menus.getCurrentUIWidgetTag()
    -- local widgetTagId = core.getRenderedUIWidgetTagId()
    local widget = engine.userInterface.getRootWidget()
    if widget then
        local tag = engine.tag.getTag(widget.definitionTagHandle.value, engine.tag.classes.uiWidgetDefinition)
        assert(tag, "No tag found for widget")
        -- TODO BALLTZE MIGRATE
        return {
            data = tag.data,
            id = widget.definitionTagHandle.value,
            tagPath = tag.path,
            tagClass = tag.primaryClass,
            index = tag.handle.index
        }
    end
    return nil
end

return menus

