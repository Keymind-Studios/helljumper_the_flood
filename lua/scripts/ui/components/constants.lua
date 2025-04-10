local width = 854
local height = 480

return {
    color = {
        text = "1, 1, 1, 1",
        title = "1, 1, 1, 1",
        subtitle = "1, 1, 0.756863, 0.027451",
        selected = "1, 0.55, 0.55, 0.55",
        nameplate = "1, 0.8, 0.8, 0.8",
        info = "1, 0.427451, 0.564706, 0.803922",
        focus = "1, 0.592157, 0.698039, 0.878431",
        warning = "1, 1, 0.756863, 0.027451",
        error = "1, 0.8, 0, 0",
        palette = {
            primary = "#3d6cc1",
            secondary = "#6d90cd",
            primaryHighlight = "#97b2e0",
            secondaryHighlight = "#2996ff",
            contrast = "#273D50",
            barTechTree = "#b2b2b2"
        }
    },
    
    opacity = {primary = 12.5, secondary = 34.5},
    
    fonts = {
        text = [[keymind/helljumper/ui/fonts/nexa-bold-text.font]], -- small
        title = [[keymind/helljumper/ui/fonts/nexa-bold-title.font]], -- ticker
        subtitle = [[keymind/helljumper/ui/fonts/nexa-light-subtitle.font]], -- gamespy/subtitle
        button = [[keymind/helljumper/ui/fonts/nexa-bold-button.font]], -- large
        shadow = [[keymind/helljumper/ui/fonts/nexa-bold-shadow.font]]
    },
    
    screen = {width = width, height = height},
    getScreenBounds = function()
        return "0, 0, " .. height .. ", " .. width
    end,
    
    position = {
        header = {x = 20, y = 20},
        options = {x = 20, y = 60},
        back = {x = 685, y = 416},
        back_left = {x = 20, y = 416},
        action = {x = 444, y = 416},
        footer = {x = 20, y = 330},
        logo = {x = 202, y = 105},
        nameplate = {x = 641, y = 20},
        version = {x = 0, y = 460},
    },
    
    components = {
        -- button = {
        --     small = {
        --         width = 149,
        --         height = 24,
        --         bitmap = [[insurrection/ui/bitmaps/small_button.bitmap]]
        --     },
        --     normal = {
        --         width = 184,
        --         height = 24,
        --         bitmap = [[insurrection/ui/bitmaps/normal_button.bitmap]]
        --     },
        --     large = {
        --         width = 389,
        --         height = 24,
        --         bitmap = [[insurrection/ui/bitmaps/large_button.bitmap]]
        --     }
        -- },
        -- arrow = {
        --     left = {width = 16, height = 16, bitmap = [[insurrection/ui/bitmaps/arrow_left.bitmap]]},
        --     right = {
        --         width = 16,
        --         height = 16,
        --         bitmap = [[insurrection/ui/bitmaps/arrow_right.bitmap]]
        --     },
        --     up = {width = 10, height = 8, bitmap = [[insurrection/ui/bitmaps/arrow_up.bitmap]]},
        --     down = {width = 10, height = 8, bitmap = [[insurrection/ui/bitmaps/arrow_down.bitmap]]}
        -- },
        -- complexButton = {
        --     normal = {
        --         width = 120,
        --         height = 110,
        --         bitmap = [[insurrection/ui/bitmaps/complex_button.bitmap]]
        --     },
        --     vertical = {
        --         width = 144,
        --         height = 158,
        --         bitmap = [[insurrection/ui/bitmaps/vertical_complex_button.bitmap]]
        --     },
        --     horizontal = {
        --         width = 149,
        --         height = 36,
        --         bitmap = [[insurrection/ui/bitmaps/horizontal_complex_button.bitmap]]
        --     },
        --     horizontal_c_text = {
        --         width = 149,
        --         height = 36,
        --         bitmap = [[insurrection/ui/bitmaps/horizontal_complex_button.bitmap]]
        --     }
        -- },
        -- input = {
        --     small = {
        --         width = 184,
        --         height = 23,
        --         bitmap = [[insurrection/ui/bitmaps/input_small.bitmap]]
        --     },
        --     normal = {width = 187, height = 34, bitmap = [[insurrection/ui/bitmaps/input.bitmap]]}
        -- }
    }
}