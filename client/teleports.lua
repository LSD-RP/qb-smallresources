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

ResetTeleport = function()
    SetTimeout(1000, function()
        JustTeleported = false
    end)
end
