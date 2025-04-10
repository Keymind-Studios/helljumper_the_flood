local balltze = Balltze
local fs = balltze.filesystem

local stateloader = {}

---@type BalltzeConfig
local configFile

function stateloader.load()
    if configFile == nil then
        local pluginPath = fs.getPluginPath()
        local configPath = pluginPath .. "\\config\\game_data"
        if not fs.directoryExists(configPath) then
            fs.createDirectory(configPath)
        end
        configFile = balltze.config.open(configPath .. "\\playerData.json")
        configFile:load()
    else
        error("Config file desn't exist")
    end
end

-- Save key | value in a config file
function stateloader.save()
    if configFile then
        configFile:save()
    end
end

-- Create a new key | value in the config file
function stateloader.set(key, value)
    if configFile then
        configFile:set(key, value)
    else
        error("Failed to create key | value")
    end
end

-- Check if the key exist in the config file
function stateloader.exists(key)
    if configFile then
        return configFile:exists(key)
    else
        error("Key doesn't exist")
    end
end

-- Remove an existing key in the config file
function stateloader.remove(key)
    if configFile then
        configFile:remove(key)
    else
        error ("Can't remove, key doesn't exist")
    end
end

-- Get a string from a value
function stateloader.getString(key)
    if configFile then
        return configFile:getString(key)
    else
        error("Value is not a string")
    end
end

-- Get a number from a value
function stateloader.getNumber(key)
    if configFile then
        return configFile:getNumber(key)
    else
        error("Value is not a number")
    end
end

-- Get an integer from a value
function stateloader.getInteger(key)
    if not configFile then
        error("Value is not an integer")
    end
    return configFile:getInteger(key)
end

-- Get a boolean from a value
function stateloader.getBoolean(key)
    if configFile then
        return configFile:getBoolean(key)
    else
        error("Value is not a boolean")
    end
end

return stateloader
