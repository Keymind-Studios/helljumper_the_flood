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
local bar = require "lua.scripts.ui.components.bar"

widget.init "keymind/helljumper/ui/menus/tech_tree/"

local tabLayout = widget.layout {alignment = "horizontal", size = 177, x = 20, y = 120, margin = 3}
local upgradeLayoutI = widget.layout {
    alignment = "vertical",
    size = 246,
    x = 20,
    y = 173,
    margin = -186
}
local upgradeLayoutII = widget.layout {
    alignment = "vertical",
    size = 246,
    x = 85,
    y = 173,
    margin = -186
}
local upgradeLayoutIII = widget.layout {
    alignment = "vertical",
    size = 246,
    x = 170,
    y = 173,
    margin = -186
}

return container {
    name = "tech_tree_menu",
    background = "transparent",
    childs = {
        {
            header {
                name = "tech_tree",
                title = strmem(256, "TECH TREE"),
                subtitle = "UNLOCK AND UPGRADE SKILLS, FEATURES, AND EQUIPMENT AS YOU PROGRESS."
            },
            pos.header.x,
            pos.header.y
        },
        {
            label {
                name = "tech_points_title",
                text = strmem(256, "TECH POINTS"),
                variant = "button",
                color = "white"
            },
            pos.header.x,
            62
        },
        {
            image {
                name = "tech_points",
                width = 107,
                height = 97,
                image = [[keymind/helljumper/ui/bitmaps/icons/tech_points.bitmap]],
                scale = 0.25
            },
            pos.header.x,
            86
        },
        {
            label {
                name = "tech_points_amount",
                text = strmem(3, "000"),
                variant = "button",
                justify = "left",
                color = "white"
            },
            48,
            85
        },
        { ---Tab buttons for categories on tech tree
            options {
                name = "tech_tree_tab_buttons",
                alignment = "horizontal",
                childs = {
                    {
                        buttonTechTree {
                            name = "gridharvolur_armor_tab",
                            -- text = strmem(32, "GRIDHARVOLUR ARMOR"),
                            justification = "center_justify",
                            variant = "tab",
                            childs = {
                                {
                                    label {
                                        name = "gridharvolur_armor_tab",
                                        text = strmem(32, "GRIDHARVOLUR ARMOR"),
                                        variant = "text",
                                        justify = "center",
                                        color = "white",
                                        width = 177
                                    },
                                    5,
                                    4
                                }
                            }
                        },
                        tabLayout()
                    },
                    {
                        buttonTechTree {
                            name = "weapons_tab",
                            -- text = strmem(32, "WEAPONS"),
                            justification = "center_justify",
                            variant = "tab",
                            childs = {
                                {
                                    label {
                                        name = "weapons_tab",
                                        text = strmem(32, "WEAPONS"),
                                        variant = "text",
                                        justify = "center",
                                        color = "white",
                                        width = 177
                                    },
                                    35,
                                    4
                                }
                            }
                        },
                        tabLayout()
                    }
                }
            }
        },
        { ---Tech tree upgrade buttons
            options {
                name = "tech_tree_grid_buttons",
                alignment = "vertical",
                childs = {
                    -- {
                    --     label {
                    --         name = "armor_header",
                    --         text = strmem(32, "ARMOR"),
                    --         variant = "button",
                    --         justify = "left",
                    --         color = "yellow",
                    --     },
                    --     26,
                    --     152
                    -- },
                    { ---First Column
                        buttonTechTree {
                            name = "armor_upgrade",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "armor_upgrade",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/upgrade_armor_icon.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    bar {
                                        name = "connection_armor",
                                        orientation = "vertical",
                                        type = "scroll",
                                        size = 12
                                    },
                                    30,
                                    48
                                }
                            }
                        },
                        upgradeLayoutI()
                    },
                    {
                        buttonTechTree {
                            name = "titanium_a_upgrade",
                            justification = "center_justify",
                            variant = "upgrade",
                            childs = {
                                {
                                    image {
                                        name = "titanium_upgrade",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/upgrade_titanium_icon.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    label {
                                        name = "titanium_upgrade",
                                        text = strmem(32, "0/4"),
                                        variant = "shadow",
                                        justify = "center",
                                        color = "white",
                                        width = 60
                                    },
                                    15,
                                    38
                                }
                            }
                        },
                        upgradeLayoutI()
                    },
                    { ---Seccond Column
                        buttonTechTree {
                            name = "health_regen_upgrade",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "health_regen_upgrade",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/upgrade_health_regen_icon.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    bar {
                                        name = "connection_hregen",
                                        orientation = "vertical",
                                        type = "scroll",
                                        size = 12
                                    },
                                    30,
                                    48
                                }
                            }
                        },
                        upgradeLayoutII()
                    },
                    {
                        buttonTechTree {
                            name = "h_regen_up_upgrade",
                            justification = "center_justify",
                            variant = "upgrade",
                            childs = {
                                {
                                    image {
                                        name = "h_regen_up_upgrade",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/upgrade_hregen_up_icon.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    label {
                                        name = "h_regen_up_upgrade",
                                        text = strmem(32, "0/3"),
                                        variant = "shadow",
                                        justify = "center",
                                        color = "white",
                                        width = 60
                                    },
                                    16,
                                    38
                                }
                            }
                        },
                        upgradeLayoutII()
                    },
                    { ---Third Column SHIELD
                        buttonTechTree {
                            name = "shield_failure_upgrade",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "shield_failure_upgrade",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/upgrade_shield_failure_icon.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    bar {
                                        name = "connection_hregen",
                                        orientation = "vertical",
                                        type = "scroll",
                                        size = 12
                                    },
                                    30,
                                    48
                                },
                                {
                                    bar {
                                        name = "connection_hregen",
                                        orientation = "horizontal",
                                        type = "scroll",
                                        size = 12
                                    },
                                    48,
                                    30
                                }
                            }
                        },
                        upgradeLayoutIII()
                    },
                    {
                        buttonTechTree {
                            name = "shield_leak_upgrade",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "shield_leak_upgrade",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/upgrade_shield_leak_icon.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    bar {
                                        name = "connection_hregen",
                                        orientation = "vertical",
                                        type = "scroll",
                                        size = 12
                                    },
                                    30,
                                    48
                                }
                            }
                        },
                        upgradeLayoutIII()
                    },
                    {
                        buttonTechTree {
                            name = "shield_b_proof_upgrade",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "shield_b_proof_upgrade",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/upgrade_shield_bulletproof_icon.bitmap]],
                                        scale = 0.244
                                    }
                                }
                            }
                        },
                        upgradeLayoutIII()
                    }
                }
            }
        }
    }
}
