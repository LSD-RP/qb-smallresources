local QBCore = exports['qb-core']:GetCoreObject()
local isRunningWorkaround = false

function StartWorkaroundTask()
	if isRunningWorkaround then
		return
	end

	local timer = 0
	local playerPed = PlayerPedId()
	isRunningWorkaround = true

	while timer < 100 do
		Citizen.Wait(0)
		timer = timer + 1

		local vehicle = GetVehiclePedIsTryingToEnter(playerPed)

		if DoesEntityExist(vehicle) then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 2 then
				ClearPedTasks(playerPed)
			end
		end
	end

	isRunningWorkaround = false
end

function ToggleVehicleLock()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local vehicle

	Citizen.CreateThread(function()
		StartWorkaroundTask()
	end)

	if IsPedInAnyVehicle(playerPed, false) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	else
		vehicle = GetClosestVehicle(coords, 8.0, 0, 71)  -- Fix can't lock Emergency Vehicles
	end

	if not DoesEntityExist(vehicle) then
		return
	end

	QBCore.Functions.TriggerCallback('vehiclelock:getOwnedVehicles', function(isOwnedVehicle)

		if isOwnedVehicle then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)
			local dict = "anim@mp_player_intmenu@key_fob@"
             RequestAnimDict(dict)
             
			if lockStatus == 1 then -- unlocked
				TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
				Citizen.Wait(500)
				SetVehicleDoorsLocked(vehicle, 2)
				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'carlock', 0.1)
				SetVehicleLights(vehicle, 2)
                Citizen.Wait(150)
                SetVehicleLights(vehicle, 0)
                Citizen.Wait(150)
                SetVehicleLights(vehicle, 2)
                Citizen.Wait(150)
                SetVehicleLights(vehicle, 0)
                Citizen.Wait(150)
				SoundVehicleHornThisFrame(vehicle)
                SetVehicleLights(vehicle, 2)
				SoundVehicleHornThisFrame(vehicle)
                Citizen.Wait(150)
                SetVehicleLights(vehicle, 0)


			elseif lockStatus == 2 then -- locked
				TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
				Citizen.Wait(500)
				SetVehicleDoorsLocked(vehicle, 1)
				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'carlock', 0.1)
                SetVehicleLights(vehicle, 2)
                Citizen.Wait(150)
                SetVehicleLights(vehicle, 0)
                Citizen.Wait(150)
                SetVehicleLights(vehicle, 2)
                Citizen.Wait(150)
                SetVehicleLights(vehicle, 0)
                Citizen.Wait(150)
                SoundVehicleHornThisFrame(vehicle)
                SetVehicleLights(vehicle, 2)
                Citizen.Wait(150)
                SoundVehicleHornThisFrame(vehicle)
                Citizen.Wait(5000)
                SetVehicleLights(vehicle, 0)
			end
		end

	end, trimWhitespace(GetVehicleNumberPlateText(vehicle)))
end

RegisterCommand('lockcar', function()
    ToggleVehicleLock()
end)

RegisterKeyMapping('lockcar', 'Toggle Vehcile lock', 'keyboard', 'l')

function trimWhitespace(text)
    -- return text:gsub("%s+","")
	return text
end

-- Start stealing a car
local isLockpicking = false

RegisterNetEvent('lockpicks:UseLockpick')
AddEventHandler('lockpicks:UseLockpick', function()

	local coords = GetEntityCoords(PlayerPedId())
	local vehicle = nil
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	else
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
	end

	if DoesEntityExist(vehicle) then
		if not IsPedInAnyVehicle(PlayerPedId(), false) then
			if GetVehicleDoorLockStatus(vehicle) ~= 1 then
				RequestAnimDict("mini@repair")
				while not HasAnimDictLoaded("mini@repair") do
					Citizen.Wait(0)
				end

				TriggerEvent('carLockpickAnim')
				QBCore.Functions.Progressbar("unlock_vehicle", "Lockpicking vehicle", 20000, false, true, {
					disableMovement = true,
					disableCarMovement = true,
					disableMouse = false,
					disableCombat = true,
				}, {}, {}, {}, function() -- Done
					isLockpicking = false
					SetVehicleDoorsLocked(vehicle, 1)
					SetVehicleDoorsLockedForAllPlayers(vehicle, false)
					--   TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 8, "lock", 0.1)
					QBCore.Functions.Notify('Vehicle unlocked.')
					SetVehicleEngineOn(vehicle, true, true, true)
					SetVehicleLights(vehicle, 2) Wait(200)
					SetVehicleLights(vehicle, 1) Wait(200)
					SetVehicleLights(vehicle, 2) Wait(200)
					SetVehicleLights(vehicle, 1) Wait(200)
					ClearPedTasksImmediately(PlayerPedId())
					-- TriggerServerEvent('removelockpick')
				end, function() -- Cancel
					isLockpicking = false
				end)

			end
		end
	end
end)


AddEventHandler('carLockpickAnim', function()
	isLockpicking = true
	loadAnimDict('veh@break_in@0h@p_m_one@')
	while isLockpicking do
		if not IsEntityPlayingAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3) then
			TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
			Citizen.Wait(1500)
			ClearPedTasks(PlayerPedId())
		end
		Citizen.Wait(5)
	end
	ClearPedTasks(PlayerPedId())
end)


function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(5)
	end
end
