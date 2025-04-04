local balltze = Balltze
local engine = Engine
local blam = require "blam"


local core = {}


local const = require "helljumper.constants"

---@class vector3D
---@field x number
---@field y number
---@field z number

--- Covert euler into game rotation array, optional rotation matrix, based on this
---[source.](https://www.mecademic.com/en/how-is-orientation-in-space-represented-with-euler-angles)
--- @param yaw number
--- @param pitch number
--- @param roll number
--- @return vector3D, vector3D
function core.eulerToRotation(yaw, pitch, roll)
    local yaw = math.rad(yaw)
    local pitch = math.rad(-pitch) -- Negative pitch due to Sapien handling anticlockwise pitch
    local roll = math.rad(roll)
    local matrix = {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}}

    -- Roll, Pitch, Yaw = a, b, y
    local cosA = math.cos(roll)
    local sinA = math.sin(roll)
    local cosB = math.cos(pitch)
    local sinB = math.sin(pitch)
    local cosY = math.cos(yaw)
    local sinY = math.sin(yaw)

    matrix[1][1] = cosB * cosY
    matrix[1][2] = -cosB * sinY
    matrix[1][3] = sinB
    matrix[2][1] = cosA * sinY + sinA * sinB * cosY
    matrix[2][2] = cosA * cosY - sinA * sinB * sinY
    matrix[2][3] = -sinA * cosB
    matrix[3][1] = sinA * sinY - cosA * sinB * cosY
    matrix[3][2] = sinA * cosY + cosA * sinB * sinY
    matrix[3][3] = cosA * cosB

    local rollVector = {x = matrix[1][1], y = matrix[2][1], z = matrix[3][1]}
    local yawVector = {x = matrix[1][3], y = matrix[2][3], z = matrix[3][3]}
    return rollVector, yawVector, matrix
end

--- Rotate object into desired angles
---@param objectId number
---@param yaw number
---@param pitch number
---@param roll number
function core.rotateObject(objectId, yaw, pitch, roll)
    local rollVector, yawVector, matrix = core.eulerToRotation(yaw, pitch, roll)
    local object = blam.object(get_object(objectId))
    object.vX = rollVector.x
    object.vY = rollVector.y
    object.vZ = rollVector.z
    object.v2X = yawVector.x
    object.v2Y = yawVector.y
    object.v2Z = yawVector.z
end

--- Return the file name of a tag file path
---@param tagPath string
function core.getTagName(tagPath)
    local tagSplit = tagPath:split "\\"
    local tagName = tagSplit[#tagSplit]
    return tagName
end

function core.secondsToTicks(seconds)
    return 30 * seconds
end

function core.ticksToSeconds(ticks)
    return math.floor(ticks / 30 + 0.5)
end

---@type table<number, {x: number, y: number, z: number}>
local raycastCoords = {}

local currentWaypointsIndexes = {}

function core.deleteWaypoint(index, playerIndex)
    local index = tonumber(index)
    if index then
        for i = 0, 15 do
            local player = blam.player(get_player(i))
            if player then
                playerIndex = player.index
            end
            local deactivateWaypoint = [[(deactivate_nav_point_flag (unit (list_get (players) %s)) waypoint_%s)]]
            execute_script(deactivateWaypoint:format(playerIndex, index))
        end
        raycastCoords[index] = nil
        currentWaypointsIndexes[index] = nil
    end
    return false
end

---Create a waypoint at the given coordinates
---@param x number
---@param y number
---@param z number
---@param type? string
---@param duration? number
---@return boolean
function core.createWaypoint(x, y, z, type, duration)
    local waypointIndex
    for i = 1, 4 do
        if not currentWaypointsIndexes[i] then
            currentWaypointsIndexes[i] = true
            waypointIndex = i
            break
        end
    end
    if waypointIndex then
        if not raycastCoords[waypointIndex] then
            local localPlayer = blam.player(get_player())
            if not localPlayer then
                return false
            end
            local playerIndex = 0
            -- Find a player index different from the local player 
            for i = 0, 15 do
                local player = blam.player(get_player(i))
                if player and player.index ~= localPlayer.index then
                    playerIndex = player.index
                end
            end
            local activateWaypoint = "(activate_nav_point_flag %s (unit (list_get (players) %s)) waypoint_%s 0)"
            local hscCommand = activateWaypoint:format(type or "default", playerIndex, waypointIndex)
            execute_script(hscCommand)
            local scenario = assert(blam.scenario(0), "Unable to get scenario")
            local flags = scenario.cutsceneFlags
            flags[waypointIndex].x = x
            flags[waypointIndex].y = y
            flags[waypointIndex].z = z
            scenario.cutsceneFlags = flags
            raycastCoords[waypointIndex] = {x = x, y = y, z = z}
            local timer
            timer = balltze.misc.setTimer(duration or 4000, function ()
                logger:info("Deleting waypoint {}", waypointIndex)
                core.deleteWaypoint(waypointIndex, playerIndex)
                timer.stop()
            end)
            return true
        end
    end
    return false
end

function core.calculateRaycast(player)
    local rayX = player.x + player.xVel + player.cameraX * const.raycastOffset
    local rayY = player.y + player.yVel + player.cameraY * const.raycastOffset
    -- As we are using biped camera position, we need to add offset to the Z raycast
    -- to make it match view port camera position
    local rayZ = player.z + player.zVel + player.cameraZ * const.raycastOffset + 0.54
    return rayX, rayY, rayZ
end



return core
