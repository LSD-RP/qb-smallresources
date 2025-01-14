-- Variables

local QBCore = exports['qb-core']:GetCoreObject()
local alcoholCount = 0
local ParachuteEquiped = false
local currentVest = nil
local currentVestTexture = nil
local isDrunk = false
local healing = false

-- Functions

local function loadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

local function EquipParachuteAnim()
    loadAnimDict("clothingshirt")
    TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, false, false, false)
end

local function HealOxy()
    if not healing then
        healing = true
    else
        return
    end

    local count = 9
    while count > 0 do
        Wait(1000)
        count -= 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 6)
    end
    healing = false
end

local function TrevorEffect()
    StartScreenEffect("DrugsTrevorClownsFightIn", 3.0, 0)
    Wait(3000)
    StartScreenEffect("DrugsTrevorClownsFight", 3.0, 0)
    Wait(3000)
	StartScreenEffect("DrugsTrevorClownsFightOut", 3.0, 0)
	StopScreenEffect("DrugsTrevorClownsFight")
	StopScreenEffect("DrugsTrevorClownsFightIn")
	StopScreenEffect("DrugsTrevorClownsFightOut")
end

local function MethBagEffect()
    local startStamina = 8
    TrevorEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    while startStamina > 0 do
        Wait(1000)
        if math.random(5, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina = startStamina - 1
        if math.random(5, 100) < 51 then
            TrevorEffect()
        end
    end
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

local function EcstasyEffect()
    local startStamina = 30
    SetFlash(0, 0, 500, 7000, 500)
    while startStamina > 0 do
        Wait(1000)
        startStamina -= 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 51 then
            SetFlash(0, 0, 500, 7000, 500)
            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
        end
    end
    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
end

local function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end

local function CrackBaggyEffect()
    local startStamina = 8
    local ped = PlayerPedId()
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.3)
    while startStamina > 0 do
        Wait(1000)
        if math.random(1, 100) < 10 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina -= 1
        if math.random(1, 100) < 60 and IsPedRunning(ped) then
            SetPedToRagdoll(ped, math.random(1000, 2000), math.random(1000, 2000), 3, false, false, false)
        end
        if math.random(1, 100) < 51 then
            AlienEffect()
        end
    end
    if IsPedRunning(ped) then
        SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end

local function CokeBaggyEffect()
    local startStamina = 20
    local ped = PlayerPedId()
    AlienEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.1)
    while startStamina > 0 do
        Wait(1000)
        if math.random(1, 100) < 20 then
            RestorePlayerStamina(PlayerId(), 1.0)
        end
        startStamina -= 1
        if math.random(1, 100) < 10 and IsPedRunning(ped) then
            SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
        end
        if math.random(1, 300) < 10 then
            AlienEffect()
            Wait(math.random(3000, 6000))
        end
    end
    if IsPedRunning(ped) then
        SetPedToRagdoll(ped, math.random(1000, 3000), math.random(1000, 3000), 3, false, false, false)
    end
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end


function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(5000, 8000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end

function AddArmor()
    local a = 15
    while a > 0 do
        Wait(math.random(750, 1150))
        a = a - 1
        AddArmourToPed(PlayerPedId(), 1)
    end
end

function AddHealth()
    if not healing then
        healing = true
    else
        return
    end

    local count = 30
    while count > 0 do
        Wait(1000)
        count = count - 1
        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 1)
    end
    healing = false
end

