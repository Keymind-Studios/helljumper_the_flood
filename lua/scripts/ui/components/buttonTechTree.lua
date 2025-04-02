local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.components.image"
local floor = math.floor

---@class buttonTechTreeProps
---@field name string
---@field text? string
---@field justification? "left_justify" | "center_justify" | "right_justify"
---@field variant "simple" | "upgrade"
---@field childs? invaderWidgetChildWidget[]

---Generic table button for table usage
---@param props buttonTechTreeProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local variant = props.variant or "simple"
    local justification = props.justification or "center_justify"
    local widgetPath = widget.path .. "buttons/" .. name .. "_tech_tree_button.ui_widget_definition"
    
    local size = {
        width = 246,
        height = 216,
        scale = 0.25
    }

    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = widget.path .. "strings/" .. name .. "_tech_tree_button.unicode_string_list"
        ustr(stringsTagPath, {text})
    end


    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = widget.scale(size.width, size.height, size.scale),
        background_bitmap = [[keymind/helljumper/ui/bitmaps/tech_tree_simple_button.bitmap]],
        flags = {pass_unhandled_events_to_focused_child = true},
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = constants.fonts.title,
        text_color = constants.color.text,
        justification = justification,
        horiz_offset = 292 + 27,
        vert_offset = 98 + 10,
    }
    if variant == "upgrade" then
        wid.background_bitmap = [[keymind/helljumper/ui/bitmaps/tech_tree_upgrade_button.bitmap]]
    end

    widget.createV2(widgetPath, wid)
    return widgetPath
end
