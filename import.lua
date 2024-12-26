-- This is a sample function file. If you add the functions you want to protect (these can be things like TriggerEvent, TriggerServerEvent, or different natives) as I have added in this section, you will simply prevent their use and your scripts will work without breaking.
-- This is a sample function file. If you add the functions you want to protect (these can be things like TriggerEvent, TriggerServerEvent, or different natives) as I have added in this section, you will simply prevent their use and your scripts will work without breaking.
-- This is a sample function file. If you add the functions you want to protect (these can be things like TriggerEvent, TriggerServerEvent, or different natives) as I have added in this section, you will simply prevent their use and your scripts will work without breaking.

local TSE, TS, CE, CV, CP, _print, RC = TriggerServerEvent, TriggerEvent, CreateObject, CreateVehicle, CreatePed, print, RegisterCommand
local function NotInternalCall(info)
    local gsubSource, gsubSrc = info.source:gsub("@", ""), info.short_src:gsub("@", "")
    return "@" .. gsubSource ~= "@" .. gsubSrc and info.source ~= "=?"
end
CreateObject = function(...)
    local args = {...}
    local debug = debug.getinfo(2, "Sl")

    local entityHash = args[1]
    local getEntityResource = GetCurrentResourceName()

    if NotInternalCall(debug) then
        -- ban event
        TS("pac:if-you-see-this-you-got-banned", "Lua environment is tampered 1. injected code:```lua " .. debug.source .. " ```") 
    end

        return CE(table.unpack(args))
end
CreateVehicle = function(...)
    local args = {...}
    local debug = debug.getinfo(2, "Sl")

    if NotInternalCall(debug) then
        -- ban event
        TS("pac:if-you-see-this-you-got-banned", "Lua environment is tampered 2. injected code:```lua " .. debug.source .. " ```") 
    end

    return CV(table.unpack(args))
end
CreatePed = function(...)
    local args = {...}
    local debug = debug.getinfo(2, "Sl")

    if NotInternalCall(debug) then
        -- ban event
        TS("pac:if-you-see-this-you-got-banned", "Lua environment is tampered 3. injected code:```lua " .. debug.source .. " ```") 
    end

    return CP(table.unpack(args))
end
print = function(message)
    local debug = debug.getinfo(2, "Sl")

    if NotInternalCall(debug) then
        -- ban event
        TS("pac:if-you-see-this-you-got-banned", "Lua environment is tampered 4. injected code:```lua " .. debug.source .. " ```") 
    end

    _print(message)
end
RegisterCommand = function(name, callback, restricted)
    local debug = debug.getinfo(2, "Sl")

    if NotInternalCall(debug) then
        -- ban event
        TS("pac:if-you-see-this-you-got-banned", "Lua environment is tampered 5. injected code:```lua " .. debug.source .. " ```") 
    end

    if not restricted then
        restricted = false
    end

    return RC(name, callback, restricted)
end
