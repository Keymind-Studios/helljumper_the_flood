local balltze = Balltze
local engine = Engine
local fs = balltze.filesystem

local stateloader = {}

---@type BalltzeConfig
local configFile

function stateloader.load()
    if configFile == nil then
        local pluginPath = fs.getPluginPath()
        local configPath = pluginPath .. "\\config"
        if not fs.directoryExists(configPath) then
            fs.createDirectory(configPath)
        end
        configFile = balltze.config.open(configPath .. "\\test.json")
        configFile:load()
    else
        error("Config file already loaded")
    end
end

function stateloader.save()
    if configFile then
        configFile:save()
    end
end

function stateloader.set(key, value)
    if configFile then
        configFile:set(key, value)
    else
        error("Failed to Load Config")
    end
end

function stateloader.exists(key)
    if configFile then
        return configFile:exists(key)
    else
        error("Config File Isn't Loaded")
    end
end

function stateloader.remove(key)
    if configFile then
        configFile:remove(key)
    else
        error ("Cannot Remove Key")
    end
end

function stateloader.getString(key)
    if configFile then
        return configFile:getString(key)
    else
        error("Failed to get String")
    end
end

function stateloader.getNumber(key)
    if configFile then
        return configFile:getNumber(key)
    else
        error("Failed to get number")
    end
end

function stateloader.getInteger(key)
    if not configFile then
        error("Failed to get Integer")
    end
    return configFile:getInteger(key)
end

function stateloader.getBoolean(key)
    if configFile then
        return configFile:getBoolean(key)
    else
        error("Failed to get boolean")
    end
end

return stateloader
