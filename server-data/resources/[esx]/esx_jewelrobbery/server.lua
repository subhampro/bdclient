ESX = nil 
local joblist = {}
local resettime = nil
local policeclosed = false

AddEventHandler('')


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_JewelRobbery:closestore')
AddEventHandler('esx_JewelRobbery:closestore', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local ispolice = false
	for i, v in pairs(Config.PoliceJobs) do
		if xPlayer.job.name == v then
			ispolice = true
			break
		end
	end
    if ispolice and resettime ~= nil then
        TriggerClientEvent('esx_JewelRobbery:policeclosure', -1)
        policeclosed = true
    elseif ispolice and resettime == nil then
        TriggerClientEvent('esx:showNotification', _source, 'Store does not appear to be damaged - unable to force closed!')          
    else
        TriggerClientEvent('esx:showNotification', _source, 'Only Law enforcment or Vangelico staff can decide if store is closed!')           
    end
end)

function AnnounceJobs()
    local police = 0
    for i, v in pairs(joblist) do
        for u, j in pairs(Config.PoliceJobs) do
            if v.job == j then 
                police = police + 1 
            end
        end
    end
    TriggerClientEvent('esx_JewelRobbery:PoliceCount', -1, police)
end

RegisterServerEvent('esx_JewelRobbery:playsound')
AddEventHandler('esx_JewelRobbery:playsound', function(x,y,z, soundtype)
    TriggerClientEvent('esx_JewelRobbery:playsound', -1, x, y, z, soundtype)
end)

RegisterServerEvent('esx_JewelRobbery:setcase')
AddEventHandler('esx_JewelRobbery:setcase', function(casenumber, switch)
    _source = source
    if not Config.CaseLocations[casenumber].Broken then
        Config.CaseLocations[casenumber].Broken  = true
        TriggerEvent('esx_JewelRobbery:RestTimer')
        TriggerClientEvent('esx_JewelRobbery:setcase', -1, casenumber, true)
        TriggerEvent('esx_JewelRobbery:AwardItems', _source)
    end
end)

RegisterServerEvent('esx_JewelRobbery:policenotify')
AddEventHandler('esx_JewelRobbery:policenotify', function()
    TriggerClientEvent('esx_JewelRobbery:policenotify', -1)    
end)

RegisterServerEvent('esx_JewelRobbery:changejob')
AddEventHandler('esx_JewelRobbery:changejob', function(job)
    _source = source
    local updated = false
    for i, v in pairs(joblist) do
        if v.id == _source then
            v.job = job.name
            updated = true
            break
        end
    end
    if not updated then
        local buildlist = {
            id = _source,
            job = job.name
        }
        table.insert(joblist, buildlist)
    end
    AnnounceJobs()
end)

RegisterServerEvent('esx_JewelRobbery:loadconfig')
AddEventHandler('esx_JewelRobbery:loadconfig', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local buildlist = {
        id = _source,
        job = xPlayer.job.name,
    }
    table.insert(joblist, buildlist)
    AnnounceJobs()
    TriggerClientEvent('esx_JewelRobbery:loadconfig', _source, Config.CaseLocations)
    if policeclosed then
        TriggerClientEvent('esx_JewelRobbery:policeclosure', _source)
    end

end)



AddEventHandler('esx_JewelRobbery:RestTimer', function()
    if resettime == nil then
        totaltime = Config.ResetTime * 60
        resettime = os.time() + totaltime

        while os.time() < resettime do
            print('Compairing ('..tostring(os.time()).. ') - ('.. tostring(resettime) .. ')' )
            Citizen.Wait(2350)
        end

        for i, v in pairs(Config.CaseLocations) do
            v.Broken = false
        end
        TriggerClientEvent('esx_JewelRobbery:resetcases', -1, Config.CaseLocations)
        resettime = nil
        policeclosed = false
    end
end)

AddEventHandler('playerDropped', function()
    _source = source
    for i, v in pairs(joblist) do
        if v.id == _source then
            table.remove(joblist, i)
            break
        end
    end
    AnnounceJobs()
end)

AddEventHandler('esx_JewelRobbery:AwardItems', function(serverid)
    local xPlayer = ESX.GetPlayerFromId(serverid)

    local randomitem = math.random(1,100)
    for i, v in pairs(Config.ItemDrops) do 
        if randomitem <= v.chance then
            randomamount = math.random(1, v.max)
            sourceItem = xPlayer.getInventoryItem(v.name)
            if sourceItem.limit ~= nil then
                if sourceItem.limit ~= -1 and (sourceItem.count + randomamount) > sourceItem.limit then
                    if sourceItem.count < sourceItem.limit then
                        randomamount = sourceItem.limit - sourceItem.count
                        xPlayer.addInventoryItem(v.name, randomamount)
                    else
                        TriggerClientEvent('esx:showNotification', _source, 'Not enough room in your inventory to carry more '.. sourceItem.label)
                    end
                else
                    xPlayer.addInventoryItem(v.name, randomamount)
                end
                break
            else
                xPlayer.addInventoryItem(v.name, randomamount)
                break
            end
        end
    end

end)
