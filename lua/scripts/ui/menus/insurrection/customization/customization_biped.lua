local widget = require "lua.scripts.widget"
local constants = require "lua.scripts.ui.components.constants"
local bar = require "lua.scripts.ui.componentsV3.bar"
local pos = constants.position
local label = require "lua.scripts.ui.componentsV3.label"
local strmem = widget.strmem
local container = require "lua.scripts.ui.componentsV3.container"
local options = require "lua.scripts.ui.componentsV3.options"
local button = require "lua.scripts.ui.componentsV3.button"
local header = require "lua.scripts.ui.componentsV3.header"
local complexButton = require "lua.scripts.ui.componentsV3.complexButton"
local slider = require "lua.scripts.ui.componentsV3.slider"

widget.init [[insurrection/ui/menus/customization_biped/]]


local yPosList = 290
local barSize = 200
local layout = widget.align("horizontal", constants.components.complexButton.normal.width, 57,
                            yPosList, 4)

return container {
    name = "customization_biped_menu",
    background = "fade",
    childs = {
        {
            header {
                name = "customization",
                title = "BIPED CUSTOMIZATION",
                subtitle = "CUSTOMIZE YOUR BIPED APPAREANCE"
            },
            pos.header.x,
            pos.header.y
        },
        {
            label {
                name = "geometry_name",
                text = strmem(32, "GEOMETRY_NAME"),
                variant = "title"
            },
            56,
            yPosList - 26
        },
        {
            label {
                name = "geometry_item_counter",
                text = strmem(8, "00/00"),
                justify = "right",
                variant = "title",
                color = "cobalt",
                width = 854 - 57
            },
            0,
            yPosList - 26
        },
        {
            bar {
                name = "customization_geometry_scroll",
                orientation = "horizontal",
                type = "scroll",
                size = barSize
            },
            (constants.screen.width / 2) - (barSize / 2),
            410
        },
        {
            options {
                name = "customization_geometry_list",
                alignment = "horizontal",
                childs = {
                    {
                        slider {
                            name = "geometry_left",
                            direction = "left"
                        },
                        38,
                        yPosList
                    },
                    {
                        complexButton {
                            name = "geometry_item_1",
                            text = strmem(32, "GEOMETRY 1"),
                            icon = "insurrection/ui/bitmaps/customization_icons.bitmap"
                        },
                        layout()
                    },
                    {
                        complexButton {
                            name = "geometry_item_2",
                            text = strmem(32, "GEOMETRY 2"),
                            icon = "insurrection/ui/bitmaps/customization_icons.bitmap"
                        },
                        layout()
                    },
                    {
                        complexButton {
                            name = "geometry_item_3",
                            text = strmem(32, "GEOMETRY 3"),
                            icon = "insurrection/ui/bitmaps/customization_icons.bitmap"
                        },
                        layout()
                    },
                    {
                        complexButton {
                            name = "geometry_item_4",
                            text = strmem(32, "GEOMETRY 4"),
                            icon = "insurrection/ui/bitmaps/customization_icons.bitmap"
                        },
                        layout()
                    },
                    {
                        complexButton {
                            name = "geometry_item_5",
                            text = strmem(32, "GEOMETRY 5"),
                            icon = "insurrection/ui/bitmaps/customization_icons.bitmap"
                        },
                        layout()
                    },
                    {
                        complexButton {
                            name = "geometry_item_6",
                            text = strmem(32, "GEOMETRY 6"),
                            icon = "insurrection/ui/bitmaps/customization_icons.bitmap"
                        },
                        layout()
                    },
                    {
                        slider {
                            name = "geometry_right",
                            direction = "right",
                            
                        },
                        layout()
                    },
                    {
                        options {
                            name = "customization_geometry_actions",
                            layout = "horizontal",
                            childs = {
                                {
                                    button {
                                        name = "back",
                                        text = "BACK",
                                        variant = "small",
                                        back = true
                                    },
                                    pos.back_left.x,
                                    pos.back_left.y
                                }
                            }
                        }
                    }
                }
            }
        },
        {constants.components.currentProfile.path, pos.nameplate.x, pos.nameplate.y},
        {constants.components.version.path, pos.version.x, pos.version.y}
    }
}
