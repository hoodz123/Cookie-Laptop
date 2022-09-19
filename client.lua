local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mt-clothingbag:client:PousarMala', function()
    QBCore.Functions.Progressbar('name_here', 'PUTTING LAPTOP ON FLOOR...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'random@domestic',
        anim = 'pickup_low',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        TriggerEvent('mt-clothingbag:client:SpawnMala')
		exports['okokNotify']:Alert("HackMaster Activated", "Please Step Back From The Laptop", 3500, "success")
    end)
end)

RegisterNetEvent('mt-clothingbag:client:SpawnMala', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local model = `hei_prop_hst_laptop`
    RequestModel(model)
    while (not HasModelLoaded(model)) do
        Wait(1)
    end
    local obj = CreateObject(model, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(obj)
    SetEntityAsMissionEntity(obj)

    Wait(500)

    TriggerEvent('mt-clothingbag:client:AbrirMala', obj)
end)

RegisterNetEvent('mt-clothingbag:client:AbrirMala', function(obj)
    QBCore.Functions.Progressbar('name_here', 'Hacking InTo JDSports...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        anim = 'machinic_loop_mechandplayer',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
        TriggerEvent('mt-clothingbag:client:ProgressDespawnMala', obj)
		exports['okokNotify']:Alert("Portable Menu Will Be", "Activated", 3500, "info")
    end)
end)

RegisterNetEvent('mt-clothing:client:AbrirMenu', function()
local success = exports['boostinghack']:StartHack()
if success then
    TriggerEvent('qb-clothing:client:openMenu')
  else
	 exports['okokNotify']:Alert("You Failed To Complete The Hack", "VPN EXPOSED", 3500, "error")
    end
end)

RegisterNetEvent('mt-clothingbag:client:ProgressDespawnMala', function(obj)
    QBCore.Functions.Progressbar('name_here', 'Hacking Past Vpn...', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'random@domestic',
        anim = 'pickup_low',
        flags = 16,
    }, {}, {}, function()

        Wait(500)

        QBCore.Functions.Progressbar('name_here', 'PACKING LAPTOP AWAY...', 2000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'random@domestic',
            anim = 'pickup_low',
            flags = 16,
        }, {}, {}, function()
            TriggerEvent('mt-clothingbag:client:DespawnMala', obj)
        end)
    end)
end)

RegisterNetEvent('mt-clothingbag:client:DespawnMala', function(obj)
    DeleteObject(obj)
    TriggerServerEvent('mt-clothingbag:server:RemoverMala')
    TriggerEvent('mt-clothing:client:AbrirMenu')
	exports['okokNotify']:Alert("Hack Chip Has Now Been Registered", "COMPLETE THE HACK", 3500, "info")
end)
