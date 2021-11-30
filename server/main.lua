local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("drugnote", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("qb-druglocations:client:ShowMarkers", -1)
    end
end)