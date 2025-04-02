local widget = require "lua.scripts.widget"
local strmem = widget.strmem
local constants = require "lua.scripts.ui.components.constants"
local pos = constants.position
local footer = require "lua.scripts.ui.components.footer"
local header = require "lua.scripts.ui.components.header"
local label = require "lua.scripts.ui.components.label"
local container = require "lua.scripts.ui.components.container"
local options = require "lua.scripts.ui.components.options"
local image = require "lua.scripts.ui.components.image"
local buttonTechTree = require "lua.scripts.ui.components.buttonTechTree"

widget.init "keymind/helljumper/ui/menus/tech_tree/"

return container {
    name = "tech_tree_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "tech_tree",
                title = strmem(256, "TECH TREE"),
                -- subtitle = "PLAY ONLINE WITH FRIENDS IN DIFFRENT GAME MODES"
            },
            pos.header.x,
            pos.header.y
        },
        {
            label {
                name = "tech_points",
                text = strmem(256, "TECH POINTS"),
                variant = "button",
            },
            pos.header.x,
            60
        },
        {
            image {
                name = "tech_points_icon",
                width = 107,
                height = 97,
                image = [[keymind/helljumper/ui/bitmaps/icons/tech_points.bitmap]],
                scale = 0.25
            },
            pos.header.x,
            150
        }
    }
}