function LSDEffect()
    local ped = PlayerPedId()
    ShakeGameplayCam("JOLT_SHAKE", 10.0)
    Wait(500)
    DoScreenFadeOut(1000)
    Wait(2000)
    DoScreenFadeIn(1000)
    StartScreenEffect("DMT_flight")
    SetPedMovementClipset(ped, "move_m@drunk@moderatedrunk", 1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
    ShakeGameplayCam('SKY_DIVING_SHAKE', 1.0)
    local i = 0
    while i < 7 do
        Wait(7000)
        -- if math.random(1,100) < 25 then
        --     if IsPedRunning(ped) or IsPedSprinting(ped) then
        --         SetPedToRagdollWithFall(ped, 1500, 2000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
        --     else
        --         SetPedToRagdoll(ped, 1500, 2000, 3, true, true, false)
        --     end
        -- end
        i = i + 1
    end
    DoScreenFadeOut(1000)
    Wait(2000)
    DoScreenFadeIn(1000)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    StopScreenEffect('DMT_flight')
    ResetPedMovementClipset(ped, 1.0)
    StopGameplayCamShaking()
end

function EatBurgerItem(itemName)
    if not IsAnimated then
		prop_name = 'prop_cs_burger_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), 1.0, 1.0, 1.0, 1, 1, 0)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			SetCurrentPedWeapon(PlayerPedId(), 0xA2719263)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.07, 0.02, 120.0, 16.0, 60.0, 1, 0, 0, 0, 2, 1)
            loadAnimDict('mp_player_inteat@burger')
            TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

            Citizen.Wait(5000)
            IsAnimated = false
            ClearPedSecondaryTask(playerPed)
            DeleteObject(prop)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
            TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
		end)
	end
end

function DrinkAlcoholItem(itemName)
    if not IsAnimated then
		prop_name = 'prop_beer_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.05, -0.1, 0.09, 240.0, -60.0, 0.0, true, true, false, true, 1, true)

            loadAnimDict('mp_player_intdrink')
            TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 7000, 0, 1, true, true, true)
            Citizen.Wait(math.random(3000, 6000))
            IsAnimated = false
            ClearPedSecondaryTask(playerPed)
            DeleteObject(prop)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
            alcoholCount = alcoholCount + 1
            
            if alcoholCount > 1 and alcoholCount < 4 then
                TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
            elseif alcoholCount >= 4 then
                if not isDrunk then drunkThread() end
                TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
            end
		end)

	end
end

function DrinkCoffeeItem(itemName)
    if not IsAnimated then
		prop_name = 'prop_fib_coffee'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.1, -0.01, 0.03, 90.0, 270.0, 180.0, true, true, false, true, 1, true)

			loadAnimDict('mp_player_intdrink')
            TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 6000, 0, 1, true, true, true)
            Citizen.Wait(5000)
            IsAnimated = false
            ClearPedSecondaryTask(playerPed)
            DeleteObject(prop)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
		end)

	end
end

function EatSandwichItem(itemName)
    if not IsAnimated then
		prop_name ='prop_sandwich_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.00, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.13, 0.05, 0.02, -50.0, 16.0, 60.0, 1, 0, 0, 0, 2, 1)

			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'tasty', 0.4)
			loadAnimDict('mp_player_inteat@burger')
            TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

            Citizen.Wait(5000)
            IsAnimated = false
            ClearPedSecondaryTask(playerPed)
            DeleteObject(prop)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            print(itemName)
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
            TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
		end)

	end
end

function EatSteakItem(itemName)
    if not IsAnimated then
		prop_name = 'prop_cs_steak'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

            loadAnimDict('mp_player_inteat@burger')
            TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

            Citizen.Wait(5000)
            IsAnimated = false
            ClearPedSecondaryTask(playerPed)
            DeleteObject(prop)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
            TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        
		end)

	end
end

function EatCandyItem(itemName)
    if not IsAnimated then
		prop_name = 'prop_choc_ego'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.035, 0.009, -30.0, -240.0, -120.0, true, true, false, true, 1, true)

			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'tasty', 0.4)
			loadAnimDict('mp_player_inteat@burger')
            TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

            Citizen.Wait(5000)
            IsAnimated = false
            ClearPedSecondaryTask(playerPed)
            DeleteObject(prop)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
            TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        
		end)

	end
end

function DrinkSodaItem(itemName)
    if not IsAnimated then
		prop_name = 'prop_ecola_can' --ng_proc_sodacan_01a
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.008, 0.03, 240.0, -60.0, 0.0, true, true, false, true, 1, true)

			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'tasty', 0.4)
            loadAnimDict('mp_player_intdrink')
            TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
            Citizen.Wait(5000)
            IsAnimated = false
            ClearPedSecondaryTask(playerPed)
            DeleteObject(prop)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
		end)

	end
end

-- Events

