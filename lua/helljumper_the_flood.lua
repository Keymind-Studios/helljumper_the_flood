DebugMode = true
local balltze = Balltze
local engine = Engine
package.preload["luna"] = nil
package.loaded["luna"] = nil
require "luna"
local script = require "script"
local blam = require "blam"
local interface = require "helljumper.interface"
local fontOverride = require "helljumper.fontOverride"
local stateLoader = require "helljumper.witch_system.stateLoader"
local playerState = require "helljumper.witch_system.playerState"
local rucksack = require "helljumper.witch_system.rucksack.rucksack"

-- local main
local loadWhenIn = {"f10_division_105", "deployment_system"}

loadWhenIn = table.extend(loadWhenIn, table.map(loadWhenIn, function(map)
    return map .. "_dev"
end))

function PluginMetadata()
    return {
        name = "Helljumper: The Flood",
        author = "Keymind Studios",
        version = "1.0.0",
        targetApi = "1.0.0",
        reloadable = true,
        maps = loadWhenIn
    }
end

-- Print version on pause menu
function OnFrame()
    local isPlayerOnMenu = read_byte(blam.addressList.gameOnMenus) == 1
    if isPlayerOnMenu then
        return
    end
    local font = "smaller"
    local align = "right"
    local bounds = {left = 0, top = 460, right = 632, bottom = 480}
    local textColor = {1.0, 0.45, 0.72, 1.0}
    draw_text("helljumperTheFlood-v-1.0.0", bounds.left, bounds.top, bounds.right, bounds.bottom,
              font, align, table.unpack(textColor))
end

local function loadChimeraCompatibility()
    -- Load Chimera compatibility
    for k, v in pairs(balltze.chimera) do
        if not k:includes "timer" and not k:includes "execute_script" and
            not k:includes "set_callback" then
            _G[k] = v
        end
    end
    server_type = engine.netgame.getServerType()

    -- Replace Chimera functions with Balltze functions
    write_bit = balltze.memory.writeBit
    write_byte = balltze.memory.writeInt8
    write_word = balltze.memory.writeInt16
    write_dword = balltze.memory.writeInt32
    write_int = balltze.memory.writeInt32
    write_float = balltze.memory.writeFloat
    write_string = function(address, value)
        for i = 1, #value do
            write_byte(address + i - 1, string.byte(value, i))
        end
        if #value == 0 then
            write_byte(address, 0)
        end
    end
    execute_script = engine.hsc.executeScript
end

local loaded = false

function PluginFirstTick()
    fontOverride.setup()
    stateLoader.load()
    --rucksack.saveSpecialAmmo()
end

function PluginLoad()
    logger = balltze.logger.createLogger("Helljumper")
    logger:muteDebug(not DebugMode)
    logger:muteIngame(not DebugMode)
    loadChimeraCompatibility()

    ---Commands for Helljumper
    balltze.command.registerCommand("save_state", "debug", "description", nil, false, 0, 0, true,
                                    false, function(args)
                                        playerState.saveGrenades()
                                        playerState.saveHealth()
                                        playerState.saveWeapon()
        return true
    end)
        balltze.command.registerCommand("load_state", "debug", "description", nil, false, 0, 0, true,
                                    false, function(args)
                                        playerState.loadGrenades()
                                        playerState.loadHealth()
                                        playerState.loadWeapon()
        return true
    end)
            balltze.command.registerCommand("load_ammo", "debug", "description", nil, false, 0, 0, true,
                                    false, function(args)
                                        rucksack.loadSpecialAmmo()
        return true
    end)
    balltze.event.tick.subscribe(function(event)
        if event.time == "before" then
            script.dispatch()
            -- balltze.features.setUIAspectRatio(16, 9)
            interface.changeAspectRatio()
            rucksack.saveSpecialAmmo()
            if not loaded then
                local serverType = engine.netgame.getServerType()
                if serverType == "local" or serverType == "none" then
                    local mapName = engine.map.getCurrentMapHeader().name
                    local levelName = mapName:split("_dev")[1]
                    local ok, result = pcall(require, "levels." .. levelName)
                    if not ok then
                        logger:warning("Error loading level script: {}", result)
                    else
                        logger:info("Loaded level script for \"{}\"", levelName)
                    end
                end
                loaded = true
            end
        end
    end)

    return true
end

function PluginUnload()
end