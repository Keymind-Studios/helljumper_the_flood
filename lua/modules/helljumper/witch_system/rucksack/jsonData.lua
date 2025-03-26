local rucksack = require "lua.modules.helljumper.witch_system.rucksack.rucksack"
local json = require "lua.modules.helljumper.witch_system.jsonBuilder"

local rucksack_table = {
    isActive = true, -- Boolean
    profile = "Mark McFuzz", -- String
    rucksackLevel = 6, -- Number
    -- dummy = {"a", "b", "c"}, -- Array
    equipment1 = { -- Table
        plasma_grenade = 2,
        frag_grenade = 4,
        camouflage = 1,
        overshield = 2
    },
    equipment2 = { -- Table
        explosive_knife = 1,
        bubble_shield = 1,
        ma38_ammo = 250
    }
}

local dir_path = "lua/modules/helljumper/witch_system/rucksack" -- Ruta donde se quiere guardar el archivo
local file_name = "rucksack_example" -- Nombre que tendrá el archivo (sin la extensión .json)

local success, err = json.save_to_file(rucksack_table, dir_path, file_name)

if success then
    print("The JSON file was saved successfully.")
else
    print("Error saving file:", err)
end
