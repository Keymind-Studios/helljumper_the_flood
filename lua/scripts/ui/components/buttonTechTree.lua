local widget = require "lua.scripts.widget"
local ustr = require "lua.scripts.modules.ustr"
local constants = require "lua.scripts.ui.components.constants"
local image = require "lua.scripts.ui.components.image"
local floor = math.floor

---@class buttonTechTreeProps
---@field name string
---@field text? string
---@field back? boolean
---@field opens? string
---@field script? string
---@field branch? boolean
---@field func? string | string[]
---@field select? boolean
---@field close? boolean
---@field justification? "left_justify" | "center_justify" | "right_justify"
---@field variant? "simple" | "upgrade" | "tab"
---@field childs? invaderWidgetChildWidget[]

---Generic table button for table usage
---@param props buttonTechTreeProps
---@return string
return function(props)
    local name = props.name
    local text = props.text
    local variant = props.variant or "simple"
    local justification = props.justification or "center_justify"
    local childWidgets = props[1] or props.childs
    local widgetPath = widget.path .. "buttons/" .. name .. "_button.ui_widget_definition"

    local size = {width = 60, height = 53, scale = 1}
    local sizeTab = {width = 177, height = 30, scale = 1}

    local stringsTagPath
    if text then
        -- Generate strings tag
        stringsTagPath = widget.path .. "strings/" .. name ..
                             "_button.unicode_string_list"
        ustr(stringsTagPath, {text})
    end

    ---@type invaderWidget
    local wid = {
        widget_type = "text_box",
        bounds = widget.scale(size.width, size.height, size.scale),
        background_bitmap = [[keymind/helljumper/ui/bitmaps/tech_tree_simple_button_25.bitmap]],
        flags = {pass_unhandled_events_to_focused_child = true},
        event_handlers = {
            {
                flags = {
                    open_widget = props.opens ~= nil,
                    run_function = props.func ~= nil,
                    go_back_to_previous_widget = props.back or false,
                    try_to_branch_on_failure = props.branch or false,
                    close_all_widgets = props.close or false
                },
                event_type = "a_button",
                widget_tag = props.opens,
                script = props.script
            }
        },
        text_label_unicode_strings_list = stringsTagPath,
        string_list_index = 0,
        text_font = constants.fonts.button,
        text_color = constants.color.text,
        justification = props.justification or "left_justify",
        horiz_offset = 10,
        vert_offset = 10,
        child_widgets = childWidgets or {}
    }
    if variant == "upgrade" then
        wid.background_bitmap = [[keymind/helljumper/ui/bitmaps/tech_tree_upgrade_button_25.bitmap]]
        wid.text_font = constants.fonts.shadow
        wid.text_color = constants.color.title
    elseif variant == "tab" then
        wid.background_bitmap = [[keymind/helljumper/ui/bitmaps/tech_tree_tab_button.bitmap]]
        wid.bounds = widget.scale(sizeTab.width, sizeTab.height, sizeTab.scale)
        wid.text_font = constants.fonts.title
    end

    if props.func then
        -- We want to run multiple functions on the same button
        if type(props.func) == "table" then
            -- Replace first function with the first function from props
            wid.event_handlers[1]["function"] = props.func[1]
            table.remove(props.func --[[@as table]] , 1)
            for i, func in ipairs(props.func --[=[@as string[]]=] ) do
                wid.event_handlers[#wid.event_handlers + 1] = {
                    flags = {run_function = true},
                    ["function"] = func,
                    event_type = "a_button"
                }
            end
        elseif type(props.func) == "string" then
            wid.event_handlers[1]["function"] = props.func --[[@as string]]
        end
    end
    -- Add mouse event handler
    wid.event_handlers[#wid.event_handlers + 1] = {
        flags = {run_function = true},
        event_type = "left_mouse",
        ["function"] = "mouse_emit_accept_event"
    }

    widget.createV2(widgetPath, wid)
    return widgetPath
end
