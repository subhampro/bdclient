local playersProcessingPoppyResin = {}

RegisterServerEvent('esx_illegal:pickedUpPoppy')
AddEventHandler('esx_illegal:pickedUpPoppy', function()
	-- local xPlayer = ESX.GetPlayerFromId(source)
	-- local xItem = xPlayer.getInventoryItem('poppyresin')
	
	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	local recoleccionsuerte = math.random(1,100)
	local poppyresin = xPlayer.getInventoryItem('poppyresin').count	
	local poppyresin = xPlayer.getInventoryItem('poppyresin').count	

-- 	if xItem.weight ~= 5 and (xItem.count + 1) > xItem.weight then
-- 		TriggerClientEvent('esx:showNotification', _source, _U('poppy_inventoryfull'))
-- 	else
-- 		xPlayer.addInventoryItem(xItem.name, 1)
-- 	end
-- end)

if xPlayer.getInventoryItem('poppyresin').count >= 20 then
         	TriggerClientEvent('esx:showNotification', source, '~r~You cant carry more Poppy Resin')
else 
			xPlayer.addInventoryItem("poppyresin", 1)

end		
end)

RegisterServerEvent('esx_illegal:processPoppyResin')
AddEventHandler('esx_illegal:processPoppyResin', function()
	if not playersProcessingPoppyResin[source] then
		local _source = source

		playersProcessingPoppyResin[_source] = ESX.SetTimeout(Config.Delays.HeroinProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xPoppyResin, xHeroin = xPlayer.getInventoryItem('poppyresin'), xPlayer.getInventoryItem('heroin')

			if xHeroin.weight ~= 10 and (xHeroin.count + 1) > xHeroin.weight then
				TriggerClientEvent('esx:showNotification', _source, _U('heroin_processingfull'))
			elseif xPoppyResin.count < 1 then
				TriggerClientEvent('esx:showNotification', _source, _U('heroin_processingenough'))
			else
				xPlayer.removeInventoryItem('poppyresin', 1)
				xPlayer.addInventoryItem('heroin', 1)

				TriggerClientEvent('esx:showNotification', _source, _U('heroin_processed'))
			end

			playersProcessingPoppyResin[_source] = nil
		end)
	else
		print(('esx_illegal: %s attempted to exploit heroin processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingPoppyResin[playerID] then
		ESX.ClearTimeout(playersProcessingPoppyResin[playerID])
		playersProcessingPoppyResin[playerID] = nil
	end
end

RegisterServerEvent('esx_illegal:cancelProcessing')
AddEventHandler('esx_illegal:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)
