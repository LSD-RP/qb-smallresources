local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('vehiclelock:getOwnedVehicles', function(source, cb, plate)
    local Player = QBCore.Functions.GetPlayer(source)
	exports.oxmysql:execute('SELECT 1 FROM player_vehicles WHERE citizenid = @citizenid AND plate LIKE @plate', {
		['@citizenid'] = Player.PlayerData.citizenid,
		['@plate'] = '%' ..plate.. '%'
	}, function(result)
		if result[1] == nil then
			exports.oxmysql:execute('SELECT 1 from player_vehicles WHERE citizenid = @citizenid AND plate = @plate', {
				['@citizenid'] = Player.PlayerData.citizenid,
				['@plate'] = plate
			}, function(result2)
				cb(result2[1] ~= nil)
			end)
		else
			cb(result[1] ~= nil)
		end
		
	end)
end)