RegisterNetEvent('consumables:client:Eat', function(itemName)
    if itemName == 'tosti' or itemName == 'baconeggncheese' or itemName == 'burger-bleeder' or itemName == 'burger-moneyshot' or itemName == 'burger-torpedo' or itemName == 'burger-heartstopper' or itemName == 'burger-meatfree' then
        EatBurgerItem(itemName)
    elseif itemName == 'sandwich' or itemName == 'bfburrito' then
        EatSandwichItem(itemName)
    elseif itemName == 'cooked_meat' or itemName == 'cutfish' then
        EatSteakItem(itemName)
    elseif itemName == 'twerks_candy' or itemName == 'snikkel_candy' then
        EatCandyItem(itemName)
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
        QBCore.Functions.Progressbar("eat_something", "Eating..", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumeablesEat[itemName])
            TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        end)
    end
    
end)

RegisterNetEvent('consumables:client:Drink', function(itemName)
    if itemName == 'sprunk' or itemName == 'kurkakola' then
        DrinkSodaItem(itemName)
    elseif itemName == 'greentea' or itemName == 'caramellatte' or itemName == 'espressoshot' or itemName == 'americano' or itemName == 'pepmocha' or itemName == 'boba' then
        DrinkCoffeeItem(itemName)
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
        QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
        end)
    end
end)

RegisterNetEvent('consumables:client:DrinkCoffee', function(itemName)
    DrinkCoffeeItem(itemName)
    -- local playerPed = PlayerPedId()
    -- TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    -- -- Citizen.Wait(6000)
    -- ClearPedSecondaryTask(playerPed)
    -- QBCore.Functions.Progressbar("drink_something", "Drinking..", 5000, false, true, {
    --     disableMovement = false,
    --     disableCarMovement = false,
	-- 	disableMouse = false,
	-- 	disableCombat = true,
    -- }, {}, {}, {}, function() -- Done
    --     TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
    --     -- TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    --     TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
    -- end)
end)

RegisterNetEvent('consumables:client:DrinkAlcohol', function(itemName)
    DrinkAlcoholItem(itemName)
    -- TriggerEvent('animations:client:EmoteCommandStart', {"drink"})
    -- QBCore.Functions.Progressbar("snort_coke", "Drinking liquor..", math.random(3000, 6000), false, true, {
    --     disableMovement = false,
    --     disableCarMovement = false,
    --     disableMouse = false,
    --     disableCombat = true,
    -- }, {}, {}, {}, function() -- Done
    --     TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    --     TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
    --     TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesAlcohol[itemName])
    --     alcoholCount = alcoholCount + 1
        
    --     if alcoholCount > 1 and alcoholCount < 4 then
    --         TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
    --     elseif alcoholCount >= 4 then
    --         if not isDrunk then drunkThread() end
    --         TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
    --     end


    -- end, function() -- Cancel
    --     TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    --     QBCore.Functions.Notify("Cancelled..", "error")
    -- end)
end)

