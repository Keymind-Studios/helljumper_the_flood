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
local buttonMulti = require "lua.scripts.ui.components.buttonMulti"
local bar = require "lua.scripts.ui.components.bar"

widget.init "keymind/helljumper/ui/menus/tech_tree_grid/"

local tabLayout = widget.layout {alignment = "horizontal", size = 177, x = 20, y = 65, margin = 3}
local optionsLayout = widget.layout {
    alignment = "horizontal",
    size = 149,
    x = 20,
    y = 462,
    margin = 2
}
local upgradeLayoutI = widget.layout {
    alignment = "vertical",
    size = 246,
    x = 20,
    y = 130,
    margin = -186
}
local upgradeLayoutII = widget.layout {
    alignment = "vertical",
    size = 246,
    x = 85,
    y = 130,
    margin = -186
}
local upgradeLayoutIII = widget.layout {
    alignment = "vertical",
    size = 246,
    x = 170,
    y = 130,
    margin = -186
}
local upgradeLayoutIV = widget.layout {
    alignment = "vertical",
    size = 246,
    x = 230,
    y = 130,
    margin = -186
}
local upgradeLayoutV = widget.layout {
    alignment = "vertical",
    size = 246,
    x = 290,
    y = 130,
    margin = -186
}
local upgradeLayoutVb = widget.layout {
    alignment = "vertical",
    size = 246,
    x = 290,
    y = 190,
    margin = -186
}
local upgradeLayoutVI = widget.layout {
    alignment = "vertical",
    size = 246,
    x = 350,
    y = 130,
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
                name = "item_name",
                text = strmem(32, "$itemName"),
                variant = "text",
                justify = "left",
                color = "yellow"
            },
            20,
            375
        },
        {
            label {
                name = "tp_cost_text",
                text = strmem(32, "Cost:"),
                variant = "text",
                justify = "left",
                color = "white"
            },
            20,
            400
        },
        {
            label {
                name = "tp_cost_number",
                text = strmem(32, "00"),
                variant = "text",
                justify = "left",
                color = "white"
            },
            60,
            400
        },
        {
            label {
                name = "item_description",
                text = strmem(256,
                              "This is a test for the item description with a purpose to have a mid or large text."),
                variant = "button",
                justify = "left",
                color = "silver"
            },
            20,
            425
        },
        {
            label {
                name = "tech_points_title",
                text = strmem(256, "TECH POINTS"),
                variant = "button",
                justify = "right",
                color = "white",
                width = 132
            },
            763,
            400
        },
        {
            image {
                name = "tech_points",
                width = 107,
                height = 97,
                image = [[keymind/helljumper/ui/bitmaps/icons/tech_points.bitmap]],
                scale = 0.25
            },
            807,
            425
        },
        {
            label {
                name = "tech_points_amount",
                text = strmem(3, "000"),
                variant = "button",
                justify = "right",
                color = "yellow",
                width = 32
            },
            772,
            424
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
                    -- {
                    --     buttonTechTree {
                    --         name = "weapons_tab",
                    --         -- text = strmem(32, "WEAPONS"),
                    --         justification = "center_justify",
                    --         variant = "tab",
                    --         childs = {
                    --             {
                    --                 label {
                    --                     name = "weapons_tab",
                    --                     text = strmem(32, "WEAPONS & EQUIP"),
                    --                     variant = "text",
                    --                     justify = "center",
                    --                     color = "white",
                    --                     width = 177
                    --                 },
                    --                 22,
                    --                 4
                    --             }
                    --         }
                    --     },
                    --     tabLayout()
                    -- },
                    -- {
                    --     buttonTechTree {
                    --         name = "vehicles_tab",
                    --         -- text = strmem(32, "WEAPONS"),
                    --         justification = "center_justify",
                    --         variant = "tab",
                    --         childs = {
                    --             {
                    --                 label {
                    --                     name = "vehicles_tab",
                    --                     text = strmem(32, "VEHICLES"),
                    --                     variant = "text",
                    --                     justify = "center",
                    --                     color = "white",
                    --                     width = 177
                    --                 },
                    --                 35,
                    --                 4
                    --             }
                    --         }
                    --     },
                    --     tabLayout()
                    -- },
                    {
                        buttonTechTree {
                            name = "archetype_tab",
                            -- text = strmem(32, "WEAPONS"),
                            justification = "center_justify",
                            variant = "tab",
                            childs = {
                                {
                                    label {
                                        name = "archetype_tab",
                                        text = strmem(32, "ARCHETYPE"),
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
        { ---TECH TREE UPGRADE BUTTONS
            options {
                name = "tech_tree_grid_buttons",
                alignment = "vertical",
                childs = {
                    {
                        label {
                            name = "armor_header",
                            text = strmem(32, "ARMOR"),
                            variant = "button",
                            justify = "left",
                            color = "white",
                            width = 70
                        },
                        26,
                        108
                    },
                    { ---First Column
                        buttonTechTree {
                            name = "armor_unlock",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "armor_unlock",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/00a_armor_unlock.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    bar {
                                        name = "connection_ver",
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
                            name = "titanium_a",
                            justification = "center_justify",
                            variant = "upgrade",
                            childs = {
                                {
                                    image {
                                        name = "titanium_a",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/00b_titanium_a.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    label {
                                        name = "titanium_a",
                                        text = strmem(32, "0/4"),
                                        variant = "shadow",
                                        justify = "center",
                                        color = "white",
                                        width = 60
                                    },
                                    15,
                                    39
                                }
                            }
                        },
                        upgradeLayoutI()
                    },
                    { ---Seccond Column HEALTH REGEN
                        buttonTechTree {
                            name = "health_regen_unlock",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "health_regen_unlock",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/01a_health_regen_unlock.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    bar {
                                        name = "connection_ver",
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
                            name = "health_regen_upgrade",
                            justification = "center_justify",
                            variant = "upgrade",
                            childs = {
                                {
                                    image {
                                        name = "health_regen_upgrade",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/01b_health_regen_upgrade.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    label {
                                        name = "health_regen_upgrade",
                                        text = strmem(32, "0/3"),
                                        variant = "shadow",
                                        justify = "center",
                                        color = "white",
                                        width = 60
                                    },
                                    16,
                                    39
                                },
                                { ---Vertical Bar Short
                                    bar {
                                        name = "connection_ver_short",
                                        orientation = "vertical",
                                        type = "scroll",
                                        size = 7
                                    },
                                    30,
                                    53
                                }
                            }
                        },
                        upgradeLayoutII()
                    },
                    {
                        buttonTechTree {
                            name = "health_regen_mastery",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "health_regen_mastery",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/01c_health_regen_mastery.bitmap]],
                                        scale = 0.244
                                    }
                                }
                            }
                        },
                        upgradeLayoutII()
                    },
                    {
                        label {
                            name = "shield_header",
                            text = strmem(32, "SHIELD"),
                            variant = "button",
                            justify = "left",
                            color = "white",
                            width = 70
                        },
                        176,
                        108
                    },
                    { ---Third Column SHIELD
                        buttonTechTree {
                            name = "shield_failure",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "shield_failure",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/03a_shield_failure.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    bar {
                                        name = "connection_ver",
                                        orientation = "vertical",
                                        type = "scroll",
                                        size = 12
                                    },
                                    30,
                                    48
                                },
                                {
                                    bar {
                                        name = "connection_hor",
                                        orientation = "horizontal",
                                        type = "progress",
                                        size = 12
                                    },
                                    54,
                                    22
                                }
                            }
                        },
                        upgradeLayoutIII()
                    },
                    {
                        buttonTechTree {
                            name = "shield_leak",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "shield_leak",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/03b_shield_leak.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    bar {
                                        name = "connection_ver",
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
                            name = "shield_mastery",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "shield_mastery",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/03c_shield_mastery.bitmap]],
                                        scale = 0.244
                                    }
                                }
                            }
                        },
                        upgradeLayoutIII()
                    },
                    { ---Fourth Column Shield upgrade
                        buttonTechTree {
                            name = "shield_unlock",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "shield_unlock",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/06a_shield_unlock.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    bar {
                                        name = "connection_ver",
                                        orientation = "vertical",
                                        type = "scroll",
                                        size = 12
                                    },
                                    30,
                                    48
                                },
                                {
                                    bar {
                                        name = "connection_hor",
                                        orientation = "horizontal",
                                        type = "progress",
                                        size = 12
                                    },
                                    54,
                                    22
                                }
                            }
                        },
                        upgradeLayoutIV()
                    },
                    {
                        buttonTechTree {
                            name = "shield_upgrade",
                            justification = "center_justify",
                            variant = "upgrade",
                            childs = {
                                {
                                    image {
                                        name = "shield_upgrade",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/06b_shield_upgrade.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    label {
                                        name = "shield_upgrade",
                                        text = strmem(32, "0/4"),
                                        variant = "shadow",
                                        justify = "center",
                                        color = "white",
                                        width = 60
                                    },
                                    16,
                                    39
                                },
                                {
                                    bar {
                                        name = "connection_hor",
                                        orientation = "horizontal",
                                        type = "progress",
                                        size = 12
                                    },
                                    54,
                                    22
                                }
                            }
                        },
                        upgradeLayoutIV()
                    },
                    { ---Fifth Column SHIELD STUN
                        buttonTechTree {
                            name = "shield_stun",
                            justification = "center_justify",
                            variant = "upgrade",
                            childs = {
                                {
                                    image {
                                        name = "shield_stun",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/04_shield_stun.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    label {
                                        name = "shield_stun",
                                        text = strmem(32, "0/3"),
                                        variant = "shadow",
                                        justify = "center",
                                        color = "white",
                                        width = 60
                                    },
                                    16,
                                    39
                                },
                                {
                                    bar {
                                        name = "connection_hor",
                                        orientation = "horizontal",
                                        type = "progress",
                                        size = 12
                                    },
                                    54,
                                    22
                                }
                            }
                        },
                        upgradeLayoutV()
                    },
                    { ---Fifth Down Column Shield Emp
                        buttonTechTree {
                            name = "shield_emp",
                            justification = "center_justify",
                            variant = "simple",
                            childs = {
                                {
                                    image {
                                        name = "shield_emp",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/07a_shield_emp.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    bar {
                                        name = "connection_ver",
                                        orientation = "vertical",
                                        type = "scroll",
                                        size = 12
                                    },
                                    30,
                                    48
                                }
                            }
                        },
                        upgradeLayoutVb()
                    },
                    {
                        buttonTechTree {
                            name = "shield_emp_upgrade",
                            justification = "center_justify",
                            variant = "upgrade",
                            childs = {
                                {
                                    image {
                                        name = "shield_emp_upgrade",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/07b_shield_emp_upgrade.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    label {
                                        name = "shield_emp_upgrade",
                                        text = strmem(32, "0/4"),
                                        variant = "shadow",
                                        justify = "center",
                                        color = "white",
                                        width = 60
                                    },
                                    16,
                                    39
                                }
                            }
                        },
                        upgradeLayoutVb()
                    },
                    { ---Sixth Column SHIELD RECHARGE
                        buttonTechTree {
                            name = "shield_recharge",
                            justification = "center_justify",
                            variant = "upgrade",
                            childs = {
                                {
                                    image {
                                        name = "shield_recharge",
                                        width = 246,
                                        height = 216,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/05_shield_recharge.bitmap]],
                                        scale = 0.244
                                    }
                                },
                                {
                                    label {
                                        name = "shield_recharge",
                                        text = strmem(32, "0/3"),
                                        variant = "shadow",
                                        justify = "center",
                                        color = "white",
                                        width = 60
                                    },
                                    16,
                                    39
                                }
                            }
                        },
                        upgradeLayoutVI()
                    },
                    {
                        buttonMulti {
                            name = "back",
                            -- text = "BACK",
                            variant = "back",
                            back = true,
                            childs = {
                                {
                                    image {
                                        name = "escape_button",
                                        width = 92,
                                        height = 46,
                                        image = [[keymind/helljumper/ui/bitmaps/icons/esc_icon.bitmap]],
                                        scale = 0.2
                                    }
                                },
                                {
                                    label {
                                        name = "escape_button",
                                        text = strmem(32, "BACK"),
                                        variant = "shadow",
                                        justify = "center",
                                        color = "yellow",
                                        width = 92
                                    },
                                    2,
                                    -5
                                }
                            }
                        },
                        optionsLayout()
                    }
                }
            }
        }
    }
}
