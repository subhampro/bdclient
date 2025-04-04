local playersProcessingCocaLeaf = {}

RegisterServerEvent('esx_illegal:pickedUpCocaLeaf')
AddEventHandler('esx_illegal:pickedUpCocaLeaf', function()
	-- local xPlayer = ESX.GetPlayerFromId(source)
	-- local xItem = xPlayer.getInventoryItem('coca_leaf')
	
	
	    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	local recoleccionsuerte = math.random(1,100)
	local coca_leaf = xPlayer.getInventoryItem('coca_leaf').count	
	local coca_leaf = xPlayer.getInventoryItem('coca_leaf').count	

-- 	if xItem.weight ~= 5 and (xItem.count + 1) > xItem.weight then
-- 		TriggerClientEvent('esx:showNotification', _source, _U('coca_leaf_inventoryfull'))
-- 	else
-- 		xPlayer.addInventoryItem(xItem.name, 1)
-- 	end
-- end)



if xPlayer.getInventoryItem('coca_leaf').count >= 30 then
         	TriggerClientEvent('esx:showNotification', source, '~r~You cant carry more Coca Leaf')
else 
			xPlayer.addInventoryItem("coca_leaf", 1)

end		
end)


RegisterServerEvent('esx_illegal:processCocaLeaf')
AddEventHandler('esx_illegal:processCocaLeaf', function()
	if not playersProcessingCocaLeaf[source] then
		local _source = source

		playersProcessingCocaLeaf[_source] = ESX.SetTimeout(Config.Delays.CokeProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCocaLeaf, xCoke = xPlayer.getInventoryItem('coca_leaf'), xPlayer.getInventoryItem('coke')

			if xCoke.weight ~= 10 and (xCoke.count + 1) > xCoke.weight then
				TriggerClientEvent('esx:showNotification', _source, _U('coke_processingfull'))
			elseif xCocaLeaf.count < 3 then
				TriggerClientEvent('esx:showNotification', _source, _U('coke_processingenough'))
			else
				xPlayer.removeInventoryItem('coca_leaf', 3)
				xPlayer.addInventoryItem('coke', 1)

				TriggerClientEvent('esx:showNotification', _source, _U('coke_processed'))
			end

			playersProcessingCocaLeaf[_source] = nil
		end)
	else
		print(('esx_illegal: %s attempted to exploit coke processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingCocaLeaf[playerID] then
		ESX.ClearTimeout(playersProcessingCocaLeaf[playerID])
		playersProcessingCocaLeaf[playerID] = nil
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
