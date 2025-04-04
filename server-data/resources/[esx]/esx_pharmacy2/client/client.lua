ESX = nil


local store = { 
    [_U('open_store')] = { title="Doctor's Personal Store", size= 10, colour=34, id=3, x = 333.55, y = -585.03, z = 28.79}, 
} 

local NPC = {
    {seller = true, model = "s_m_m_doctor_01", x = 318.016, y = -1078.428, z = 28.479, h = 349.337},
}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	if Config.EnableNpc then
			for _, v in pairs(NPC) do
				RequestModel(GetHashKey(v.model))
				while not HasModelLoaded(GetHashKey(v.model)) do
					Wait(1)
				end
				local npc = CreatePed(4, v.model, v.x, v.y, v.z, v.h,  false, true)
				SetPedFleeAttributes(npc, 0, 0)
				SetPedDropsWeaponsWhenDead(npc, false)
				SetPedDiesWhenInjured(npc, false)
				SetEntityInvincible(npc , true)
				FreezeEntityPosition(npc, true)
				SetBlockingOfNonTemporaryEvents(npc, true)
				if v.seller then 
					RequestAnimDict("missfbi_s4mop")
					while not HasAnimDictLoaded("missfbi_s4mop") do
						Wait(1)
					end
					TaskPlayAnim(npc, "missfbi_s4mop" ,"guard_idle_a" ,8.0, 1, -1, 49, 0, false, false, false)
				else
					GiveWeaponToPed(npc, GetHashKey("WEAPON_ADVANCEDRIFLE"), 2800, true, true)
				end
			end
	end
	
	local bool = true
  
  if bool then
  
         
  
         for _, info in pairs(store) do
        
			-- info.blip = AddBlipForCoord(info.x, info.y, info.z)
   --          SetBlipSprite(info.blip, info.id)
   --          SetBlipDisplay(info.blip, 4)
   --          SetBlipColour(info.blip, info.colour)
   --          SetBlipAsShortRange(info.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.title)
            EndTextCommandSetBlipName(info.blip)
			
         end
	   
	   bool = false
   
   end
	
	
end)

Citizen.CreateThread(function()
	while true do
      
	Citizen.Wait(5)
	
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k, v in pairs(store) do
			if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 100 then
				DrawMarker(3, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 500, false, true, 2, false, false, false, false)
			end		
		end

	end
	
end)


Citizen.CreateThread(function()
	while true do
      
	Citizen.Wait(5)
	
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k, v in pairs(store) do
			if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.5 then
				DrawText3D(v.x, v.y, v.z+0.9, k, 0.80)
				if IsControlPressed(0, 38) then
					OpenPharmacyMenu()
				end
			end
		end
		
		
	end
end)

function OpenPharmacyMenu()
    ESX.UI.Menu.CloseAll()

     ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'Pharmacy_markets',
         {
            title    = _U('Pharmacy_market'),
            elements = {
				{label = ('Medikit - <span style="color:green;">1$</span>'), item = 'medikit', price = 1, amount = 1},
				{label = ('bandage - <span style="color:green;">1$</span>'), item = 'bandage', price = 1, amount = 1},
				-- {label = ('Syrup -  <span style="color:green;">350$</span>'), item = 'sciroppo', price = 350, amount = 1},
				-- {label = ('Antibiotic -  <span style="color:green;">350$</span>'), item = 'antibiotico', price = 350, amount = 1},
            }
        },
        function(data, menu)
			local item = data.current.item
			local price = data.current.price
			local amount = data.current.amount
            TriggerServerEvent('esx:Farmacia', item, price, amount)
        end,
    function(data, menu)
        menu.close()
    end)
end



function DrawText3D(x, y, z, text, scale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
 
    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)
 
    AddTextComponentString(text)
    DrawText(_x, _y)
 
    local factor = (string.len(text)) / 230
    DrawRect(_x, _y + 0.0250, 0.095 + factor, 0.06, 41, 11, 41, 100)
end