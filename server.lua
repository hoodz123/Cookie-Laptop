local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("cclaptop", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('cookie-laptop:client:PousarMala', source)
    end
end)

RegisterNetEvent('cookie-laptop:server:RemoverMala', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    Player.Functions.RemoveItem('cclaptop', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cclaptop'], "remove")
end)