RegisterNetEvent('consumables:client:Cokebaggy', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar("snort_coke", "Quick sniff..", math.random(5000, 8000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("consumables:server:useCokeBaggy")
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cokebaggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 200)
        CokeBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:Crackbaggy', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar("snort_coke", "Smoking crack..", math.random(7000, 10000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("consumables:server:useCrackBaggy")
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["crack_baggy"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
        CrackBaggyEffect()
    end, function() -- Cancel
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent('consumables:client:EcstasyBaggy', function()
    QBCore.Functions.Progressbar("use_ecstasy", "Pops Pills", 3000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("consumables:server:useXTCBaggy")
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["xtcbaggy"], "remove")
        EcstasyEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Failed", "error")
    end)
end)

RegisterNetEvent('consumables:client:oxy', function()
    QBCore.Functions.Progressbar("use_oxy", "Healing", 2000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerServerEvent("consumables:server:useOxy")
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["oxy"], "remove")
        ClearPedBloodDamage(PlayerPedId())
		HealOxy()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Canceled", "error")
    end)
end)

RegisterNetEvent('consumables:client:peyote', function()
    local animals = {
        "a_c_boar",
        "a_c_cat_01",
        "a_c_cow",
        "a_c_deer",
        "a_c_pig",
        "a_c_pug",
        "a_c_rat",
        "a_c_husky",
        "a_c_poodle",
        "a_c_pug",
        "a_c_retriever",
        "a_c_shepherd",
        "a_c_westy",
    }
    local pedmodel = animals[math.random(1,#animals)]
    print(pedmodel)
    QBCore.Functions.Progressbar("use_peyote", "Eating", 2000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
		animDict = "mp_suicide",
		anim = "pill",
		flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["peyote"], "remove")
        ClearPedBloodDamage(PlayerPedId())
        DoScreenFadeOut(2000)
        while not IsScreenFadedOut() do Wait(10) end
        Wait(500)
		TriggerEvent("qb-admin:client:SetModel", tostring(pedmodel))
        DoScreenFadeIn(2000)
        local gender = "male"
        if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then gender = "female" end
        if gender == "male" then
            pedmodel = "mp_m_freemode_01"
        else
            pedmodel = "mp_f_freemode_01"
        end
        Wait(60 * 1000 * 5)
        DoScreenFadeOut(2000)
        while not IsScreenFadedOut() do Wait(10) end
        Wait(500)
        TriggerEvent("qb-admin:client:SetModel", tostring(pedmodel))
        TriggerServerEvent("qb-clothes:loadPlayerSkin")
        DoScreenFadeIn(2000)
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mp_suicide", "pill", 1.0)
        QBCore.Functions.Notify("Canceled", "error")
    end)
end)

RegisterNetEvent('consumables:client:meth', function()
    QBCore.Functions.Progressbar("snort_meth", "Smoking Ass Meth", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerServerEvent("consumables:server:useMeth")
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["meth"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 300)
		TriggerEvent("evidence:client:SetStatus", "agitated", 300)
        MethBagEffect()
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
	end)
end)

RegisterNetEvent('consumables:client:UseJoint', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["joint"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

RegisterNetEvent('consumables:client:UseCig', function()
    QBCore.Functions.Progressbar("smoke_joint", "Lighting cigarette..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["cigs"], "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke"})
        end
        -- TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end)
end)

RegisterNetEvent('consumables:client:UseParachute', function()
    EquipParachuteAnim()
    QBCore.Functions.Progressbar("use_parachute", "Putting on parachute..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        local ped = PlayerPedId()
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["parachute"], "remove")
        GiveWeaponToPed(ped, `GADGET_PARACHUTE`, 1, false, false)
        local ParachuteData = {
            outfitData = {
                ["bag"]   = { item = 7, texture = 0},  -- Adding Parachute Clothing
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', ParachuteData)
        ParachuteEquiped = true
        TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, false, false, false)
    end)
end)

RegisterNetEvent('consumables:client:ResetParachute', function()
    if ParachuteEquiped then
        EquipParachuteAnim()
        QBCore.Functions.Progressbar("reset_parachute", "Packing parachute..", 40000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            local ped = PlayerPedId()
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["parachute"], "add")
            local ParachuteRemoveData = {
                outfitData = {
                    ["bag"] = { item = 0, texture = 0} -- Removing Parachute Clothing
                }
            }
            TriggerEvent('qb-clothing:client:loadOutfit', ParachuteRemoveData)
            TaskPlayAnim(ped, "clothingshirt", "exit", 8.0, 1.0, -1, 49, 0, false, false, false)
            TriggerServerEvent("qb-smallpenis:server:AddParachute")
            ParachuteEquiped = false
        end)
    else
        QBCore.Functions.Notify("You dont have a parachute!", "error")
    end
end)

RegisterNetEvent('consumables:client:UseArmor', function()
    if GetPedArmour(PlayerPedId()) >= 75 then QBCore.Functions.Notify('You already have enough armor on!', 'error') return end
    QBCore.Functions.Progressbar("use_armor", "Putting on the body armour..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["armor"], "remove")
        TriggerServerEvent('hospital:server:SetArmor', 75)
        TriggerServerEvent("consumables:server:useArmor")
        SetPedArmour(PlayerPedId(), 75)
    end)
end)

RegisterNetEvent('consumables:client:UseHeavyArmor', function()
    if GetPedArmour(PlayerPedId()) == 100 then QBCore.Functions.Notify('You already have enough armor on!', 'error') return end
    local ped = PlayerPedId()
    local PlayerData = QBCore.Functions.GetPlayerData()
    QBCore.Functions.Progressbar("use_heavyarmor", "Putting on body armour..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        if PlayerData.charinfo.gender == 0 then
            currentVest = GetPedDrawableVariation(ped, 9)
            currentVestTexture = GetPedTextureVariation(ped, 9)
            if GetPedDrawableVariation(ped, 9) == 7 then
                SetPedComponentVariation(ped, 9, 19, GetPedTextureVariation(ped, 9), 2)
            else
                SetPedComponentVariation(ped, 9, 39, 2, 2) -- Blue
            end
        else
            currentVest = GetPedDrawableVariation(ped, 30)
            currentVestTexture = GetPedTextureVariation(ped, 30)
            SetPedComponentVariation(ped, 9, 30, 0, 2)
        end
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heavyarmor"], "remove")
        TriggerServerEvent("consumables:server:useHeavyArmor")
        SetPedArmour(ped, 100)
    end)
end)

RegisterNetEvent('consumables:client:ResetArmor', function()
    local ped = PlayerPedId()
    if currentVest ~= nil and currentVestTexture ~= nil then
        QBCore.Functions.Progressbar("remove_armor", "Removing the body armour..", 2500, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 9, currentVest, currentVestTexture, 2)
            SetPedArmour(ped, 0)
            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["heavyarmor"], "add")
            TriggerServerEvent('consumables:server:resetArmor')
        end)
    else
        QBCore.Functions.Notify("You\'re not wearing a vest..", "error")
    end
end)

RegisterNetEvent('consumables:client:LSD', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar("take_lsd", "Quick lick..", math.random(1000,2000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "switch@trevor@trev_smoking_meth",
        anim = "trev_smoking_meth_loop",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["lsd"], "remove")
        TriggerEvent("evidence:client:SetStatus", "widepupils", 200)
        LSDEffect()
    end, function() -- Cancel
        StopAnimTask(ped, "switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end)

-- RegisterNetEvent('consumables:client:UseRedSmoke', function()
--     if ParachuteEquiped then
--         local ped = PlayerPedId()
--         SetPlayerParachuteSmokeTrailColor(ped, 255, 0, 0)
--         SetPlayerCanLeaveParachuteSmokeTrail(ped, true)
--         TriggerEvent("inventory:client:Itembox", QBCore.Shared.Items["smoketrailred"], "remove")
--     else
--         QBCore.Functions.Notify("You need to have a paracute to activate smoke!", "error")
--     end
-- end)


local DRUNK_ANIM_SET = "move_m@drunk@verydrunk"

local DRUNK_DRIVING_EFFECTS = {
    1, -- brake
    7, --turn left + accelerate
    8, -- turn right + accelerate
    23, -- accelerate
    4, -- turn left 90 + braking
    5, -- turn right 90 + braking
}

local function getRandomDrunkCarTask()
    math.randomseed(GetGameTimer())

    return DRUNK_DRIVING_EFFECTS[math.random(#DRUNK_DRIVING_EFFECTS)]
end

-- NOTE: We might want to check if a player already has an effect
function drunkThread()
    local playerPed = PlayerPedId()
    isDrunk = true
    -- print("start drunk")
    RequestAnimSet(DRUNK_ANIM_SET)
    while not HasAnimSetLoaded(DRUNK_ANIM_SET) do
        Wait(5)
    end

    SetPedMovementClipset(playerPed, DRUNK_ANIM_SET)
    ShakeGameplayCam("DRUNK_SHAKE", 3.0)
    SetPedIsDrunk(playerPed, true)
    SetTransitionTimecycleModifier("spectator5", 10.00)
    Wait(1000)
    while isDrunk do
        -- print("DRUNK EFFECT")
        local vehPedIsIn = GetVehiclePedIsIn(playerPed)
        local isPedInVehicleAndDriving = (vehPedIsIn ~= 0) and (GetPedInVehicleSeat(vehPedIsIn, -1) == playerPed)

        if isPedInVehicleAndDriving then
            local randomTask = getRandomDrunkCarTask()
            TaskVehicleTempAction(playerPed, vehPedIsIn, randomTask, 500)
        end

        Wait(5000)
    end

   
    -- print("stop drunk")
    isDrunk = false
    SetTransitionTimecycleModifier("default", 10.00)
    StopGameplayCamShaking(true)
    ResetPedMovementClipset(PlayerPedId())
    RemoveAnimSet(DRUNK_ANIM_SET)
end


--Threads

CreateThread(function()
    while true do
        Wait(10)
        if alcoholCount > 0 then
            Wait(1000 * 60 * 1)
            alcoholCount = alcoholCount - 1
        else
            isDrunk = false
            Wait(2000)
        end

        
    end
end)
