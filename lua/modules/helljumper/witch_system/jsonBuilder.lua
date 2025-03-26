-- Módulo para convertir una tabla Lua a JSON sin usar cjson
local json = {}

-- Función auxiliar para escapar caracteres especiales en cadenas
local function escape_string(str)
    return '"' .. str:gsub('[\\"]', '\\%0'):gsub('\n', '\\n'):gsub('\r', '\\r'):gsub('\t', '\\t') .. '"'
end

-- Función recursiva para convertir tablas Lua a JSON con formato (pretty print)
local function table_to_json(tbl, indent_level)
    local json_parts = {}
    local indent = string.rep("    ", indent_level)  -- Usamos 4 espacios por indentación

    -- Si es una tabla, recorremos sus elementos
    if type(tbl) == "table" then
        local is_array = #tbl > 0  -- Verificamos si la tabla es un array
        if is_array then
            -- Tabla tipo array
            json_parts[#json_parts + 1] = "["  -- Abrimos la lista
            for i, v in ipairs(tbl) do
                json_parts[#json_parts + 1] = "\n" .. indent .. "    " .. table_to_json(v, indent_level + 1)  -- Recursión para cada elemento
                if i < #tbl then
                    json_parts[#json_parts + 1] = ","  -- Coma entre elementos
                end
            end
            json_parts[#json_parts + 1] = "\n" .. indent .. "]"  -- Cerramos la lista
        else
            -- Tabla tipo objeto (clave: valor)
            json_parts[#json_parts + 1] = "{"  -- Abrimos el objeto
            for k, v in pairs(tbl) do
                local key = type(k) == "string" and escape_string(k) or '"' .. tostring(k) .. '"'
                json_parts[#json_parts + 1] = "\n" .. indent .. "    " .. key .. ": " .. table_to_json(v, indent_level + 1)  -- Recursión para cada valor
                -- Coma si no es el último elemento
                if next(tbl, k) then
                    json_parts[#json_parts + 1] = ","
                end
            end
            json_parts[#json_parts + 1] = "\n" .. indent .. "}"  -- Cerramos el objeto
        end
    elseif type(tbl) == "string" then
        return escape_string(tbl)  -- Escapamos la cadena
    elseif type(tbl) == "number" or type(tbl) == "boolean" then
        return tostring(tbl)  -- Retornamos el valor como cadena
    elseif tbl == nil then
        return "null"  -- Para valores nulos
    end

    return table.concat(json_parts)
end

-- Función pública para convertir una tabla Lua a JSON con formato
function json.encode(tbl)
    return table_to_json(tbl, 0)
end

-- Función para guardar el JSON formateado en un archivo con nombre y ruta
function json.save_to_file(tbl, dir_path, file_name)
    -- Convertimos la tabla a JSON con formato
    local json_string = json.encode(tbl)
    
    -- Aseguramos que la ruta y el nombre del archivo sean válidos
    local file_path = dir_path .. "/" .. file_name .. ".json"
    
    -- Abrimos el archivo en modo escritura
    local file, err = io.open(file_path, "w")
    if not file then
        return nil, err  -- Si hay un error, lo devolvemos
    end

    -- Escribimos el JSON formateado en el archivo
    file:write(json_string)
    file:close()

    return true  -- Retornamos true si todo fue bien
end

return json