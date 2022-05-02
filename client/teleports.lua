JustTeleported = false

CreateThread(function()
    while true do
        local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for loc,_ in pairs(Config.Teleports) do
            for k, v in pairs(Config.Teleports[loc]) do
                local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
                if dist < 7.5 then
                    inRange = true
                    -- DrawMarker(2, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                    DrawMarker(1, v.coords.x, v.coords.y, v.coords.z - 1.02, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.9, 77, 181, 255, 0.8, false, false, 2,false, nil, nil, false)
                    if dist < 1 then
                        DrawText3Ds(v.coords.x, v.coords.y, v.coords.z, v.drawText)
                        if IsControlJustReleased(0, 51) then
                            if k == 1 then
                                if v["AllowVehicle"] then
                                    SetPedCoordsKeepVehicle(ped, Config.Teleports[loc][2].coords.x, Config.Teleports[loc][2].coords.y, Config.Teleports[loc][2].coords.z)
                                else
                                    SetEntityCoords(ped, Config.Teleports[loc][2].coords.x, Config.Teleports[loc][2].coords.y, Config.Teleports[loc][2].coords.z)
                                end

                                if type(Config.Teleports[loc][2].coords) == "vector4" then
                                    SetEntityHeading(ped, Config.Teleports[loc][2].coords.w)
                                end
                            elseif k == 2 then
                                if v["AllowVehicle"] then
                                    SetPedCoordsKeepVehicle(ped, Config.Teleports[loc][1].coords.x, Config.Teleports[loc][1].coords.y, Config.Teleports[loc][1].coords.z)
                                else
                                    SetEntityCoords(ped, Config.Teleports[loc][1].coords.x, Config.Teleports[loc][1].coords.y, Config.Teleports[loc][1].coords.z)
                                end

                                if type(Config.Teleports[loc][1].coords) == "vector4" then
                                    SetEntityHeading(ped, Config.Teleports[loc][1].coords.w)
                                end
                            end
                            ResetTeleport()
                        end
                    end
                end
            end
        end

        if not inRange then
            Wait(1000)
        end

        Wait(3)
    end
end)

local customs = vector3(838.59, -2907.85, 5.9)

CreateThread(function()
    local blip = AddBlipForCoord(customs.x, customs.y, customs.z)
    SetBlipSprite(blip, 427)
    SetBlipDisplay(blip, 2)
    SetBlipScale(blip, 0.9)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 24)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("City-Island Transportation")
    EndTextCommandSetBlipName(blip)


    while true do
        local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for loc,_ in pairs(Config.Teleports2) do
            for k, v in pairs(Config.Teleports2[loc]) do
                local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
                if dist < 100 then
                    inRange = true
                    local r = math.floor(v.color.x)
                    local g = math.floor(v.color.y)
                    local b = math.floor(v.color.z)
                    -- DrawMarker(2, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
                    DrawMarker(1, v.coords.x, v.coords.y, v.coords.z - 1.02, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.7, 5.7, 0.9, r, g, b, 0.8, false, false, 2,false, nil, nil, false)
                    if dist < 2.5 then
                        DrawText3Ds(v.coords.x, v.coords.y, v.coords.z, v.drawText)
                        if IsControlJustReleased(0, 51) then
                            DoScreenFadeOut(1000)
                            Wait(1000)
                            if k == 1 then
                                if v["AllowVehicle"] then
                                    SetPedCoordsKeepVehicle(ped, Config.Teleports2[loc][2].coords.x, Config.Teleports2[loc][2].coords.y, Config.Teleports2[loc][2].coords.z)
                                else
                                    SetEntityCoords(ped, Config.Teleports2[loc][2].coords.x, Config.Teleports2[loc][2].coords.y, Config.Teleports2[loc][2].coords.z)
                                end

                                if type(Config.Teleports2[loc][2].coords) == "vector4" then
                                    SetEntityHeading(ped, Config.Teleports2[loc][2].coords.w)
                                end
                            elseif k == 2 then
                                if v["AllowVehicle"] then
                                    SetPedCoordsKeepVehicle(ped, Config.Teleports2[loc][1].coords.x, Config.Teleports2[loc][1].coords.y, Config.Teleports2[loc][1].coords.z)
                                else
                                    SetEntityCoords(ped, Config.Teleports2[loc][1].coords.x, Config.Teleports2[loc][1].coords.y, Config.Teleports2[loc][1].coords.z)
                                end

                                if type(Config.Teleports2[loc][1].coords) == "vector4" then
                                    SetEntityHeading(ped, Config.Teleports2[loc][1].coords.w)
                                end
                            end
                            local veh = GetVehiclePedIsIn(PlayerPedId())
                            if veh then
                                FreezeEntityPosition(veh, true)
                            else
                                FreezeEntityPosition(ped, true)
                            end
                            Wait(1000)
                            DoScreenFadeIn(1000)
                            if veh then
                                FreezeEntityPosition(veh, false)
                            else
                                FreezeEntityPosition(ped, false)
                            end
                            ResetTeleport()
                        end
                    end
                end
            end
        end

        if not inRange then
            Wait(1000)
        end

        Wait(3)
    end
end)

Citizen.CreateThread(function()
    -- blip
    local outsideArena = vector4(-264.73, -1897.79, 27.76, 320.18)
    while true do
        local sleep = 5000
        local pos = GetEntityCoords(PlayerPedId())
        if #(pos - outsideArena) < 20 then
            sleep = 5
            DrawMarker(1, outsideArena.x, outsideArena.y, outsideArena.z - 1.02, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.7, 5.7, 0.9, r, g, b, 0.8, false, false, 2,false, nil, nil, false)

            if #(pos - outsideArena) < 2.5 then
            end
        end
    end
end)

ResetTeleport = function()
    SetTimeout(1000, function()
        JustTeleported = false
    end)
end

local garageMarker = vector3(2751.03, -3698.26, 140.0)
local outsideArena = vector3(-264.73, -1897.79, 27.76)
local outsideHeading = 320.18
local insideArena = vector3(2831.99, -3703.1, 140.0)
local insideHeading = 90.2
local DeathBlip = nil
local GarageBlip = nil
local MechBlip = nil

Citizen.CreateThread(function()
    -- blip
    

    local blip = AddBlipForCoord(outsideArena.x, outsideArena.y, outsideArena.z)
    SetBlipSprite(blip, 303)
    SetBlipDisplay(blip, 2)
    SetBlipScale(blip, 0.5)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("FFA Arena")
    EndTextCommandSetBlipName(blip)

    
    while true do
        local sleep = 5000
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        if #(pos - outsideArena) < 20 then
            sleep = 2
            DrawMarker(1, outsideArena.x, outsideArena.y, outsideArena.z - 1.02, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.7, 5.7, 0.9, 50, 50, 200, 0.8, false, false, 2,false, nil, nil, false)

            if #(pos - outsideArena) < 2.5 then
                DrawText3Ds(outsideArena.x, outsideArena.y, outsideArena.z, "[E] Enter Arena")
                if IsControlJustReleased(0, 51) then
                    createInsideBlip()
                    if GetVehiclePedIsIn(ped, false) ~= nil then
                        SetPedCoordsKeepVehicle(ped, insideArena.x, insideArena.y, insideArena.z)
                        SetEntityHeading(GetVehiclePedIsIn(ped, false), insideHeading)
                    else
                        SetEntityCoords(ped, insideArena.x, insideArena.y, insideArena.z)
                        SetEntityHeading(ped, insideHeading)
                    end
                end
            end
        end
        if #(pos - insideArena) < 10 then
            sleep = 2
            DrawMarker(1, insideArena.x, insideArena.y, insideArena.z - 1.02, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.7, 5.7, 0.9, 50, 50, 200, 0.8, false, false, 2,false, nil, nil, false)
            if #(pos - insideArena) < 2.5 then
                DrawText3Ds(insideArena.x, insideArena.y, insideArena.z, "[E] Exit Arena")
                if IsControlJustReleased(0, 51) then
                    RemoveBlip(DeathBlip)
                    DeathBlip = nil
                    RemoveBlip(GarageBlip)
                    GarageBlip = nil
                    RemoveBlip(MechBlip)
                    MechBlip = nil
                    if GetVehiclePedIsIn(ped, false) ~= nil then
                        SetPedCoordsKeepVehicle(ped, outsideArena.x, outsideArena.y, outsideArena.z)
                        SetEntityHeading(GetVehiclePedIsIn(ped, false), outsideHeading)
                    else
                        SetEntityCoords(ped, outsideArena.x, outsideArena.y, outsideArena.z)
                        SetEntityHeading(ped, outsideHeading)
                    end
                end
            end
        end
        if #(pos - insideArena) < 500 then
            if #(pos - garageMarker) > 20 then
                sleep = 2
                DrawMarker(2, garageMarker.x, garageMarker.y, garageMarker.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 200, 0, 0, 222, false, false, false, true, false, false, false)
            end
        end
        Wait(sleep)
    end
end)

function createInsideBlip()
    DeathBlip = AddBlipForCoord(insideArena.x, insideArena.y, insideArena.z)
    SetBlipSprite(DeathBlip, 303)
    SetBlipDisplay(DeathBlip, 2)
    SetBlipScale(DeathBlip, 0.8)
    SetBlipAsShortRange(DeathBlip, true)
    SetBlipColour(DeathBlip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("FFA Arena")
    EndTextCommandSetBlipName(DeathBlip)

    local garagePoint = vector3(2752.48, -3700.84, 140.0)
    GarageBlip = AddBlipForCoord(garagePoint.x, garagePoint.y, garagePoint.z)
    SetBlipSprite(GarageBlip, 357)
    SetBlipDisplay(GarageBlip, 2)
    SetBlipScale(GarageBlip, 0.8)
    SetBlipAsShortRange(GarageBlip, true)
    SetBlipColour(GarageBlip, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("FFA Garage")
    EndTextCommandSetBlipName(GarageBlip)

    local mechPoint = vector3(2775.14, -3684.74, 140.0)
    MechBlip = AddBlipForCoord(mechPoint.x, mechPoint.y, mechPoint.z)
    SetBlipSprite(MechBlip, 72)
    SetBlipDisplay(MechBlip, 2)
    SetBlipScale(MechBlip, 0.8)
    SetBlipAsShortRange(MechBlip, true)
    SetBlipColour(MechBlip, 0)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("FFA Mech")
    EndTextCommandSetBlipName(MechBlip)
end