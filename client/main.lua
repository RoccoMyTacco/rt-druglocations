local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("qb-druglocations:client:ShowMarkers")
AddEventHandler("qb-druglocations:client:ShowMarkers", function()
    local percentage = #Config.Druglocations
    local rnum = math.random(1,percentage)
    local DrugName = Config.Druglocations[rnum].drugname
    local DrugColor = Config.Druglocations[rnum].drugcolor
    local DrugBlip = Config.Druglocations[rnum].drugblip
    local CircleColor = Config.Druglocations[rnum].radiuscolor
    local Duration = Config.blipduration * 1000
    local DrugLocation = Config.Druglocations[rnum].druglocation
    QBCore.Functions.Notify('You found random coordinates on the note', 'success')
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar("use_note", "Finding Coordinates on your map..", 10000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {
        animDict = "anim@amb@business@weed@weed_inspecting_high_dry@",
		anim = "weed_inspecting_high_base_inspector",
        flags = 49,
    }, {}, {}, function()
        StopAnimTask(ped, "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
        QBCore.Functions.Notify('You have found the coordinates on your map', 'success')
        local blip1 = AddBlipForCoord(DrugLocation)
        SetBlipSprite(blip1, DrugBlip)
        SetBlipAsShortRange(blip1, true)
        SetBlipScale(blip1, 0.85)
        SetBlipColour(blip1, DrugColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(DrugName)
        EndTextCommandSetBlipName(blip1)
        local blip4 = AddBlipForRadius(DrugLocation, 100.0)
        SetBlipRotation(blip4, 0)
        SetBlipColour(blip4, CircleColor)
        Wait(Duration)
        RemoveBlip(blip1)
        RemoveBlip(blip4)
        StopAnimTask(ped, "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
    end)
end)

